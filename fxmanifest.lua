---@author ach-git

x_version 'cerulean'
game 'gta5'
lua54 'yes'
use_fxv2_oal 'yes'

author 'ach-git'
description 'A gamemode template made for fivem.'

version '1.0.0-alpha'

shared_scripts {
    "config.lua",

    "gamemode/shared/**/*.lua",

    "modules/**/shared/**/*.lua",
}

server_scripts {
    "vendors/MySQL/oxmysql.js",

    "gamemode/server/**/*.lua",

    "modules/**/server/**/*.lua",
}

client_scripts  {
    "gamemode/client/**/*.lua",

    "modules/**/client/**/*.lua",
}