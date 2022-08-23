Config = {}

----------------------
-- Dispatch Configs --
----------------------

Config.PSDispatch = true -- Set to true for using ps-dispatch
--[[

COMING SOON!

Config.CoreDispatch = false
Config.CDDispatch = false

]]--

-------------------------
-- Interaction Configs --
-------------------------

--[[

COMING SOON!

Config.PSUI = false
Config.QBSkillbar = false
Config.QBLock = true

]]--

-------------------
-- Debug Configs --
-------------------

Config.Debug = true -- Set to true for server/client prints
Config.DebugPoly = true -- Set to true to debug PolyZones
Config.Crafting = true -- Set to false to disable crafting or if you own qb-prisonjobs

----------------------
-- Location Configs --
----------------------

Config.CheckTimeLocation = vector3(1827.3, 2587.72, 46.01)
Config.CraftingLocation = vector4(1669.21, 2566.56, 45.56, 270)
Config.Lockers = {

    -- Cells 1 through 13

    { coords = vector4(1774.54, 2483.99, 45.74, 119.67), }, -- Cell 1
    { coords = vector4(1774.54, 2483.99, 45.74, 119.67), }, -- Cell 2
    { coords = vector4(1774.54, 2483.99, 45.74, 119.67), }, -- Cell 3
    { coords = vector4(1774.54, 2483.99, 45.74, 119.67), }, -- Cell 4
    { coords = vector4(1774.54, 2483.99, 45.74, 119.67), }, -- Cell 5
    { coords = vector4(1774.54, 2483.99, 45.74, 119.67), }, -- Cell 6
    { coords = vector4(1774.54, 2483.99, 45.74, 119.67), }, -- Cell 7
    { coords = vector4(1774.54, 2483.99, 45.74, 119.67), }, -- Cell 8
    { coords = vector4(1774.54, 2483.99, 45.74, 119.67), }, -- Cell 9
    { coords = vector4(1774.54, 2483.99, 45.74, 119.67), }, -- Cell 10
    { coords = vector4(1774.54, 2483.99, 45.74, 119.67), }, -- Cell 11
    { coords = vector4(1774.54, 2483.99, 45.74, 119.67), }, -- Cell 12
    { coords = vector4(1774.54, 2483.99, 45.74, 119.67), }, -- Cell 13

    -- Cells 14 through 27

    { coords = vector4(1777.72, 2485.75, 45.74, 119.67), }, -- Cell 14
    { coords = vector4(1774.54, 2483.99, 45.74, 119.67), }, -- Cell 15
    { coords = vector4(1774.54, 2483.99, 45.74, 119.67), }, -- Cell 16
    { coords = vector4(1774.54, 2483.99, 45.74, 119.67), }, -- Cell 17
    { coords = vector4(1774.54, 2483.99, 45.74, 119.67), }, -- Cell 18
    { coords = vector4(1774.54, 2483.99, 45.74, 119.67), }, -- Cell 19
    { coords = vector4(1777.72, 2485.75, 45.74, 119.67), }, -- Cell 20
    { coords = vector4(1774.54, 2483.99, 45.74, 119.67), }, -- Cell 21
    { coords = vector4(1774.54, 2483.99, 45.74, 119.67), }, -- Cell 22
    { coords = vector4(1774.54, 2483.99, 45.74, 119.67), }, -- Cell 23
    { coords = vector4(1774.54, 2483.99, 45.74, 119.67), }, -- Cell 24
    { coords = vector4(1774.54, 2483.99, 45.74, 119.67), }, -- Cell 25
    { coords = vector4(1774.54, 2483.99, 45.74, 119.67), }, -- Cell 26
    { coords = vector4(1774.54, 2483.99, 45.74, 119.67), }, -- Cell 27
}

-----------------
-- Job Configs --
-----------------

Config.Jobs = {
    ["electrician"] = "Electrician",
    ["cook"] = "Cook",
    ["janitor"] = "Janitor",
}

