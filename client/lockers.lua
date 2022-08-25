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

------------------------------------------
-- PRISON STASH (POLICE FORCE OPEN) WIP --
------------------------------------------

--[[

RegisterNetEvent('prison:OpenLocker', function(data)
    local prisonStash = QBCore.Functions.GetPlayerData().citizenid
    local locker = exports['qb-input']:ShowInput({
        header = Lang:t('info.prison_stash'),
        submitText = "Open Locker",
        inputs = {
            {
                text = Lang:t('info.slot'),
                name = 'citizenid',
                type = 'text',
                isRequired = true,
            }
        }
    })
    if locker then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "prisonstash_"..prisonStash)
        TriggerEvent("inventory:client:SetCurrentStash", "prisonstash_"..prisonStash)
    else
        exports['qb-menu']:closeMenu()
    end
end)

]]--

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
                        canInteract = function()
                            if inJail then
                                return true
                            else 
                                return false
                            end
                        end,
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
                        canInteract = function()
                            if inJail then
                                return true
                            else 
                                return false
                            end
                        end,
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
