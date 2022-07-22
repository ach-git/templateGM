---@author ach-git
---@class GMPlayerManager
GMPlayerManager = { list = {} }

---createPlayer
---@param playerID table
---@return table
---@public
function GMPlayerManager:createPlayer(playerID)
    local player = GMPlayer(playerID)
    GMPlayerManager.list[playerID] = player
    player:initialize()
end

---removePlayer
---@param playerID table
---@public
function GMPlayerManager:removePlayer(playerID)
    GMPlayerManager.list[playerID] = nil
end

---getPlayer
---@param playerID table
---@return table
---@public
function GMPlayerManager:getPlayer(playerID)
    return GMPlayerManager.list[playerID]
end

---playerExists
---@param playerID table
---@return table
---@public
function GMPlayerManager:playerExists(playerID)
    return (GMPlayerManager.list[playerID] ~= nil)
end

---getPlayers
---@param playerID table
---@return table
---@public
function GMPlayerManager:getPlayers()
    return GMPlayerManager.list
end