resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

name 'McDonalds'
author 'DOSE'
version '0.0.1'

client_scripts {
  'client/mcd_job_client.lua',
  'client/mcd_client.lua',
  'client/gui.lua',
  'config.lua',
}

server_scripts {
  'server/mcd_server.lua',
  'config.lua',
}