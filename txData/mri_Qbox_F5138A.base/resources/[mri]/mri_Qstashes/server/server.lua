local stashesTable = {}

function isAdmin(src)
    if not Config or not Config.AdminPerms then return false end
    for _, perm in ipairs(Config.AdminPerms) do
        if IsPlayerAceAllowed(src, perm) then
            return true
        end
    end
    return false
end

lib.callback.register('mri_Qstashes:isAdmin', function(src)
    return isAdmin(src)
end)

RegisterNetEvent("insertStashesData", function(input, loc)
    local src = source
    if not isAdmin(src) then return end
    stashesTable[#stashesTable + 1] = {
        id = math.random(100000, 999999),
        name = input[1] or nil,
        job = input[2] or nil,
        gang = input[3] or nil,
        rank = input[4] or nil,
        item = input[5] or nil,
        slotSize = input[6],
        weight = input[7],
        password = input[8] or nil,
        citizenID = input[9] or nil,
        targetlabel = input[10] or locale("createmenu.default10"),
        webhookURL = input[11] or nil,
        loc = loc or nil
    }
    SaveStashesData()
end)

RegisterNetEvent("deleteStashesData", function(id)
    local src = source
    if not isAdmin(src) then return end
    for i = #stashesTable, 1, -1 do
        if stashesTable[i].id == id then
            table.remove(stashesTable, i)
            SaveStashesData()
            break
        end
    end
    TriggerClientEvent("mri_Qstashes:delete", -1, stashesTable)
end)

RegisterNetEvent("updateStashesData", function(id, input)
    local src = source
    if not isAdmin(src) then return end
    for i = 1, #stashesTable do
        if stashesTable[i].id == id then
            stashesTable[i].name = input[1] or stashesTable[i].name
            stashesTable[i].job = input[2] or stashesTable[i].job
            stashesTable[i].gang = input[3] or stashesTable[i].gang
            stashesTable[i].rank = input[4] or stashesTable[i].rank
            stashesTable[i].item = input[5] or stashesTable[i].item
            stashesTable[i].slotSize = input[6] or stashesTable[i].slotSize
            stashesTable[i].weight = input[7] or stashesTable[i].weight
            stashesTable[i].password = input[8] or stashesTable[i].password
            stashesTable[i].citizenID = input[9] or stashesTable[i].citizenID
            stashesTable[i].targetlabel = input[10] or stashesTable[i].targetlabel
            stashesTable[i].webhookURL = input[11] or stashesTable[i].webhookURL
            break
        end
    end
    SaveStashesData()
end)

RegisterNetEvent("updateStashLocation", function(id, newLoc)
    local src = source
    if not isAdmin(src) then return end
    for i = 1, #stashesTable do
        if stashesTable[i].id == id then
            stashesTable[i].loc = newLoc
            break
        end
    end
    SaveStashesData()
end)

function SaveStashesData()
    TriggerClientEvent("mri_Qstashes:delete", -1, stashesTable)
    local jsonData = json.encode(stashesTable)
    SaveResourceFile(GetCurrentResourceName(), "data.json", jsonData, -1)
    TriggerClientEvent('mri_Qstashes:start', -1, stashesTable)
    LoadStashesData()
end

function LoadStashesData()
    local loadFile = LoadResourceFile(GetCurrentResourceName(), "./data.json")
    if loadFile then
        stashesTable = json.decode(loadFile)
    end
    RegisterStashData()
end

local function RegisterHookData(stash)
    local webhookURL = ""
    local inventory = ""
    exports.ox_inventory:registerHook('swapItems', function(payload)
            if payload.fromInventory == stash.id then
                webhookURL = stash.webhookURL
                inventory = stash.label
                WebhookPlayer(payload, webhookURL, inventory)
            elseif payload.toInventory == stash.id and payload.action == "move"then
                webhookURL = stash.webhookURL
                inventory = stash.label
                WebhookPlayer(payload, webhookURL, inventory)
            end
    end, options)
end

