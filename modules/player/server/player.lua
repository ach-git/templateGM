---@author ach-git
---@field public playerId number
---@class GMPlayer
GMPlayer = {}

local __instance = {
    __index = GMPlayer,
}

setmetatable(GMPlayer, {
    __call = function(_, playerId)
        local self = setmetatable({}, __instance)

        self.id = playerId

        self.license = GM.Utils:getLicense(self.id)
        self.pseudo = GetPlayerName(self.id)

        GM.SQL:single("SELECT * FROM users WHERE license = @license", {
            ["@license"] = self.license,
        }, function(result)
            if result then
                self.permId = result.id
                self.position = json.decode(result.position)
            else
                self.position = GMConfig.spawnPoint
                GM.SQL:insert("INSERT INTO users (license, position) VALUES (@a, @b)", {
                    ['a'] = self.license,
                    ['b'] = json.encode(GMConfig.spawnPoint)
                }, function(insertId)
                    self.permId = insertId
                end)
            end
        end)

        while not self.permId do
            Wait(0)
        end

        return (self)
    end
})

--- getId
---@return number
---@public
function GMPlayer:getId()
    return self.id
end

--- getPermId
---@return number
---@public
function GMPlayer:getPermId()
    return self.permId
end

--- getName
---@return string
---@public
function GMPlayer:getPseudo()
    return self.pseudo
end

--- getLicense
---@return string
---@public
function GMPlayer:getLicense()
    return self.license
end

--- getDimension
---@return number
---@public
function GMPlayer:getDimension()
    return GetPlayerRoutingBucket(self.id)
end

---setDimension
---@param dimID number
---@return number
---@public
function GMPlayer:setDimension(dimID)
    SetEntityRoutingBucket(self.id, dimID or 0)
end

function GMPlayer:initialize()
    GM:triggerClientEvent("initializePlayer", self.id, self.position)
end

---savePosition
---@param position number
---@return number
---@public
function GMPlayer:save()
    GM.SQL:update("UPDATE users SET position = @position WHERE license = @license", {
        ["@license"] = self.license,
        ["@position"] = json.encode({ position = GetEntityCoords(GetPlayerPed(self.id)), heading = GetEntityHeading(GetPlayerPed(self.id)) })
    })
end