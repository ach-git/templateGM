---scalar
---@param query string
---@param parameters table
---@param cb function
---@return void
---@public
function GM.SQL:scalar(query, parameters, cb)
    exports[GetCurrentResourceName()]:scalar(query, parameters, cb)
end