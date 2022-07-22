---@author ach-git

CreateThread(function()
    GM:debug("Instancing Player...")
    while not NetworkIsPlayerActive(PlayerId()) do Wait(1) end
    GM:triggerServerEvent("playerInGame")
end)