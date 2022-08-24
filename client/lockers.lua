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

--------------------------------------
-- PRISON STASH (POLICE FORCE OPEN) --
--------------------------------------

--[[RegisterNetEvent('prison:OpenLocker', function(data)
    local prisonStash = data.currentEvidence
    local pos = GetEntityCoords(PlayerPedId())
    local takeLoc = Config.Locations["evidence"][currentEvidence]

    if not takeLoc then return end

    if #(pos - takeLoc) <= 1.0 then
        local drawer = exports['qb-input']:ShowInput({
            header = Lang:t('info.prison_stash', {value = prisonStash}),
            submitText = "Open Locker",
            inputs = {
                {
                    type = 'number',
                    isRequired = true,
                    name = 'slot',
                    text = Lang:t('info.slot')
                }
            }
        })
        if drawer then
            if not drawer.slot then return end
            TriggerServerEvent("inventory:server:OpenInventory", "stash", Lang:t('info.current_evidence', {value = currentEvidence, value2 = drawer.slot}), {
                maxweight = 4000000,
                slots = 500,
            })
            TriggerEvent("inventory:client:SetCurrentStash", Lang:t('info.current_evidence', {value = currentEvidence, value2 = drawer.slot}))
        end
    else
        exports['qb-menu']:closeMenu()
    end
end)]]--

-------------------
-- LOCKER THREAD --
-------------------

CreateThread(function()
    if Config.Gabz then
	    for k, v in pairs(Config.Lockers) do
	    	RequestModel(`p_cs_locker_01_s`) 
        while not HasModelLoaded(`p_cs_locker_01_s`) do 
            Citizen.Wait(2) 
        end
        locker[#locker+1] = CreateObject(`p_cs_locker_01_s`,v.coords.x, v.coords.y, v.coords.z-1,false,false,false)
	    SetEntityHeading(locker[#locker], v.coords.w - 180)
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
                        job = 'unemployed',
                    },
                    {
                        type = "client",
                        event = "prison:OpenLocker",
                        icon = "fas fa-box-open",
                        label = "Force Open Locker",
                        job = {
                            ['police'] = 0,
                        },
                    } 
                }, 
                distance = 2.5,
            })
        end
    end
end)

CreateThread(function()
    if Config.QBCore then
	    for k, v in pairs(Config.LockersQB) do
	    	RequestModel(`p_cs_locker_01_s`) 
        while not HasModelLoaded(`p_cs_locker_01_s`) do 
            Citizen.Wait(2) 
        end
        locker[#locker+1] = CreateObject(`p_cs_locker_01_s`,v.coords.x, v.coords.y, v.coords.z-1,false,false,false)
	    SetEntityHeading(locker[#locker], v.coords.w - 180)
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
                        job = 'unemployed',
                    },
                    {
                        type = "client",
                        event = "prison:OpenLocker",
                        icon = "fas fa-box-open",
                        label = "Force Open Locker",
                        job = {
                            ['police'] = 0,
                        },
                    } 
                }, 
                distance = 2.5,
            })
        end
    end
end)