Config.PrisonJobs = {
    [1] = {
        name = "electrician",
        label = "Prison Electrician",
    },
    [2] = {
        name = "cook",
        label = "Prison Cook",
    },
    [3] = {
        name = "janitor",
        label = "Prison Janitor",
    },
}

Config.PrisonWage = 10

----------------------------
-- Basic Location Configs --
----------------------------

Config.Locations = {
    jobs = {
        ["electrician"] = {
            [1] = {
                coords = vector4(1761.46, 2540.41, 45.56, 272.249)
            },
            [2] = {
                coords = vector4(1718.54, 2527.802, 45.56, 272.249)
            },
            [3] = {
                coords = vector4(1700.199, 2474.811, 45.56, 272.249)
            },
            [4] = {
                coords = vector4(1664.827, 2501.58, 45.56, 272.249)
            },
            [5] = {
                coords = vector4(1621.622, 2509.302, 45.56, 272.249)
            },
            [6] = {
                coords = vector4(1627.936, 2538.393, 45.56, 272.249)
            },
            [7] = {
                coords = vector4(1625.1, 2575.988, 45.56, 272.249)
            }
        },
        ["cook"] = {
            [1] = {
                coords = vector4(1780.85, 2564.29, 45.67, 4.85)
            },
            [2] = {
                coords = vector4(1777.57, 2561.91, 45.67, 92.91)
            },
            [3] = {
                coords = vector4(1784.56, 2564.17, 45.67, 355.81)
            },
            [4] = {
                coords = vector4(1786.54, 2564.33, 45.67, 356.82)
            },
            [5] = {
                coords = vector4(1780.19, 2560.78, 45.67, 180.96)
            },
        },
        ["janitor"] = {
            [1] = {
                coords = vector4(1758.37, 2566.15, 45.55, 102.74)
            },
            [2] = {
                coords = vector4(1756.89, 2514.18, 45.55, 128.11)
            },
            [3] = {
                coords = vector4(1622.82, 2563.98, 45.56, 33.26)
            },
            [4] = {
                coords = vector4(1683.65, 2565.2, 45.55, 220.94)
            },
            [5] = {
                coords = vector4(1635.25, 2502.33, 45.55, 314.76)
            },
            [6] = {
                coords = vector4(1655.69, 2527.02, 45.55, 325.87)
            },
            [7] = {
                coords = vector4(1689.13, 2517.97, 45.56, 278.94)
            },
        },
    },
    ["freedom"] = {
        coords = vector4(1827.3, 2587.72, 46.01, 91.44)
    },
    ["outside"] = {
        coords = vector4(1848.13, 2586.05, 45.67, 269.5)
    },
    ["yard"] = {
        coords = vector4(1765.67, 2565.91, 45.56, 1.5)
    },
    ["middle"] = {
        coords = vector4(1693.33, 2569.51, 45.55, 123.5)
    },
    ["shop"] = {
        coords = vector4(1786.19, 2557.77, 45.62, 0.5)
    },
    ["work"] = {
        coords = vector4(1828.83, 2580.21, 46.01, 0.5) --coords = vector3(1828.83, 2580.21, 46.01),
    },
    spawns = {
        [1] = {
            animation = "bumsleep",
            coords = vector4(1661.046, 2524.681, 45.564, 260.545)
        },
        [2] = {
            animation = "lean",
            coords = vector4(1650.812, 2540.582, 45.564, 230.436)
        },
        [3] = {
            animation = "lean",
            coords = vector4(1654.959, 2545.535, 45.564, 230.436)
        },
        [4] = {
            animation = "lean",
            coords = vector4(1697.106, 2525.558, 45.564, 187.208)
        },
        [5] = {
            animation = "sitchair4",
            coords = vector4(1673.084, 2519.823, 45.564, 229.542)
        },
        [6] = {
            animation = "sitchair",
            coords = vector4(1666.029, 2511.367, 45.564, 233.888)
        },
        [7] = {
            animation = "sitchair4",
            coords = vector4(1691.229, 2509.635, 45.564, 52.432)
        },
        [8] = {
            animation = "finger2",
            coords = vector4(1770.59, 2536.064, 45.564, 258.113)
        },
        [9] = {
            animation = "smoke",
            coords = vector4(1792.45, 2584.37, 45.56, 276.24)
        },
        [10] = {
            animation = "smoke",
            coords = vector4(1768.33, 2566.08, 45.56, 176.83)
        },
        [11] = {
            animation = "smoke",
            coords = vector4(1696.09, 2469.4, 45.56, 1.4)
        }
    }
}

