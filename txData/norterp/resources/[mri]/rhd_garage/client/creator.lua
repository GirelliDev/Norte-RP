local zones = require 'modules.zone'
local spawnPoint = require 'modules.spawnpoint'
local pedcreator = require 'modules.pedcreator'

--- Blip Input
---@param impound boolean
---@return promise
local function blipInput(impound, gLabel)
    local p = promise.new()
    CreateThread(function()
        ---@class BlipData
        local br = {}
        
        ::tryAgain::
        local blipinput = lib.inputDialog('BLIP', {
            { type = 'number', label = locale("input.admin.creator_bliptype"), required = true, default = impound and 68 or 357},
            { type = 'number', label = locale("input.admin.creator_blipcolor"), required = true, default = 3},
            { type = 'input', label = locale("input.admin.creator_bliplabel"), required = true, default = gLabel },
        })

        local hi = blipinput
        if not hi then
            return
        end

        if utils.string.isEmpty(hi[3]) then
            goto tryAgain
        end

        br.type = hi[1]
        br.color = hi[2]
        br.label = hi[3]
        p:resolve(br)
    end)
    return Citizen.Await(p)
end

--- Create garage input
local function createGarage ()
    zones.startCreator({
        type = "poly",
        onCreated = function (zones) ---@param zones OxZone
            local input = lib.inputDialog('RHD GARAGE (Creator)', {
                { type = 'input', label = locale("input.admin.creator_labelgarage"), placeholder = 'Alta Garage', required = true },
                { type = 'multi-select', label = locale("input.admin.creator_typevehicle"), options = {
                    {value = "car", label = "Carros"},
                    {value = "boat", label = "Barcos"},
                    {value = "helicopter", label = "Helicóptero"},
                    {value = "planes", label = "Aviões"},
                    {value = "motorcycle", label = "Motocicleta"},
                    {value = "cycles", label = "Bicicleta"},
                }, required = true},
                { type = 'checkbox', label = "Use Blip", disabled = true},
                { type = 'checkbox', label = "Garagem de Apreensão"},
                { type = 'checkbox', label = "Garagem de Carros Compartilhados"},
                { type = 'checkbox', label = "Garagem com Vagas"},
                { type = 'select', label = "Abrir garagem", options = {
                    { value = "radial",     label = "Usando Radial Menu" },
                    { value = "keypressed", label = "Usando Tecla E" },
                    { value = "targetped",  label = "Usando NPC com Target" }
                }, required = true},
            })
            if input then
                -- print(input[7])
                local tPed = input[7] == 'targetped'
                local Impound = not input[5] and input[4] or false
                local label = input[1]
                local gtype = input[2]
                local blip = input[3] and blipInput(Impound, label) or nil
                local shared = input[5]
                local sp = input[6] and spawnPoint.create(zones, false, nil, gtype) or nil ---@type table<string, vector3[]|string[]>
                local interact = tPed and pedcreator.start(zones) or input[7]

                if tPed and not sp then
                    Wait(1000)
                    sp = spawnPoint.create(zones, true, nil, gtype) or nil ---@type table<string, vector3[]|string[]>
                end

                GarageZone[label] = {
                    type = gtype,
                    blip = blip,
                    zones = zones,
                    impound = Impound,
                    shared = shared,
                    spawnPoint = sp and sp.c or sp,
                    spawnPointVehicle = sp and sp.v or sp,
                    interaction = interact
                }
                
                gzf.save(GarageZone)
                utils.notify(locale("notify.admin.success_create", label:upper()), "success")
            end
        end
    })
end

--- Delete garage by index
local function delete(self)
    GarageZone[self.label --[[@as string]]] = nil
    gzf.save(GarageZone)
    utils.notify(locale("notify.admin.success_deleted", self.label --[[@as string]]), "success")
end

