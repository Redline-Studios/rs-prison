local QBCore = exports['qb-core']:GetCoreObject()

local AlarmActivated = false

RegisterNetEvent('prison:server:SetJailStatus', function(jailTime)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetMetaData("injail", jailTime)
    if jailTime > 0 then
        if Player.PlayerData.job.name ~= "unemployed" then
            Player.Functions.SetJob("unemployed")
            TriggerClientEvent('QBCore:Notify', src, Lang:t("info.lost_job"))
        end
    end
end)

RegisterNetEvent('prison:server:SaveJailItems', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.metadata["jailitems"] == nil or next(Player.PlayerData.metadata["jailitems"]) == nil then
        Player.Functions.SetMetaData("jailitems", Player.PlayerData.items)
        Player.Functions.AddMoney('cash', 80)
        Wait(2000)
        Player.Functions.ClearInventory()
    end
end)

RegisterNetEvent('qb-prison:server:getCommissary', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddMoney('cash', 5)
end)

RegisterNetEvent('prison:server:GiveJailItems', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Wait(1000)
    for k, v in pairs(Player.PlayerData.metadata["jailitems"]) do
        Player.Functions.AddItem(v.name, v.amount, false, v.info)
    end
    Wait(1000)
    Player.Functions.SetMetaData("jailitems", {})
end)

RegisterNetEvent('prison:server:SecurityLockdown', function()
    TriggerClientEvent("prison:client:SetLockDown", -1, true)
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player ~= nil then
            if (Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty) then
                TriggerClientEvent("prison:client:PrisonBreakAlert", v)
            end
        end
	end
end)

RegisterNetEvent('prison:server:SetGateHit', function(key)
    TriggerClientEvent("prison:client:SetGateHit", -1, key, true)
    if math.random(1, 100) <= 50 then
        for k, v in pairs(QBCore.Functions.GetPlayers()) do
            local Player = QBCore.Functions.GetPlayer(v)
            if Player ~= nil then
                if (Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty) then
                    TriggerClientEvent("prison:client:PrisonBreakAlert", v)
                end
            end
        end
    end
end)

RegisterNetEvent('prison:server:CheckRecordStatus', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local CriminalRecord = Player.PlayerData.metadata["criminalrecord"]
    local currentDate = os.date("*t")

    if (CriminalRecord["date"].month + 1) == 13 then
        CriminalRecord["date"].month = 0
    end

    if CriminalRecord["hasRecord"] then
        if currentDate.month == (CriminalRecord["date"].month + 1) or currentDate.day == (CriminalRecord["date"].day - 1) then
            CriminalRecord["hasRecord"] = false
            CriminalRecord["date"] = nil
        end
    end
end)

RegisterNetEvent('prison:server:JailAlarm', function()
    if not AlarmActivated then
        TriggerClientEvent('prison:client:JailAlarm', -1, true)
        SetTimeout(5 * (60 * 1000), function()
            TriggerClientEvent('prison:client:JailAlarm', -1, false)
        end)
    end
end)

QBCore.Functions.CreateCallback('prison:server:IsAlarmActive', function(source, cb)
    cb(AlarmActivated)
end)

-----------------------------
-- REQUIRED CUP ITEM (WIP) --
-----------------------------

--[[QBCore.Functions.CreateCallback('prison:server:GetItemsNeeded', function(source, cb, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player ~= nil then 
        local Drill = Player.Functions.GetItemByName(item)
        if Drill ~= nil then
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)]]--

---------------------
-- CRAFTING ITEMS --
---------------------

-- Get Random Crafting Item
RegisterNetEvent('qb-prison:server:GetCraftingItems', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local itemamount = tonumber(amount)
    local craftingitem = tostring(item)

    if Config.Debug then
        print(craftingitem, itemamount)
    end

    Player.Functions.AddItem(craftingitem, itemamount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[craftingitem], 'add', itemamount)
end)

-- Get Crafted Item
RegisterNetEvent('qb-prison:server:GetCraftedItem', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = data

    if Config.Debug then
        print(item)
    end

    Player.Functions.AddItem(item, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add', 1)
end)

-- Checks for Materials
QBCore.Functions.CreateCallback('qb-prison:server:CraftingMaterials', function(source, cb, materials)
    local src = source
    local hasItems = false
    local matscheck = 0
    local player = QBCore.Functions.GetPlayer(source)
    for k, v in pairs(materials) do
        if player.Functions.GetItemByName(v.item) and player.Functions.GetItemByName(v.item).amount >= v.amount then
            matscheck = matscheck + 1
            if matscheck == #materials then
                cb(true)
            end
        else
            cb(false)
            return
        end
    end
end)


--------------------
-- UNUSED -- WIP --
--------------------

--- Going to try and make work for lifers to main these jobs as well with rep xp etc.

--[[ local PrisonJobs = {
	"electrician",
	"cook",
	"janitor",
}

function IsPrisonJob(job)
    local retval = false
    for k, v in pairs(PrisonJobs) do
        if v == job then
            retval = true
        end
    end
    return retval
end

RegisterServerEvent('qb-prison:server:prisonwork')
AddEventHandler('qb-prison:server:prisonwork', function(job)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Ped = GetPlayerPed(src)
    local PedCoords = GetEntityCoords(Ped)
    local JobInfo = QBCore.Shared.Jobs[job]

    if (#(PedCoords - Config.Locations.jobs["work"].coords) >= 20.0) then
        return DropPlayer(source, "Attempted exploit abuse")
    end

    Player.Functions.SetJob(job, 0)
    TriggerClientEvent('QBCore:Notify', src, 'Congratulations with your new job! ('..JobInfo.label..')')
end) ]]--