---------------------
-- Canteen Configs --
---------------------

Config.CanteenItems = {
    [1] = {
        name = "sandwich",
        price = 4,
        amount = 50,
        info = {},
        type = "item",
        slot = 1
    },
}

Config.SlushyItems = {
    [1] = {
        name = "slushy",
        price = 35,
        amount = 1,
        info = {},
        type = "item",
        slot = 1
    },
}

Config.SodaItems = {
    [1] = {
        name = "kurkakola",
        price = 35,
        amount = 1,
        info = {},
        type = "item",
        slot = 1
    },
        [2] = {
        name = "water_bottle",
        price = 4,
        amount = 50,
        info = {},
        type = "item",
        slot = 2
    }
}

Config.CoffeeItems = {
    [1] = {
        name = "coffee",
        price = 35,
        amount = 1,
        info = {},
        type = "item",
        slot = 1
    },
}

----------------------
-- Crafting Configs --
----------------------

-- Chance to receive crafting items
Config.CraftingItemChance = 25 -- 25% Chance to Receive Crafting Item

-- Randomly find these items when doing jobs
Config.JanitorItems = { -- Items found when cleaning
    [1] = { item = 'metalscrap', amount = math.random(1,3) },
    [2] = { item = 'rubber', amount = math.random(2,4) },
    [3] = { item = 'steel', amount = math.random(3,7) },
    [4] = { item = 'plastic', amount = math.random(1,2) },
}
Config.CookItems = { -- Items found when cooking
    [1] = { item = 'metalscrap', amount = math.random(1,3) },
    [2] = { item = 'rubber', amount = math.random(2,4) },
    [3] = { item = 'steel', amount = math.random(3,7) },
    [4] = { item = 'plastic', amount = math.random(1,2) },
}
Config.ElectricianItems = { -- Items found when fixing electrical
    [1] = { item = 'metalscrap', amount = math.random(1,3) },
    [2] = { item = 'rubber', amount = math.random(2,4) },
    [3] = { item = 'steel', amount = math.random(3,7) },
    [4] = { item = 'plastic', amount = math.random(1,2) },
}

-- Crafting Menu
Config.CraftingItems = { 

    ----------------------------------------------------------

    -- THIS IS AN EXAMPLE, DO NOT REMOVE:
    -- You can add items to this menu

    -- ["Electronic Kit"] = {           -- Header of Menu
    --     materials = {                -- List Materials Required
    --         [1] = {
    --            item = "electronics",  -- Item Hash Name
    --            amount = 1            -- Item Amount
    --         },
    --         [2] = {
    --             item = "trojan_usb",
    --             amount = 1
    --         },
    --     },
    --     receive = "electronickit"     -- Received Item Hash Name
    -- },

    ----------------------------------------------------------

    ["Prison Shank"] = {
        materials = {
            [1] = {
                item = "steel",
                amount = 20
            },
            [2] = {
                item = "rubber",
                amount = 20
            },
        },
        receive = "weapon_shiv"
    },

    ["Trojan USB"] = {
        materials = {
            [1] = {
                item = "steel",
                amount = 10
            },
            [2] = {
                item = "plastic",
                amount = 15
            },
        },
        receive = "trojan_usb" 
    },

    ["Advanced Lockpick"] = {
        materials = {
            [1] = {
                item = "lockpick",
                amount = 1
            },
            [2] = {
                item = "metalscrap",
                amount = 10
            },
            [3] = {
                item = "plastic",
                amount = 15
            },
        },
        receive = "advancedlockpick"
    },

    ["Lockpick"] = {
        materials = {
            [1] = {
                item = "metalscrap",
                amount = 15
            },          
        },
        receive = "lockpick"
    }
}
