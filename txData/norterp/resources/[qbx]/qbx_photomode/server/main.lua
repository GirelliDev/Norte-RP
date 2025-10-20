lib.addCommand(config.openCommand, {
    help = 'Ativar modo de fotografias',
    restricted = 'group.admin'
}, function(source, args, raw)
    lib.callback('qbx_photomode:client:openCamera', source)
end)