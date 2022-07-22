---@author ach-git

---triggerClientEvent
---@param eventName string
---@param targetId number
---@public
function GM:triggerClientEvent(eventName, targetId, ...)
    TriggerClientEvent(self:formatEvent(eventName), targetId, ...)
end

CreateThread(function()
    SetMapName(GMConfig.gmMapName)
    SetGameType(GMConfig.gmName)
end)