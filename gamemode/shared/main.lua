---@author ach-git

---trace
---@param message string
function GM:trace(message)
    if not message then
        return
    end
    print(("^3[%s INFO]^7 %s^7"):format(GMConfig.gmName or "templateGM", message))
end

---debug
---@param message string
---@public
function GM:debug(message)
    if not GM.devMode then
        return
    end
    print(("^3[%s DEBUG]^7 %s^7"):format(GMConfig.gmName or "templateGM", message))
end

local eventsList = {}
---registerNetEvent
---@param eventName table
---@public
function GM:registerNetEvent(eventName, ...)
    if not eventsList[eventName] then
        RegisterNetEvent(self:formatEvent(eventName), ...)
        eventsList[eventName] = true
    end
end

---handleEvent
---@param eventName string
---@param callback function
---@return table
---@public
function GM:handleEvent(eventName, callback)
    return AddEventHandler(self:formatEvent(eventName), callback)
end

---triggerEvent
---@param eventName string
---@public
function GM:triggerEvent(eventName, ...)
    TriggerEvent(self:formatEvent(eventName), ...)
end

---removeEvent
---@param handler table
---@public
function GM:removeEvent(handler)
    RemoveEventHandler(handler)
end

---formatEvent
---@param eventName string
---@public
function GM:formatEvent(eventName)
    return (("%s:%s"):format(GMConfig.gmName or "templateGM", GetHashKey(eventName)))
end