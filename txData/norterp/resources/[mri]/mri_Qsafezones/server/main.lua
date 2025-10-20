lib.addCommand(Config.GreenzonesCommand, {
    help = 'Create a temporary greenzone',
    restricted = 'group.admin'
}, function(source, args, raw)
    local source = source
    lib.callback('mri_Qsafezone:adminZone', source, cb)
end)

lib.addCommand(Config.GreenzonesClearCommand, {
    help = 'Delete a temporary greenzone',
    restricted = 'group.admin'
}, function(source, args, raw)
    local source = source
    lib.callback('mri_Qsafezone:adminZoneClear', source, cb)
end)

lib.callback.register('mri_Qsafezone:data', function(source, zoneCoords, zoneName, textUI, textUIColor, textUIPosition, zoneSize, disarm, invincible, speedLimit, blipID, blipColor)
    TriggerClientEvent('mri_Qsafezone:createAdminZone', -1, zoneCoords, zoneName, textUI, textUIColor, textUIPosition, zoneSize, disarm, invincible, speedLimit, blipID, blipColor)
end)

lib.callback.register('mri_Qsafezone:deleteZone', function()
    TriggerClientEvent('mri_Qsafezone:deleteAdminZone', -1)
end)