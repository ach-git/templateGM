---@author ach-git

---showNotification
---@param message string
---@public
function GM.Utils:showNotification(message)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    DrawNotification(0,1)
end

---showHelpNotification
---@param message string
---@public
function GM.Utils:showHelpNotification(message)
    AddTextEntry("HelpText", message)
    DisplayHelpTextThisFrame("HelpText", false)
end

---showFloatingHelp
---@param text string
---@param pos table
---@public
function GM.Utils:showFloatingHelp(text, pos)
    AddTextEntry('FloatingHelpText', text)
    SetFloatingHelpTextWorldPosition(1, pos)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp('FloatingHelpText')
    EndTextCommandDisplayHelp(2, false, false, -1)
end

---showAdvancedNotification
---@param sender string
---@param subject string
---@param msg string
---@param textureDict string
---@param iconType string
---@param flash boolean
---@param saveToBrief boolean
---@param hudColorIndex table
---@public
function GM.Utils:showAdvancedNotification(sender, subject, msg, textureDict, iconType, flash, saveToBrief, hudColorIndex)
    if saveToBrief == nil then
        saveToBrief = true
    end
    AddTextEntry("STRING", msg)
    BeginTextCommandThefeedPost("STRING")
    if hudColorIndex then
        ThefeedNextPostBackgroundColor(hudColorIndex)
    end
    EndTextCommandThefeedPostMessagetext(textureDict, textureDict, false, iconType, sender, subject)
    EndTextCommandThefeedPostTicker(flash or false, saveToBrief)
end

GM:registerNetEvent("showNotification", function(sender, subject, msg, textureDict, iconType)
    GM.Utils:showNotification(sender, subject, msg, textureDict, iconType)
end)

GM:registerNetEvent("showAdvancedNotification", function(sender, subject, msg, textureDict, iconType)
    GM.Utils:showAdvancedNotification(sender, subject, msg, textureDict, iconType)
end)