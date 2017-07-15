--[[-------------------------------------------------------------------------
Main Server Code
---------------------------------------------------------------------------]]

-- Net work hooks // I like to have a lot
util.AddNetworkString( "CrateMenuOpen" )
util.AddNetworkString( "OpeningCrates" )
util.AddNetworkString( "FailedOpeningCrate" )
util.AddNetworkString( "RequestItems" )
util.AddNetworkString( "TellPlayerTheirItems")
util.AddNetworkString( "RequestCrafting" )
util.AddNetworkString( "SendCrafting" )
util.AddNetworkString( "CraftingError" ) 
util.AddNetworkString( "GetLoadOutItems" )
util.AddNetworkString( "SendLoadOutItems" )
util.AddNetworkString( "SetNewLoadOut" )
util.AddNetworkString( "ItemMaterialSetter" )
util.AddNetworkString( "SetNewMaterial" )
util.AddNetworkString( "GetMoney" )
util.AddNetworkString( "SendMoney" )
util.AddNetworkString( "GetShopItems" )
util.AddNetworkString( "SendShopItems" )
util.AddNetworkString( "BuyItem" )
util.AddNetworkString( "SellItem" )
util.AddNetworkString( "AddItemCommand" )
util.AddNetworkString( "TakeItemCommand" )
util.AddNetworkString( "GiveMoneyCommand" )
util.AddNetworkString( "TakeMoneyCommand" )
util.AddNetworkString( "ErasePlayerCommand" )

-- Add client files
AddCSLuaFile("shared.lua")
AddCSLuaFile("MaterialSetter.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("cl_getMaterial.lua")
AddCSLuaFile("cl_menu.lua")
AddCSLuaFile("cl_openCrate.lua")
AddCSLuaFile("cl_playersitems.lua")
AddCSLuaFile("cl_crafting.lua")
AddCSLuaFile("cl_loadout.lua")
AddCSLuaFile("cl_shop.lua")
AddCSLuaFile("cl_admintab.lua")

-- include main server code
include("shared.lua")
include("MaterialSetter.lua")
include("sv_crateRecipies.lua")
include("sv_datastorage.lua")
include("sv_admintab.lua")
include("sv_shop.lua")
include("sv_givecrates.lua")
include("sv_openingCrates.lua")
include("sv_crafting.lua")
include("sv_GetClientsItems.lua")
include("sv_loadout.lua")
include("sv_material.lua")

-- For setting up logging data
hook.Add("Initialize", "StartUpLogs", function()
   file.CreateDir("crates")

   StartServerData()
end )

--[[
-- Just crate basic player data
hook.Add("PlayerInitialSpawn", "PlayerDataSetUp", function( ply )
   ply:SetUpPlayerData() // Crates there folder.
end )

hook.Add("PlayerSay", "OpenTheCrateMenu", function( ply, text, teamChat )
   for k,v in pairs( GarrBearsCrates.Settings.ChatCommands ) do
      if string.lower(text) == v then
         net.Start("CrateMenuOpen")
         net.Send(ply)
      end
   end
end )
]]

