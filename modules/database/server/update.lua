---update
---@param query string
---@param parameters table
---@param cb function
---@return void
---@public
function GM.SQL:update(query, parameters, cb)
    exports[GetCurrentResourceName()]:update(query, parameters, cb)
end