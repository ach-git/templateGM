---@author ach-git

AddEventHandler("onResourceStop", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    GM:trace("^1Stopping, please wait...")
    GM:triggerEvent("gmStopped")
end)