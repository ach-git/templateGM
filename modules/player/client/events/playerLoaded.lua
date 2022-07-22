---@author ach-git

GM:registerNetEvent("initializePlayer", function(position)
    GM.Utils:spawnPlayer({ position = vector3(position.position.x, position.position.y, position.position.z - 1), heading = position.heading }, function()
        GM:triggerServerEvent("playerServerSpawned")
        GM:triggerEvent("playerSpawned")
    end)
end)