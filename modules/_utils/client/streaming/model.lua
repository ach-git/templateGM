---requestModel
---@param modelHash string
---@return number
---@public
function GM.Utils:requestModel(modelHash)
    modelHash = (type(modelHash) == "number" and modelHash or GetHashKey(modelHash))
    if (not (IsModelInCdimage(modelHash))) then
        return (GM:debug("Model not found: " .. modelHash))
    end
    if (HasModelLoaded(modelHash)) then
        return (modelHash)
    end

    RequestModel(modelHash)
    while (not HasModelLoaded(modelHash)) do
        Wait(0)
    end
    return (modelHash)
end