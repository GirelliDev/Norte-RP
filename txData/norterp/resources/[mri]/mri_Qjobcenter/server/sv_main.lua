QBCore = exports['qb-core']:GetCoreObject()
jobname = nil

RegisterNetEvent('ss-jobcenter:server:openJobCenter', function()
    local source = source
    TriggerClientEvent('ss-jobcenter:client:openJobCenter', source, Config)
end)

RegisterNetEvent('ss-jobcenter:server:setup', function()
    TriggerClientEvent('ss-jobcenter:client:setup', source, Config.Main)
end)

RegisterNetEvent('ss-jobcenter:server:select', function(data)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local playerCoords = GetEntityCoords(GetPlayerPed(source))
    local lastcoord = nil

    for _, location in pairs(Config.Main.Locations) do
        local distance = #(playerCoords - vector3(location.coords.x, location.coords.y, location.coords.z))

        if distance < 3.5 then
            if data.type == 'job' then
                local jobExists = false

                for _, job in pairs(Config.Jobs) do
                    if job.rank == data.job then
                        jobname = job.name
                        jobExists = true
                        break
                    end
                end

                if jobExists then
                    Player.Functions.SetJob(data.job, 0)
                    TriggerClientEvent('QBCore:Notify', source, 'Você foi contratado: ' .. jobname .. '!', 'success')
                else
                    TriggerClientEvent('QBCore:Notify', source, 'Estamos sem vaga no momento!', 'error')
                end

            elseif data.type == 'loc' then
                local jobExists = false

                for _, job in pairs(Config.Jobs) do
                    if job.rank == data.job then
                        jobname = job.name
                        jobExists = true
                        lastcoord = job.location
                        break
                    end
                end

                if jobExists then
                    -- exports["pickle_waypoints"]:addWaypoint(source, jobname, lastcoord, {
                    --     -- icon = "default", -- or "default" to use internal icon for color support.
                    --     color = {255, 255, 255, 100}, -- rgba value, used for internal icon and marker.
                    --     clearEnter = true, -- Upon entering the area, remove the waypoint.
                    --     blipId = 1, -- Display waypoint on map, or set to nil to disable.
                    --     blipColor = 0, -- Blip color on the map.
                    -- })
                    TriggerClientEvent("pickle_waypoints:addWaypoint", source, jobname, lastcoord, {
                        -- icon = "default", -- or "default" to use internal icon for color support.
                        color = {100, 255, 100, 100}, -- rgba value, used for internal icon and marker.
                        clearEnter = true, -- Upon entering the area, remove the waypoint.
                        blipId = 304, -- Display waypoint on map, or set to nil to disable.
                        blipColor = 5, -- Blip color on the map.
                    })
                    TriggerClientEvent('QBCore:Notify', source, 'A localização foi marcada: ' .. jobname .. '!', 'success')
                else
                    TriggerClientEvent('QBCore:Notify', source, 'Indisponível no momento', 'error')
                end
            elseif data.type == 'license' then
                local licenseExists = false
                local license = nil

                for _, l in pairs(Config.Licenses) do
                    if l.name == data.license.name then
                        licenseExists = true
                        license = l
                        break
                    end
                end

                if licenseExists and license.item == data.license.item and license.price == data.license.price then
                    if Player.PlayerData.money.cash >= license.price then
                        Player.Functions.RemoveMoney('cash', license.price)
                        local info = {}

                        if license.item == 'id_card' then
                            info = {
                                citizenid = Player.PlayerData.citizenid,
                                firstname = Player.PlayerData.charinfo.firstname,
                                lastname = Player.PlayerData.charinfo.lastname,
                                birthdate = Player.PlayerData.charinfo.birthdate,
                                gender = Player.PlayerData.charinfo.gender,
                                nationality = Player.PlayerData.charinfo.nationality
                            }
                        elseif license.item == 'driver_license' then
                            info = {
                                firstname = Player.PlayerData.charinfo.firstname,
                                lastname = Player.PlayerData.charinfo.lastname,
                                birthdate = Player.PlayerData.charinfo.birthdate,
                                type = 'Class C Driver License'
                            }
                        elseif license.item == 'weaponlicense' then
                            info = {
                                firstname = Player.PlayerData.charinfo.firstname,
                                lastname = Player.PlayerData.charinfo.lastname,
                                birthdate = Player.PlayerData.charinfo.birthdate
                            }
                        else
                            Player.Functions.AddItem(license.item, 1, nil, info)
                            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[license.item], 'add')
                        end

                        Player.Functions.AddItem(license.item, 1, nil, info)
                        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[license.item], 'add')
                        TriggerClientEvent('QBCore:Notify', source, 'Você comprou uma ' .. license.name .. '!', 'success')
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'Você não tem dinheiro suficiente!', 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', source, 'Contate a administração.', 'error')
                end
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'Você não está no centro de emprego!', 'error')
        end
    end
end)