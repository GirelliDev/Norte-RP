fx_version 'cerulean'
game 'gta5'

author 'AngelicXS'
version '1.2'

shared_script {
    '@ox_lib/init.lua',
    'config.lua',
}

client_script {
    'client/*.lua',
}

server_script {
	'server.lua',
}

lua54 'yes'
