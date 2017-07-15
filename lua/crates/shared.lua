--[[-------------------------------------------------------------------------
Shared stuff like settings and item id numbers
---------------------------------------------------------------------------]]


-- Main groups
GarrBearsCrates = {} -- master
GarrBearsCrates.Keys = {}
GarrBearsCrates.Item = {}
GarrBearsCrates.Crates = {}
GarrBearsCrates.Weapons = {}
GarrBearsCrates.Settings = {}
GarrBearsCrates.Crates.Drops = {}

-- Settings

-- Where or not to do logging
GarrBearsCrates.Settings.Logging = true
GarrBearsCrates.Settings.ConsoleLogging = true -- Prints logs to console too

-- Special crate settings
GarrBearsCrates.Settings.SpecialCrate = false
GarrBearsCrates.Settings.SpecialCrateChance = 5000 -- A 1 in [X] chance

-- Crate settings // Make sure they all add up to 100
GarrBearsCrates.Settings.SmallCrateChance = 60 -- 60 % chance
GarrBearsCrates.Settings.NormalCrateChance = 20 -- a 20 % chance
GarrBearsCrates.Settings.BigCrateChance = 15 -- a 15% chance
GarrBearsCrates.Settings.SuperCrateChance = 5 -- a 5% chance

-- How much money the playe startes with.
GarrBearsCrates.Settings.PlayersStartingMoney = 200

-- Shop Settings
GarrBearsCrates.Settings.ShopsTax = false -- If shop tax in enabled.
GarrBearsCrates.Settings.ShopsTaxAmount = 8 -- % of How much money should the shop take                                                It wont work because its upercase

-- THe chat command to open the menu
GarrBearsCrates.Settings.ChatCommands = { "!crate", "!crates", "!garrbearscrates", "!garrbearscrate", "/crates", "/garrbearscrates", "/crate", "!PIE" } -- Make sure they are lower case

-- Item subcatogries
GarrBearsCrates.Item.Guns = {}
GarrBearsCrates.Item.Props = {}
GarrBearsCrates.Item.Metals = {}
GarrBearsCrates.Item.Metals = {}
GarrBearsCrates.Item.Materials = {}
GarrBearsCrates.Item.WeaponMetals = {}


--[[-------------------------------------------------------------------------
Don't edit the number so that NumberOfForcedRares + NumberOfForcedEpics = 14

There is chance it will cause an error
---------------------------------------------------------------------------]]
-- The crate drops
GarrBearsCrates.Crates.Drops.SmallCrate = {
   NumberOfItems = 24, -- Left over cards are commmon
   NumberOfForcedRares = 2,
   NumberOfForcedEpics = 0,
   LengendaryChance = 0.01 -- 00.01% Chance // Don't put below 0.01
}

GarrBearsCrates.Crates.Drops.NormalCrate = {
   NumberOfItems = 117, -- Left over cards are commmon
   NumberOfForcedRares = 10,
   NumberOfForcedEpics = 2,
   LengendaryChance = 1 -- 1% Chance
}

GarrBearsCrates.Crates.Drops.BigCrate = {
   NumberOfItems = 243, -- Left over cards are commmon
   NumberOfForcedRares = 23,
   NumberOfForcedEpics = 4,
   LengendaryChance = 5 -- 5% Chance
}

GarrBearsCrates.Crates.Drops.SuperCrate = {
   NumberOfItems = 652, -- Left over cards are commmon
   NumberOfForcedRares = 56,
   NumberOfForcedEpics = 10,
   LengendaryChance = 60 -- 60% Chance
}

GarrBearsCrates.Crates.Drops.SpecialCrate = {
   NumberOfItems = 1000, -- Left over cards are commmon
   NumberOfForcedRares = 100,
   NumberOfForcedEpics = 50,
   LengendaryChance = 100 -- 100% Chance
}

-- I might change all the IDS to tables but idk yet
-- I think ill key it like this with 
-- ITEM_[ID]_PROPERTIES and stuff as sort
-- The total number of items
GarrBearsCrates.Item.Total = 17 -- I don't use this... Its just for you to know... I might later tho... This is just so I can know how many items there are

-- The Key Types
GarrBearsCrates.Keys.SmallKey = 1
GarrBearsCrates.Keys.NormalKey = 2
GarrBearsCrates.Keys.BigKey = 3
GarrBearsCrates.Keys.SuperKey = 4
GarrBearsCrates.Keys.SpecialKey = 17

-- The Crate Types
GarrBearsCrates.Crates.SmallCrate = 5
GarrBearsCrates.Crates.NormalCrate = 6
GarrBearsCrates.Crates.BigCrate = 7
GarrBearsCrates.Crates.SuperCrate = 8
GarrBearsCrates.Crates.SpecialCrate = 16


