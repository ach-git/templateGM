---@author ach-git

GM:registerNetEvent("playerInGame", function()
    local _src <const> = source
    GM:trace(("Player %s [%s] is now in game"):format(GetPlayerName(_src), _src))
    GMPlayerManager:createPlayer(_src)
end)