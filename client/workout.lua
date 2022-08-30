local hasWorkedOut = false

RegisterNetEvent("prison:chinUp", function()
    if not hasWorkedOut then
        Hang()
    else
        antiSpam()
    end
end)

CreateThread(function()
    exports['qb-target']:AddBoxZone("PrisonChinUp", vector3(1745.91, 2481.26, 45.74), 1, 2.0, {
        name = "PrisonChinUp",
        heading = 30,
        debugPoly = false,
        minZ = 45.74 - 1,
        maxZ = 45.74 + 1,
    }, {
        options = {
            {
                type = "client",
                event = "prison:chinUp",
                icon = "fas fa-dumbbell",
                label = "Do Chin-Ups",
                canInteract = function()
                    if inJail then
                        return true
                    else 
                        return false
                    end
                end,
            },
        },
        distance = 1.5
    })
end)

function antiSpam()
    if Config.Delay >= 1 then 
        hasWorkedOut = true
        Wait(1000 * Config.Delay)
        QBCore.Functions.Notify( Lang:t("error.workout_breather"), "error")
    end
end

function Hang()
    if not hasWorkedOut then
        QBCore.Functions.Progressbar('doing_hang', 'Doing Pullups', 10000, false, false, {
            disableMovement = true, --
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "amb@prop_human_muscle_chin_ups@male@base",
            anim = "base",
            flags = 8,
        }, {}, {}, function()  
            QBCore.Functions.Notify("Work out completed", "success")  
            ClearPedTasks(PlayerPedId())
	    	exports['ps-buffs']:AddArmorBuff(60000, 5)
	    	exports['ps-buffs']:StaminaBuffEffect(80000, 1.2)
            antiSpam()
        end, function() -- Cancel
            TriggerEvent('inventory:client:busy:status', false)
            QBCore.Functions.Notify("Just Breathe First..", "error")
        end, "fas fa-dumbbell")
    end
end

exports['qb-target']:AddTargetModel({-1978741854, 2057317573, -232023078}, { --Yoga mats
    options = {
        {
            type = "client",
            event = "yoga:start",
            icon = "fas fa-yin-yang",
            label = "Do yoga",
        },
    },
    distance = 2.5
})

RegisterNetEvent('yoga:start', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local finish = exports['ps-ui']:Circle(function(success)
        if success then
            print("success")
        else
            print("fail")
        end
    end, 2, 20) -- NumberOfCircles, MS


    FreezeEntityPosition(ped, true)
    if finish then
        ClearPedTasks(ped)
        TriggerEvent('animations:client:EmoteCommandStart', {"yoga"})
        FreezeEntityPosition(ped, false)
        TriggerServerEvent('hud:server:RelieveStress', 5)
        QBCore.Functions.Notify("You have a bit less stress", "success")
    else
        ClearPedTasks(ped)
        FreezeEntityPosition(ped, false)
        QBCore.Functions.Notify("Failed, focus..", "error")
        SetPedToRagdollWithFall(ped, 1000, 2000, 1, GetEntityForwardVector(ped), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    end
end)