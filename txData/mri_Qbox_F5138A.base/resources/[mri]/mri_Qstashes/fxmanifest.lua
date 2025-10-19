fx_version 'cerulean'
games { 'gta5' }

author 'Murai Dev'
discord '.mur4i'
description 'In-game stashe creator for QBOX'
version '1.0.1'

ox_lib 'locale'

shared_scripts {
    '@ox_lib/init.lua',
	'@qbx_core/modules/lib.lua',
	'@qbx_core/modules/playerdata.lua',
	'shared/**.lua',
}

files {
	'locales/*.json'
}

client_scripts {
	'client/**.lua',
}

server_scripts {
	'server/**.lua',
}

lua54 'yes'

