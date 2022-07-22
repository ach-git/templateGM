---@author ach-git

---getLicense
---@param source number
---@return table
---@public
function GM.Utils:getLicense(source)
    for _,v in pairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("license:")) == "license:" then
            return v
        end
    end
    return nil
end