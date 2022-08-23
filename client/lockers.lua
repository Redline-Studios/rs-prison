local locker = {}

--------------------------------------
-- PRISON STASH (PD STASH INSPIRED) --
--------------------------------------

RegisterNetEvent('prison:stash', function()
    if inJail then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "prisonstash_"..QBCore.Functions.GetPlayerData().citizenid)
        TriggerEvent("inventory:client:SetCurrentStash", "prisonstash_"..QBCore.Functions.GetPlayerData().citizenid)
    end
end)

CreateThread(function()
	for k, v in pairs(Config.Lockers) do
		RequestModel(`p_cs_locker_01_s`) 
    while not HasModelLoaded(`p_cs_locker_01_s`) do 
        Citizen.Wait(2) 
    end
    locker[#locker+1] = CreateObject(`p_cs_locker_01_s`,v.coords.x, v.coords.y, v.coords.z-1.2,false,false,false)
	SetEntityHeading(locker[#locker], v.coords.w - 90)
	FreezeEntityPosition(locker[#locker], true)
        exports['qb-target']:AddBoxZone("lockers"..k, v.coords, 1.5, 1.6, { 
            name = "lockers"..k, 
            heading = v.coords.w, 
            debugPoly = false, 
            minZ = v.coords.z-1, 
            maxZ = v.coords.z+1.4, 
        }, { 
            options = { 
                {
                    type = "client",
                    event = "prison:stash",
                    icon = "fas fa-box-open",
                    label = "Open Prisoner Stash",
                } 
            }, 
            distance = 2.5,
        })
    end
end)