-- The Item types // Metal Types
GarrBearsCrates.Item.Metals.ScrapMetal = 9
GarrBearsCrates.Item.Metals.Metal = 10
GarrBearsCrates.Item.Metals.MetalStack = 11
GarrBearsCrates.Item.Metals.CompactMetal = 12

-- Stuff For Guns
GarrBearsCrates.Item.WeaponMetals.FireingPin = 18 -- 
GarrBearsCrates.Item.WeaponMetals.Trigger = 19 -- 
GarrBearsCrates.Item.WeaponMetals.Barrel = 20 --
GarrBearsCrates.Item.WeaponMetals.Magazine = 21 -- 
GarrBearsCrates.Item.WeaponMetals.Casing = 22 -- 
GarrBearsCrates.Item.WeaponMetals.GunShell = 23
GarrBearsCrates.Item.WeaponMetals.GunItem = 24 -- Used for crafting
GarrBearsCrates.Item.WeaponMetals.FireingHalf = 25
GarrBearsCrates.Item.WeaponMetals.AmmoHalf = 26

-- Crate Drops
GarrBearsCrates.Item.Materials.GreenMate = 13
GarrBearsCrates.Item.Materials.RedMate = 14
GarrBearsCrates.Item.Materials.BlueMate = 15

-- How many weapons There Are
-- If you add more weaposn besure to add to this number and 
-- Weather it is a Common, Rare, Epic, Or Legandary
GarrBearsCrates.Weapons.Amount = 8

-- Weapons are strings
GarrBearsCrates.Weapons.Pistol = "weapon_zm_pistol" -- You can only craft pistols
GarrBearsCrates.Weapons.Glock = "weapon_ttt_glock" -- You can only craft pistols
GarrBearsCrates.Weapons.Degal = "weapon_zm_revolver" -- You can only craft pistols
GarrBearsCrates.Weapons.M16 = "weapon_ttt_m16"
GarrBearsCrates.Weapons.ShotGun = "weapon_zm_shotgun"
GarrBearsCrates.Weapons.Mac10 = "weapon_zm_mac10"
GarrBearsCrates.Weapons.Rifle = "weapon_zm_rifle"
GarrBearsCrates.Weapons.HUGE = "weapon_zm_sledge"
GarrBearsCrates.Weapons.Crowbar = "weapon_zm_improvised"

-- Weapon Types
GarrBearsCrates.Weapons.Primary = {
   GarrBearsCrates.Weapons.M16,
   GarrBearsCrates.Weapons.ShotGun,
   GarrBearsCrates.Weapons.Mac10,
   GarrBearsCrates.Weapons.Rifle, 
   GarrBearsCrates.Weapons.HUGE, 

}

-- Weapon Types
GarrBearsCrates.Weapons.Secondary = {
   GarrBearsCrates.Weapons.Pistol,
   GarrBearsCrates.Weapons.Glock,
   GarrBearsCrates.Weapons.Degal 
}

-- Weapon Types
GarrBearsCrates.Weapons.Melee = {
   GarrBearsCrates.Weapons.Crowbar
}

-- Weapon Types
GarrBearsCrates.Weapons.Special = {
   -- NONE ATM
}

-- What are commons and what are rares
GarrBearsCrates.Crates.Common = {
   -- Everyones gonna have this and never want it. 
   GarrBearsCrates.Item.Materials.GreenMate,
   GarrBearsCrates.Item.Materials.RedMate,
   GarrBearsCrates.Item.Materials.BlueMate,
}

GarrBearsCrates.Crates.Rare = {
   GarrBearsCrates.Weapons.HUGE, -- No one likes the huge

   -- Metals for making keys and guns
   GarrBearsCrates.Item.Metals.MetalStack,
   GarrBearsCrates.Item.Metals.CompactMetal,

   -- You can get keys from crates.
   GarrBearsCrates.Keys.SmallKey,
}

GarrBearsCrates.Crates.Epic = {
   -- The Weapons
   GarrBearsCrates.Weapons.Pistol,
   GarrBearsCrates.Weapons.Degal,
   GarrBearsCrates.Weapons.Glock,


   -- You can get keys from crates.
   GarrBearsCrates.Keys.NormalKey,
   GarrBearsCrates.Keys.BigKey,
}

GarrBearsCrates.Crates.Lengandy = {
   GarrBearsCrates.Weapons.M16,
   GarrBearsCrates.Weapons.ShotGun, 
   GarrBearsCrates.Weapons.Mac10, -- The mac 10 is actully really good in the right hands
   GarrBearsCrates.Weapons.Rifle,
   
   -- You can get keys from crates.
   GarrBearsCrates.Keys.SuperKey,
   GarrBearsCrates.Keys.SpecialKey ,
}

--[[-------------------------------------------------------------------------
Returns if the item is a crate.
            Arguments
               • number item
---------------------------------------------------------------------------]]
function IsCrate( item )
   if (item > 6) and ( item < 9 ) then
      return true
   elseif item == 16 then
      return true
   else
      return false
   end