function RegisterStashData()
    for k, v in pairs(stashesTable) do
        local stash = {
            id = "mri_Qstashes" .. v.id,
            label = v.name,
            slots = v.slotSize,
            webhookURL = v.webhookURL,
            weight = tonumber(v.weight)
        }
        exports.ox_inventory:RegisterStash(stash.id, stash.label, stash.slots, stash.weight)
        RegisterHookData(stash)
    end
end

lib.callback.register('stashesGetAll', function()
    return stashesTable
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        LoadStashesData()
        if GetResourceState('ox_inventory') ~= 'started' then
            return print("[mri_Qstashes] - ox_inventory não encontrado.")
        end
        Wait(1000)
        TriggerClientEvent('mri_Qstashes:start', -1, stashesTable)
    end
end)

RegisterNetEvent("mri_Qstashes:server:Load", function()
    local src = source
    LoadStashesData()
    Wait(1000)
    TriggerClientEvent('mri_Qstashes:start', src, stashesTable)
end)

RegisterNetEvent("mri_Qstashes:server:Unload", function()
    local src = source
    LoadStashesData()
    Wait(1000)
    TriggerClientEvent("mri_Qstashes:delete", src, stashesTable)
end)

lib.addCommand(Config.Command, {
    help = locale("command.help"),
    restricted = 'group.admin'
}, function(source, args, raw)
    local src = source
    TriggerClientEvent('mri_Qstashes:openAdm', src)
end)

local function sendWebhook(webhook, data)
    if webhook == nil then
        print('^1[logs] ^0Webhook ' .. webhook .. ' does not exist.')
        return
    end

    PerformHttpRequest(webhook, function(err, text, headers)
    end, 'POST', json.encode({
        embeds = data
    }), {
        ['Content-Type'] = 'application/json'
    })
end

function WebhookPlayer(payload, webhookURL, inventory)
    if type(webhookURL) ~= "string" or webhookURL:match("^%s*$") or not webhookURL:match("^https?://") then
        return
    end
    local playerName = payload.source and GetPlayerName(payload.source) or "Desconhecido"
    local playerdiscord = payload.source and GetPlayerIdentifierByType(payload.source, 'discord')
    playerdiscord = playerdiscord and playerdiscord:match("%d+") or "N/A"
    local playerIdentifier = payload.source and GetPlayerIdentifiers(payload.source) and GetPlayerIdentifiers(payload.source)[1] or "N/A"
    local playerCoords = payload.source and GetPlayerPed(payload.source) and GetEntityCoords(GetPlayerPed(payload.source)) or {x = 0, y = 0, z = 0}
    local color = 0x00ff00
    local actionTitle = "Item depositado no baú"
    if payload.fromType == "player" and payload.toType == "stash" then
        color = 0x00ff00
        actionTitle = "Item depositado no baú"
    elseif payload.fromType == "stash" and payload.toType == "player" then
        color = 0xff0000
        actionTitle = "Item retirado do baú"
    end
    local embed = {
        title = actionTitle .. (inventory and (" - " .. inventory) or ""),
        author = {
            name = playerName .. " (" .. (playerdiscord or "N/A") .. ")",
            icon_url = "https://cdn.discordapp.com/embed/avatars/0.png"
        },
        fields = {
            { name = "Usuário", value = "<@" .. (playerdiscord or "0") .. ">", inline = true },
            { name = "Item", value = payload.fromSlot and payload.fromSlot.name or "Desconhecido", inline = true },
            { name = "Quantidade", value = tostring(payload.fromSlot and payload.fromSlot.count or "?"), inline = true },
            { name = "Metadata", value = payload.fromSlot and json.encode(payload.fromSlot.metadata) or "{}", inline = false },
            { name = "Baú", value = inventory or "Desconhecido", inline = true },
            { name = "CitizenID", value = playerIdentifier or "N/A", inline = true },
            { name = "Coordenadas", value = (playerCoords.x and ('%s, %s, %s'):format(playerCoords.x, playerCoords.y, playerCoords.z) or "0, 0, 0"), inline = false }
        },
        footer = {
            text = "ID: " .. (payload.source or "N/A") .. " | " .. os.date("%d/%m/%Y %H:%M:%S")
        },
        color = color,
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
    }
    sendWebhook(webhookURL, {embed})
end

