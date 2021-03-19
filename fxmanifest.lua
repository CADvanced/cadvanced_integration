fx_version "adamant"
games {"gta5"}

name "cadvanced_integration"
description "A resource demonstrating integration with the CADvanced resource"
version "1.0.0"

server_scripts {
    "server/util.lua",
    "server/main.lua"
}

dependency "cadvanced_mdt"