end

--[[-------------------------------------------------------------------------
Returns if the item is scrap metal
            Arguments
               • any item
            Returns
               • if the item is scrap metal
---------------------------------------------------------------------------]]
function IsScrapMetal( item )
   if item == GarrBearsCrates.Item.Metals.ScrapMetal then
      return true
   else
      return false
   end
end

--[[-------------------------------------------------------------------------
Gets weather the item is a weapon
            Arguments
               • any item

            Returns:
               • boolean weather the item is a weapon
---------------------------------------------------------------------------]]
function IsCrateWeapon( item )
   if item > 1000 and item <= GarrBearsCrates.Weapon.Amount then
      return true
   else
      return false
   end
end

--[[-------------------------------------------------------------------------
Gets weather the item is a legandary
            Arguments:
               • any item
---------------------------------------------------------------------------]]
function IsCommon( item )
   if table.HasValue( GarrBearsCrates.Crates.Common, item ) then
      return true
   else
      return false
   end
end

--[[-------------------------------------------------------------------------
Gets weather the item is a Rare
            Arguments:
               • any item
---------------------------------------------------------------------------]] 
function IsRare( item )
   if table.HasValue( GarrBearsCrates.Crates.Rare, item ) then
      return true
   else
      return false
   end
end

--[[-------------------------------------------------------------------------
Gets weather the item is an Epic
            Arguments:
               • any item
---------------------------------------------------------------------------]]
function IsEpic( item )
   if table.HasValue( GarrBearsCrates.Crates.Epic, item ) then 
      return true
   else
      return false
   end
end

--[[-------------------------------------------------------------------------
Is leganddary
            Arguments:
               • any item
---------------------------------------------------------------------------]]
function IsLegandary( item )
   if table.HasValue( GarrBearsCrates.Crates.Lengandy, item ) then
      return true
   else
      return false
   end
end

--[[-------------------------------------------------------------------------
Is a primary weapon
            Arguments:
               • any weapon
---------------------------------------------------------------------------]]
function IsPrimaryWeapon( weapon )
   if table.HasValue( GarrBearsCrates.Weapons.Primary, weapon:GetClass() ) then
      return true
   else
      return false
   end
end

--[[-------------------------------------------------------------------------
Is a Secondary weapon
            Arguments:
               • any weapon
---------------------------------------------------------------------------]]
function IsSecondaryWeapon( weapon )
   if table.HasValue( GarrBearsCrates.Weapons.Secondary, weapon:GetClass() ) then
      return true
   else
      return false
   end
end

--[[-------------------------------------------------------------------------
Is a melee weapon
            Arguments:
               • any weapon
---------------------------------------------------------------------------]]
function IsMeleeWeapon( weapon )
   if table.HasValue( GarrBearsCrates.Weapons.Melee, weapon:GetClass() ) then
      return true
   else
      return false
   end
end

--[[-------------------------------------------------------------------------
Is a Special weapon
            Arguments:
               • any weapon
---------------------------------------------------------------------------]]
function IsSpecialWeapon( weapon )
   if table.HasValue( GarrBearsCrates.Weapons.Special, weapon:GetClass() ) then
      return true
   else
      return false
   end
end

--[[-------------------------------------------------------------------------
So my friend saw this and told me that I didn't comment and explain this 
well... So I went overbored on the comments. Just a big F U to his face. It 
really wasn't even that bad. On functions that needed explaining I put 
comments. Anywhere that needed explaining I put comments. But NOOOO... I need
more. I really hopes he sees this part. Its 2:23 in the morning. My dog is
asleep. I don't have anything to do. And all my friends are asleep. Oh those
who don't know I made this over a few months by only adding like 1 function
when I opened up sublime. Anytime that I opened it up for any reason I
added/changed something. Like how I store data and items was changed like 5
times. I used strings at first. then tables with string id, then tables with
numbers, then a table with all the data... And finally just numbers. I like
it because its simple but also effective.

Edit:
I added the shop like 5 days before I released this thing. I had to stay at
home waiting for some cable guys and crated it. The laste 4 days where just
a bit of code polish. Yes there is no point to this. I just wanted to type
something for the time being. Razer Chroma is probable the worlds best
keyboted. #NotSponsored I could be tho... *cough* razer *cough* I don't have
youtube channel or any outlit that I post to daily but hey I would promt you
guys any time you want. I really just want free razer products. Like new 
headphones. Mine started to have this buzzing noice like a week ago and its 
bugging me. Its only when nothing is playing. Its not a 'uge problem but ay
if razer wants to send me all there products I'll glady take them. I'm 
getting the iPhone 8 when it comes out. I have a Android right now and its
getting a little old. After the iPhone 8 I'll go back to Android. Just keep 
switching. IDK I just like both. If you couldn't tell im making this as 
pointless as possible.



---------------------------------------------------------------------------]]
