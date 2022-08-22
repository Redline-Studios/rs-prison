# Support the team on Ko-fi

## - Thrasherrr
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/thrasherrr)

## - xViperAG
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/xviperag)

## (v1.2) qb-prison:
- Updated Prison Script for QB-Policejob Modified by IN1GHTM4R3
- Forked & Modified to v1.2: Thrasherrr#9224

-----------------------------------------------------------------------------------------------------------------

# Just Added v1.2:
- Added Crafting
- Crafting items are set in config. Change items and amount required to craft
- Crafting currently uses NoobySloths Custom-Weapons for Prison Shiv: https://github.com/NoobySloth/Custom-Weapons

-----------------------------------------------------------------------------------------------------------------

# Just Added v1.1:
- Added Create / Delete Functions for Target Zones: Check Time / New Job, Canteen, and Slushy Machine
- Slushy system functions & targeting by Primal#4155 (Add 'slushy' to core items, image provided)
- Added Jobs: Cook & Janitor
- Added Config for ps-dispatch use. https://github.com/Project-Sloth/ps-dispatch
- Added Config options for print debug and PolyZone debugs

-----------------------------------------------------------------------------------------------------------------

## Installation:
- Add slushy.png to your inventory/html/images folder
- Add 'slushy' to qb-core/shared/items.lua
```lua
['slushy']                      = {['name'] = 'slushy',                     ['label'] = 'Slushy',                   ['weight'] = 750,       ['type'] = 'item',      ['image'] = 'slushy.png',       ['unique'] = true,      ['useable'] = true,     ['shouldClose'] = true,     ['combinable'] = nil,   ['description'] = 'A nice cold drink in the coldest place in San Andreas'},
```
- Add to qb-smallreources/config.lua ```["slushy"] = math.random(35, 54),```
- Add to qb-smallresources/server/consumables.lua
```lua
QBCore.Functions.CreateUseableItem("slushy", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)
```
- Add this to qb-smallresources/config.lua under ConsumeablesDrink = { ```["slushy"] = math.random(35, 54),```

-----------------------------------------------------------------------------------------------------------------

### Optional: If you have ps-buffs, add this to qb-smallresources/client/consumables.lua after the SetMetaData Server Event

```lua
        if itemName == "slushy" then
            exports['ps-buffs']:AddBuff("super-thirst", 25000)
        end
```

-----------------------------------------------------------------------------------------------------------------

## Future Updates / WIP: 
- Prison Lifer Job (Work In Progress)
- Create CitizenID Table for Lifers - They will not get time reduction

-----------------------------------------------------------------------------------------------------------------

## Dependencies:

- qb-policejob https://github.com/qbcore-framework/qb-policejob
- qb-target https://github.com/qbcore-framework/qb-target
- qb-menu https://github.com/qbcore-framework/qb-menu
- qb-lock https://github.com/Tex27/qb-lock
- OPTIONAL FOR PRISON SHIV: Custom-Weapons https://github.com/NoobySloth/Custom-Weapons

-----------------------------------------------------------------------------------------------------------------

## Credits:
- IN1GHTM4R3 - The original idea
- Primal#4155 - Original Targeting
- xViperAG https://github.com/xViperAG - Picked up the project!
- NoobySloth - Created Prison Shank Model
- QB-Core Framework - For creating the framework!

-----------------------------------------------------------------------------------------------------------------

# License

    QBCore Framework
    Copyright (C) 2021 Joshua Eger

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>
