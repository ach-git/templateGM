---query
---@param query string
---@param parameters table
---@param cb function
---@return void
---@public
function GM.SQL:query(query, parameters, cb)
    exports[GetCurrentResourceName()]:query(query, parameters, cb)
end