---@author ach-git

---triggerServerEvent
---@param eventName string
---@public
function GM:triggerServerEvent(eventName, ...)
    TriggerServerEvent(self:formatEvent(eventName), ...)
end