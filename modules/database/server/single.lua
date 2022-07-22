---single
---@param query string
---@param parameters table
---@param cb function
---@return void
---@public
function GM.SQL:single(query, parameters, cb)
    exports[GetCurrentResourceName()]:single(query, parameters, cb)
end