--- Set blip garage
local function setBlip(self)
    local k, v in self ---@type string, GarageData
    local blipContext = {
        id = "blip_setting",
        title = locale("context.admin.blip_setting"),
        menu = "rhd:action_garage",
        onBack = function()

        end,
        options = {
            {
                title = locale("context.admin.blip_edit"),
                icon = "pen-to-square",
                onSelect = function ()
                    local gBlip = v.blip

                    local placeholder = {
                        type = gBlip and gBlip.type or '',
                        color = gBlip and gBlip.color or '',
                        label = gBlip and gBlip.label or k
                    }

                    local blipinput = lib.inputDialog('BLIP', {
                        { type = 'number', label = locale("input.admin.creator_bliptype"), required = true, default = placeholder.type },
                        { type = 'number', label = locale("input.admin.creator_blipcolor"), required = true, default = placeholder.color },
                        { type = 'input', label = locale("input.admin.creator_bliplabel"), required = true, default = placeholder.label },
                    })

                    if blipinput then
                        GarageZone[k].blip = {
                            type = blipinput[1],
                            color = blipinput[2],
                            label = blipinput[3]
                        }
                        gzf.save(GarageZone)
                        utils.notify(locale("notify.admin.success_editblip"), "success")
                    end
                end
            },
            {
                title = locale("context.admin.blip_remove"),
                icon = "trash",
                onSelect = function()
                    GarageZone[k].blip = nil
                    gzf.save(GarageZone)
                    utils.notify("Blip berhasil di hapus", "success")
                end
            }
        }
    }
    utils.createMenu(blipContext)
end

--- Change garage locations
local function changeLocation(self)
    zones.startCreator({
        type = "poly",
        onCreated = function (Zones) ---@param Zones OxZone
            GarageZone[self.label --[[@as string]]].zones = Zones
            gzf.save(GarageZone)
            utils.notify(locale("notify.admin.success_changelocation"), "success")
        end
    })
end

--- Teleport to garage location
local function teleportToLocation(self)
    local coords = self.coords --[[@as vector3]]
    DoScreenFadeOut(500)
    Wait(1000)
    SetPedCoordsKeepVehicle(cache.ped, coords.x, coords.y, coords.z)
    DoScreenFadeIn(500)
end

--- Change garage label
local function changeGarageLabel(self)
    local k, v in self ---@type string, GarageData
    
    local inputLabel = lib.inputDialog(locale("input.admin.header_changelabel"), {
        { type = 'input', label = locale("input.admin.label_changelabel"), placeholder = 'Alta Garage, Pilbox Garage, Etc', required = true, min = 1 },
    })

    if inputLabel then
        local newLabel = inputLabel[1]
        GarageZone[newLabel] = v
        GarageZone[k] = nil
        gzf.save(GarageZone)
        utils.notify(locale("notify.admin.success_changelabel", newLabel))
    end
end

--- Edit the spawn point
local function setspawnpoint(self)
    local k, v in self ---@type string, GarageData
    local asp = v.spawnPoint or {}
    local avsp = v.spawnPointVehicle or {}
    local noEmpty = asp and #asp > 0

    local context = {
        id = 'rhd:csp',
        title = 'Spawn Point',
        options = {},
        onBack = function ()
            
        end,
        menu = 'rhd:action_garage'
    }

    if noEmpty then
        for i = 1, #asp do
            context.options[#context.options + 1] = {
                title = "Point #" .. i,
                icon = "location-dot",
                description = "click me to teleport to my location",
                onSelect = function()
                    local coords = asp[i]
                    DoScreenFadeOut(500)
                    Wait(1000)
                    SetPedCoordsKeepVehicle(cache.ped, coords.x, coords.y, coords.z)
                    DoScreenFadeIn(500)
                end
            }
        end
    end

    context.options[#context.options+1] = {
        title = "Edit Point",
        icon = "pen-to-square",
        onSelect = function ()
            local sp = { c = asp, v = avsp }
            local pr = spawnPoint.create(v.zones, true, sp, v.type) ---@type table<string, vector3[]|string[]>
            if not pr then return end
            GarageZone[k].spawnPoint = pr.c
            GarageZone[k].spawnPointVehicle = pr.v
            utils.notify("The spawn point has been successfully set", "success", 8000)
            gzf.save(GarageZone)
        end
    }
    utils.createMenu(context)
end

