---@author ach-git

AddEventHandler("playerDropped", function()
    local _src <const> = source
    GM:trace(("Player %s [%s] dropped"):format(GetPlayerName(_src), _src))
    GMPlayerManager:getPlayer(_src):save()
    GMPlayerManager:removePlayer(_src)
end)

