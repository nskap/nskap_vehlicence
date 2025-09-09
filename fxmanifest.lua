fx_version 'cerulean'

shared_script "@SecureServe/src/module/module.lua"
shared_script "@SecureServe/src/module/module.js"
file "@SecureServe/secureserve.key"
game 'gta5'

author 'not.skap'
description 'For FluxRP'

shared_scripts {
  '@ox_lib/init.lua',
  'config.lua'
}

server_scripts { 'server.lua' }
client_scripts { 'client.lua' }