--- Add & Remove job
local function jobOptions(self)
    local k, v in self ---@type string, GarageData

    local contextJob = {
        id = "rhd_contextJob",
        title = k,
        menu = "rhd:action_garage",
        onBack = function() end,
        options = {}
    }

    if v.job and type(v.job) == "table" then
        for name, grade in pairs(v.job) do
            contextJob.options[#contextJob.options+1] = {
                title = locale("context.admin.job_description", name, grade),
                icon = "briefcase",
                onSelect = function()
                    local contextJob2 = {
                        id = "rhd_contextJob2",
                        title = name,
                        options = {
                            {
                                title = locale("context.admin.delete"),
                                icon = "trash",
                                onSelect = function ()
                                    v.job[name] = nil

                                    if not next(v.job) then
                                        v.job = nil
                                    end

                                    GarageZone[k].job = v.job
                                    utils.notify(locale("notify.admin.success_deleted_access"), "success")
                                    gzf.save( GarageZone )
                                end
                            }
                        }
                    }
                    utils.createMenu(contextJob2)
                end
            }
        end
    end

    contextJob.options[#contextJob.options+1] = {
        title = locale("context.admin.add_job"),
        icon = "plus",
        onSelect = function ()
            local input = lib.inputDialog(locale("input.admin.garage_access"), {
                { type = 'input', label = locale("input.admin.garage_access_job"), placeholder = 'police, ambulance, etc', required = true },
                { type = 'number', label = locale("input.admin.garage_access_grade_job"), required = true}
            })

            if input then
                local name, rank = input[1], input[2]
                if not v.job then v.job = {} end
                v.job[name] = rank
                GarageZone[k].job = v.job
                utils.notify(locale("notify.admin.success_added_access", input[1]))
                gzf.save( GarageZone )
            end
        end
    }

    utils.createMenu(contextJob)
end

--- Add & Remove gang
local function gangOptions(self)
    local k, v in self ---@type string, GarageData

    local contextGang = {
        id = "rhd_contextGang",
        title = k,
        menu = "rhd:action_garage",
        onBack = function() end,
        options = {}
    }

    if v.gang and type(v.gang) == "table" then
        for name, grade in pairs(v.gang) do
            contextGang.options[#contextGang.options+1] = {
                title = locale("context.admin.gang_description", name, grade),
                icon = "users",
                onSelect = function()
                    local contextGang2 = {
                        id = "rhd_contextGang2",
                        title = name,
                        options = {
                            {
                                title = locale("context.admin.delete"),
                                icon = "trash",
                                onSelect = function ()
                                    v.gang[name] = nil

                                    if not next(v.gang) then
                                        v.gang = nil
                                    end
                                    
                                    GarageZone[k].gang = v.gang
                                    utils.notify(locale("notify.admin.success_deleted_access"), "success")
                                    gzf.save( GarageZone )
                                end
                            }
                        }
                    }
                    utils.createMenu(contextGang2)
                end
            }
        end
    end

    contextGang.options[#contextGang.options+1] = {
        title = locale("context.admin.add_gang"),
        icon = "plus",
        onSelect = function ()
            local input = lib.inputDialog(locale("input.admin.garage_access"), {
                { type = 'input', label = locale("input.admin.garage_access_gang"), placeholder = 'ballas, vagos, etc', required = true },
                { type = 'number', label = locale("input.admin.garage_access_grade_gang"), required = true}
            })

            if input then
                if not v.gang then v.gang = {} end
                v.gang[input[1]] = tonumber(input[2])
                GarageZone[k].gang = v.gang
                utils.notify(locale("notify.admin.success_added_access", input[1]))
                gzf.save( GarageZone )
            end
        end
    }

    utils.createMenu(contextGang)
end

