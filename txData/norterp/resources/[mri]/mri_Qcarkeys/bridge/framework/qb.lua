if Shared.Framework == 'qb' then
    local KeyManagement = require 'client.modules.keys'
    local VehicleKeys = require 'client.interface'
    local Utils = require 'client.modules.utils'
    local playerItems = {}

    local QBCore = exports['qb-core']:GetCoreObject()

    local function setupData()
        VehicleKeys.currentVehicle = cache.vehicle and cache.vehicle or 0
        if cache.vehicle then
            VehicleKeys.isInDrivingSeat = GetPedInVehicleSeat(cache.vehicle, -1) == cache.ped
            local plate = GetVehicleNumberPlateText(cache.vehicle)
            VehicleKeys.currentVehiclePlate = Utils:RemoveSpecialCharacter(plate)
        end
    end

    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
        playerItems = QBCore.Functions.GetPlayerData().items
        KeyManagement:SetVehicleKeys()
        VehicleKeys:Thread()
        VehicleKeys:Init()
        KeyManagement:GetKeys()
    end)

    AddEventHandler('onResourceStart', function(resource)
        if GetCurrentResourceName() == resource and LocalPlayer.state.isLoggedIn then
            playerItems = QBCore.Functions.GetPlayerData().items
            setupData()
            KeyManagement:SetVehicleKeys()
            VehicleKeys:Thread()
            VehicleKeys:Init()
        end
    end)

    RegisterNetEvent('vehiclekeys:client:SetOwner', function(plate, isBuying)
        if not plate then
            return lib.notify({
                title = 'Falhou',
                description = 'Nenhuma placa de veículo encontrada',
                type = 'error'
            })
        end
        if isBuying then
            TriggerServerEvent('mm_carkeys:server:acquirevehiclekeys', plate)
        else
            TriggerServerEvent('mm_carkeys:server:acquiretempvehiclekeys', plate)
        end
    end)

    if Shared.Inventory == 'qb' then
        RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
            playerItems = val.items
            KeyManagement:SetVehicleKeys()
            VehicleKeys:Init()
        end)
    else
        AddEventHandler('ox_inventory:updateInventory', function()
            KeyManagement:SetVehicleKeys()
            VehicleKeys:Init()
        end)

        exports.ox_inventory:displayMetadata({platestxt = 'Vehicle Plates'})
    end

    function GetQBPlayerItem()
        return playerItems
    end
end