---insert
---@param query string
---@param parameters table
---@param cb function
---@return void
---@public
function GM.SQL:insert(query, parameters, cb)
    exports[GetCurrentResourceName()]:insert(query, parameters, cb)
end