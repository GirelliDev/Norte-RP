local obj = {}

ClientObjects = {}

local inObjectPreview = false
local handle = nil

function obj.updateSceneName(insertId, newName)
    TriggerServerEvent('objects:server:updateSceneName', insertId, newName)
end

function obj.removeScene(insertId)
    TriggerServerEvent('objects:server:removeScene', insertId)
end

---removed an object from the database and the world
---@param insertId number
function obj.removeObject(insertId)
    TriggerServerEvent('objects:server:removeObject', insertId)
end

---edit an object in the database and the world
---@param insertId number
function obj.editPlaced(insertId)
    local object = ClientObjects[insertId]
    local handle = object.handle
    local name = object.model

    if not DoesEntityExist(handle) then return end

    exports['fivem-freecam']:SetActive(true)
    local data = exports.object_gizmo:useGizmo(handle)

    if data then
        local coords = data.position
        local rotation = data.rotation
        TriggerServerEvent('objects:server:updateObject', {
            model = name,
            x = ('%.3f'):format(coords.x),
            y = ('%.3f'):format(coords.y),
            z = ('%.3f'):format(coords.z),
            rx = ('%.3f'):format(rotation.x),
            ry = ('%.3f'):format(rotation.y),
            rz = ('%.3f'):format(rotation.z),
            insertId = insertId
        } )
    end
    exports['fivem-freecam']:SetActive(false)
    lib.showContext('object_confirm_edit')
end

---spawn an object in the world
---@param model string
---@param sceneId number
function obj.previewObject(model, sceneId)
    inObjectPreview = true

    lib.requestModel(joaat(model), 100000)

    handle = CreateObject(model, GetEntityCoords(cache.ped), false, true, true)

    SetEntityAlpha(handle, 200, false)
    SetEntityCollision(handle, false, false)
    FreezeEntityPosition(handle, true)

    lib.hideTextUI()
    lib.showTextUI(
        '[E] Colocar objeto  \n [G] Girar 90º  \n [⬅/⮕] Girar Esquerda/Direita  \n [Q] Cancelar', {
            position = "right-center",
        })

    CreateThread(function()
        while inObjectPreview do
            local hit, _, coords, _, _ = lib.raycast.cam(1, 4)
            if hit then
                SetEntityCoords(handle, coords.x, coords.y, coords.z)
                PlaceObjectOnGroundProperly(handle)

                -- Left
                if IsControlPressed(0, 174) then
                    SetEntityHeading(handle, GetEntityHeading(handle) - 0.3)
                end

                -- Right
                if IsControlPressed(0, 175) then
                    SetEntityHeading(handle, GetEntityHeading(handle) + 0.3)
                end

                -- G
                if IsControlJustPressed(0, 47) then
                    SetEntityHeading(handle, GetEntityHeading(handle) + 90.0)
                end

                -- Q
                if IsControlJustPressed(0, 44) then
                    lib.hideTextUI()
                    DeleteEntity(handle)
                    inObjectPreview = false
                end

                -- E
                if IsControlJustPressed(0, 38) then
                    local rotation = GetEntityRotation(handle, 2)
                    local heading = GetEntityHeading(handle)
                    local insertId = lib.callback.await('objects:server:newObject', 2000, {
                        model = model,
                        x = ('%.3f'):format(coords.x),
                        y = ('%.3f'):format(coords.y),
                        z = ('%.3f'):format(coords.z),
                        rx = ('%.3f'):format(rotation.x),
                        ry = ('%.3f'):format(rotation.y),
                        rz = ('%.3f'):format(rotation.z),
                        heading = heading,
                        sceneid = sceneId
                    })
                    lib.hideTextUI()
                    SetEntityAsMissionEntity(handle, false, true)
                    DeleteObject(handle)
                    inObjectPreview = false
                    handle = nil

                    while insertId == nil do Wait(0) end
                    while not DoesEntityExist(ClientObjects[insertId].handle) do Wait(0) end
                    local menus = require 'client.menus'
                    menus.editConfirmMenu(insertId)
                end
            end
        end
    end)
end

RegisterNetEvent("objects:client:addObject", function(object)
    ClientObjects[object.id] = object
end)

RegisterNetEvent("objects:client:removeObject", function(insertId)
    local object = ClientObjects[insertId]

    if not object then return end

    if DoesEntityExist(object.handle) then
        SetEntityAsMissionEntity(object.handle, false, true)
        DeleteObject(object.handle)
    end

    ClientObjects[insertId] = nil
end)

RegisterNetEvent("objects:client:updateObject", function(data)
    local coords = data.coords
    local rotation = data.rotation
    local object = ClientObjects[data.insertId]

    if not object then return end

    if not DoesEntityExist(object.handle) then
        object.coords = coords
        object.rotation = rotation
        return
    end

    SetEntityCoords(object.handle, coords.x, coords.y, coords.z, false)
    SetEntityRotation(object.handle, rotation.x, rotation.y, rotation.z, 2, true)
    FreezeEntityPosition(object.handle, true)
end)

RegisterNetEvent("objects:client:loadObjects", function(objects)
    ClientObjects = objects
end)

local function SpawnObject(payload, timeoutMs)
    local modelHash = joaat(payload.model)
    timeoutMs = timeoutMs or 10000 -- timeout padrão: 10 segundos

    if not IsModelValid(modelHash) then
        print('Modelo inválido:', payload.model)
        return nil
    end

    RequestModel(modelHash)

    local waited = 0
    while not HasModelLoaded(modelHash) do
        Wait(50)
        waited += 50
        if waited >= timeoutMs then
            print('Timeout ao carregar modelo:', payload.model)
            return nil
        end
    end

    local obj = CreateObjectNoOffset(modelHash, payload.coords.x, payload.coords.y, payload.coords.z, false, false, false)
    if not DoesEntityExist(obj) then
        print('Falha ao criar objeto:', payload.model)
        return nil
    end

    SetEntityRotation(obj, payload.rotation.x, payload.rotation.y, payload.rotation.z, 2, true)
    FreezeEntityPosition(obj, true)
    SetEntityDynamic(obj, false)
    SetEntityProofs(obj, false, false, false, true, false, false, false, false)
    SetModelAsNoLongerNeeded(modelHash)

    return obj
end

local function forceDeleteEntity(insertId)
    local object = ClientObjects[insertId]

    if not object then return end

    SetEntityAsMissionEntity(object.handle, false, true)
    DeleteObject(object.handle)
    object.handle = false
end

CreateThread(function()
    while true do
        local pCoords = GetEntityCoords(cache.ped)

        for k, v in pairs(ClientObjects) do
            local isClose = #(pCoords - v.coords) < 300.0

            if not isClose and v.handle then
                forceDeleteEntity(k)
                Wait(0)
            elseif isClose and (not v.handle or not DoesEntityExist(v.handle)) then
                v.handle = SpawnObject(v)
                Wait(0)
            end
        end
        Wait(1200)
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    lib.callback('objects:getAllObjects', 1000, function(allObjects) 
        ClientObjects = allObjects
    end)
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    for k, v in pairs(ClientObjects) do
        if v.handle then
            forceDeleteEntity(k)
        end
    end
    ClientObjects = {}
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        for k, v in pairs(ClientObjects) do
            if v.handle then
                forceDeleteEntity(k)
            end
        end
    end
end)

return obj
