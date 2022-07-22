---@author ach-git

---spawnPlayer
---@param coords table
---@param callback function
---@public
function GM.Utils:spawnPlayer(coords, callback)
    local position <const>, heading <const> = coords.position, coords.heading
    CreateThread(function()
        GM:debug("Loading Player (1/3)...")

        self:freezePlayer(PlayerId(), true)

        GM:debug("Loading Player Model (2/3)...")

        local model <const> = self:requestModel(GMConfig.defaultModel)

        SetPlayerModel(PlayerId(), model)
        SetModelAsNoLongerNeeded(model)

        SetPedDefaultComponentVariation(PlayerPedId())

        RequestCollisionAtCoord(position.x, position.y, position.z)

        local ped <const> = PlayerPedId()

        SetEntityCoordsNoOffset(ped, position.x, position.y, position.z, false, false, false, true)
        SetEntityHeading(ped, heading)

        NetworkResurrectLocalPlayer(position.x, position.y, position.z, heading, true, true, false)

        GM:debug("Spawning Player (3/3)...")
        ClearPedBloodDamage(ped)
        ClearPedTasksImmediately(ped)
        RemoveAllPedWeapons(ped)
        ClearPlayerWantedLevel(PlayerId())

        ShutdownLoadingScreen()
        ShutdownLoadingScreenNui()
        DoScreenFadeIn(1500)

        while (IsScreenFadingIn()) do
            Wait(0)
        end

        self:freezePlayer(PlayerId(), false)

        if (callback) then
            callback()
        end
    end)
end