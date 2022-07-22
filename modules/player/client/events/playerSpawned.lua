---@author ach-git

GM:handleEvent("playerSpawned", function()
    GM.Utils:showNotification(("Hello %s, welcome to %s!"):format(GetPlayerName(PlayerPedId()), GMConfig.gmName))
end)