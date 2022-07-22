---@author ach-git

AddEventHandler("onResourceStart", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    GM:trace("^2Starting, please wait...")
    GM:triggerEvent("gmStarted")
end)