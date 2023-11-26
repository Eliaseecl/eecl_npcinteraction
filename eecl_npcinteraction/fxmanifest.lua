fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'Eliaseecl'
description 'npcs configurables'
version '1.0.0'

-- What to run
client_scripts {
    'client/*.lua',
}
server_script {
    'server/*.lua'
}

shared_scripts {
    '@es_extended/imports.lua',
    'config.lua'
}