local function setVehicles(garage)
    local key = garage.index
    local value = garage.value

    local vehicles = exports.qbx_core:GetVehiclesByHash()

    local options = {}
    for k, v in pairs(vehicles) do
        options[#options + 1] = {
            label = v.name,
            value = v.model
        }
    end

    if value.vehicles then
        for k, v in pairs(value.vehicles) do
            for k2, v2 in pairs(options) do
                if v == v2.value then
                    options[k2].selected = true
                end
            end
        end
    end

    for k, v in pairs(options) do
        if v.selected then
            options[k].icon = "check"
        end
    end

    table.sort(options, function(a, b) return a.label < b.label end)

    if not value.vehicles then value.vehicles = {} end

    local input = lib.inputDialog("Carros da Garagem", {
        { type = "multi-select", label = 'Lista', placeholder = 'Selecionar', options = options, default = value.vehicles ,searchable = true, required = false }
    })

    if input then
        if not value.vehicles then value.vehicles = {} end
        value.vehicles = input[1] or {}
        GarageZone[key].vehicles = value.vehicles
        utils.notify("Lista de Veículos alterada com sucesso!", "success", 10000)
        gzf.save( GarageZone )
    end
end

local function listGarage()
    local context = {
        id = 'rhd:list_garage',
        title = locale("context.admin.listgarage_title"),
        menu = 'menu_gerencial',
        options = {
            {
                title = locale('context.admin.addnewgarage'),
                icon = 'plus',
                onSelect = createGarage
            }
        }
    }

    for k, v in pairs(GarageZone) do
        context.options[#context.options + 1] = {
            title = k,
            icon = "warehouse",
            description = locale("context.admin.listgarage_description", v.impound and "Impound" or v.shared and "Shared" or "Public", utils.garageType(v.type)),
            onSelect = function ()
                local context2 = {
                    id = "rhd:action_garage",
                    title = k,
                    menu = "rhd:list_garage",
                    onBack = function()

                    end,
                    options = {
                        {
                            title = locale("context.admin.options_delete"),
                            icon = "trash",
                            onSelect = delete,
                            args = {
                                label = k
                            }
                        },
                        {
                            title = locale("context.admin.blip_setting"),
                            icon = "map",
                            onSelect = setBlip,
                            args = {
                                k = k,
                                v = v
                            }
                        },
                        {
                            title = locale("context.admin.options_changelocation"),
                            icon = "location-dot",
                            onSelect = changeLocation,
                            args = {
                                label = k
                            }
                        },
                        {
                            title = locale("context.admin.tptoloc"),
                            icon = "location-dot",
                            onSelect = teleportToLocation,
                            args = {
                                coords = v.zones.points[1]
                            }
                        },
                        {
                            title = locale("context.admin.options_changelabel"),
                            icon = "pen-to-square",
                            onSelect = changeGarageLabel,
                            args = {
                                k = k,
                                v = v
                            }
                        },
                        {
                            title = "Locais de Spawn",
                            icon = "location-dot",
                            onSelect = setspawnpoint,
                            args = {
                                k = k,
                                v = v
                            }
                        },
                        {
                            title = "Definir Veículos",
                            icon = "car",
                            onSelect = setVehicles,
                            args = {
                                index = k,
                                value = v
                            }
                        }
                    }
                }

                if not v.impound and not v.gang then
                    context2.options[#context2.options+1] = {
                        title = locale("context.admin.job_title"),
                        icon = "briefcase",
                        onSelect = jobOptions,
                        args = {
                            k = k,
                            v = v
                        }
                    }
                end

                if not v.impound and not v.job then
                    context2.options[#context2.options+1] = {
                        title = locale("context.admin.gang_title"),
                        icon = "users",
                        onSelect = gangOptions,
                        args = {
                            k = k,
                            v = v
                        }
                    }
                end
                utils.createMenu(context2)
            end
        }
    end
    utils.createMenu(context)
end

CreateThread(function ()
    while not fw.playerLoaded do
        lib.print.warn("Wait for the garage data to finish loading")
        if Config.InDevelopment then
            lib.print.info('Use the /loaded and /reloadcache commands to load garage and player data')
        end
        Wait(1000)
    end
    
    if fw.playerLoaded then
        gzf.refresh()
        lib.print.info("Garage data has been successfully loaded")
    end
end)

RegisterNetEvent('rhd_garage:client:syncConfig', function(newconfig)
    GarageZone = newconfig
    gzf.refresh()
end)

RegisterNetEvent("rhd_garage:client:garagelist", listGarage)
