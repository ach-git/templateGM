---@author ach-git

GM:registerNetEvent("playerServerSpawned", function()
    local _src <const> = source
    GM:trace(("Player %s [%s] has spawned"):format(GetPlayerName(_src), _src))
end)