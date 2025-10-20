fx_version 'cerulean'
game 'gta5'

description 'mri_Qhud from Z HUD'
version '1.0.0'

ox_lib 'locale'

shared_scripts {
	'@ox_lib/init.lua',
	'@qbx_core/modules/lib.lua',
	'config.lua'
}

client_scripts {
	'@qbx_core/modules/playerdata.lua',
	'client.lua',
}

server_script 'server.lua'

ui_page 'html/index.html'

files {
	'locales/*.json',
	'html/index.html',
	'html/styles.css',
	'html/responsive.css',
	'html/app.js',
	'img/logo.png'

}

lua54 'yes'
use_experimental_fxv2_oal 'yes'
