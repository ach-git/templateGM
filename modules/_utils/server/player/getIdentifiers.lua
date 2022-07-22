---@author ach-git

---getIdentifiers
---@param playerSrc number
---@return table
---@public
function GM.Utils:getIdentifiers(playerSrc)
    if (not playerSrc or playerSrc <= 0) then
        return GM:debug("Unable to find identifiers : source is invalid")
    end
    local identifiers = {}
    for _, v in pairs(GetPlayerIdentifiers(playerSrc)) do
        local splitted
        for match in (v .. ":"):gmatch("(.-)" .. ":") do
            splitted[#splitted + 1] = match
        end

        identifiers[splitted[1]] = v
    end
    return (identifiers)
end