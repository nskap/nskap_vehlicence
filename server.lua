local function getLicense(src)
    for _, id in ipairs(GetPlayerIdentifiers(src)) do
        if id:sub(1,8) == "license:" then return id end
    end
    return nil
end

local function isAllowedLicense(licenseId, modelName)
    modelName = type(modelName) == "string" and modelName:lower() or modelName
    local list = Config.Allowed[modelName]
    if list ~= nil then
        for _, lic in ipairs(list) do
            if lic == licenseId then return true end
        end
        return false
    end
    return not Config.BlockIfNotListed
end

RegisterNetEvent('vehiclelicense:kickCheck', function(modelName, netId)
    local src = source
    local lic = getLicense(src)
    if not lic or not isAllowedLicense(lic, modelName) then
        TriggerClientEvent('vehiclelicense:kickNow', src, netId, Config.Messages.noDriverAccess)
    end
end)
