---@author ach-git

---freezePlayer
---@param text string
---@public
function GM.Utils:freezePlayer(id, bool)
    local player = id
    SetPlayerControl(player, not bool, false)

    local ped = GetPlayerPed(player)

    if not bool then
        if not IsEntityVisible(ped) then
            SetEntityVisible(ped, true)
        end
        if not IsPedInAnyVehicle(ped) then
            SetEntityCollision(ped, true)
        end
        FreezeEntityPosition(ped, false)
        SetPlayerInvincible(player, false)
    else
        if IsEntityVisible(ped) then
            SetEntityVisible(ped, false)
        end
        SetEntityCollision(ped, false)
        FreezeEntityPosition(ped, true)
        SetPlayerInvincible(player, true)
        if not IsPedFatallyInjured(ped) then
            ClearPedTasksImmediately(ped)
        end
    end
end