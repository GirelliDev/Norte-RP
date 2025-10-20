local ResetStress = false

lib.addCommand('cash', {help = 'Check Cash Balance'}, function(source, args)
    local Player = exports.qbx_core:GetPlayer(source)
    local cashamount = Player.PlayerData.money.cash
    TriggerClientEvent('hud:client:ShowAccounts', source, 'cash', cashamount)
end)

lib.addCommand('bank', { help = 'Check Bank Balance'}, function(source, args)
    local Player = exports.qbx_core:GetPlayer(source)
    local bankamount = Player.PlayerData.money.bank
    TriggerClientEvent('hud:client:ShowAccounts', source, 'bank', bankamount)
end)

lib.addCommand("dev", {
    help = "Enable/Disable developer Mode",
    restricted = 'group.admin'
}, function(source, args)
    TriggerClientEvent("qb-admin:client:ToggleDevmode", source)
end)

RegisterNetEvent('hud:server:GainStress', function(amount)
    local src = source
    local Player = exports.qbx_core:GetPlayer(src)
    local newStress
    if Config.DisableStress then return end
    if not Player or (Config.DisablePoliceStress and Player.PlayerData.job.type == 'leo') then return end
    if not ResetStress then
        if not Player.PlayerData.metadata.stress then
            Player.PlayerData.metadata.stress = 0
        end
        newStress = Player.PlayerData.metadata.stress + amount
        if newStress <= 0 then newStress = 0 end
    else
        newStress = 0
    end
    if newStress > 100 then
        newStress = 100
    end
    Player.Functions.SetMetaData('stress', newStress)
    TriggerClientEvent('hud:client:UpdateStress', src, newStress)
    TriggerClientEvent('QBCore:Notify', src, locale("stress_gain"), 'error', 1500)
end)

RegisterNetEvent('hud:server:RelieveStress', function(amount)
    local src = source
    local Player = exports.qbx_core:GetPlayer(src)
    local newStress
    if not Player then return end
    if not ResetStress then
        if not Player.PlayerData.metadata.stress then
            Player.PlayerData.metadata.stress = 0
        end
        newStress = Player.PlayerData.metadata.stress - amount
        if newStress <= 0 then newStress = 0 end
    else
        newStress = 0
    end
    if newStress > 100 then
        newStress = 100
    end
    Player.Functions.SetMetaData('stress', newStress)
    TriggerClientEvent('hud:client:UpdateStress', src, newStress)
    TriggerClientEvent('QBCore:Notify', src, locale("stress_removed"))
end)

lib.callback.register('hud:server:getMenu', function()
    return(Config.Menu)
end)
