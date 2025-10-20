fx_version 'cerulean'
game 'gta5'

author 'Tonybyn_Mp4'
description 'Photo mode for the Qbox Framework'
repository 'https://github.com/TonybynMp4/qbx_photomode'
version '1.0.1'

ox_lib 'locale'

ui_page 'html/index.html'

files {
    'html/*',
    'config/client.lua',
    'locales/*'
}

shared_scripts {
    '@ox_lib/init.lua',
    'config/client.lua'
}

client_scripts {
    'client/main.lua'
}

server_scripts {
    'server/main.lua'
}

lua54 'yes'
use_experimental_fxv2_oal 'yes'