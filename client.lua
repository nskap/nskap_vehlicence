local checkEvery = (Config.Runtime and Config.Runtime.checkIntervalMs) or 700

local function getVehicleModelName(veh)
    local hash = GetEntityModel(veh)
    local name = GetDisplayNameFromVehicleModel(hash)
    if name and name ~= "" then return string.lower(name) end
    return tostring(hash)
end

CreateThread(function()
    while true do
        Wait(checkEvery)

        if not (Config.Runtime and Config.Runtime.kickIfNoLicense) then goto continue end

        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped, false) then
            local veh = GetVehiclePedIsIn(ped, false)
            if veh ~= 0 and GetPedInVehicleSeat(veh, -1) == ped then
                local modelName = getVehicleModelName(veh)
                local netId = VehToNet(veh)
                TriggerServerEvent('vehiclelicense:kickCheck', modelName, netId)
            end
        end
        ::continue::
    end
end)

RegisterNetEvent('vehiclelicense:kickNow', function(netId, msg)
    local veh = NetToVeh(netId)
    if veh == 0 or not DoesEntityExist(veh) then return end

    local ped = PlayerPedId()
    if GetPedInVehicleSeat(veh, -1) == ped then

        lib.notify({
            title = 'Licence vozidla',
            description = msg or "Nemáš povolení řídit toto vozidlo.",
            type = 'error'
        })

        TaskLeaveVehicle(ped, veh, 16)
    end
end)
