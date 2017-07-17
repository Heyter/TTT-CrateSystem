local os, file, hook, tonumber, tostring, ipairs, string, table = os, file, hook, tonumber, tostring, ipairs, string, table

local pmeta = FindMetaTable("Player") -- Gets the meta table
local DAY = os.date( "%d-%m-%Y" , os.time() ) -- The day the file started on.

-- So they you can disable logging
if (GarrBearsCrates.Settings.Logging) then
	--[[-------------------------------------------------------------------------
	Called on server start up to open the log file
	---------------------------------------------------------------------------]]
	local function StartDataLog()
		local date = os.date( "%d-%m-%Y" , os.time() )

		file.CreateDir("crates/logs")

		if !(file.Exists("crates/logs/" .. date .. ".txt", "DATA")) then
			file.Write("crates/logs/" .. date .. ".txt", "[" .. date .. "] Garr_Bear's Crate system. \n\n")
		end
	end

	-- For setting up logging data
	hook.Add("Initialize", "StartUpLogs", function()
		StartDataLog()
		file.CreateDir("crates/ShopData")
	end)

   --[[-------------------------------------------------------------------------
   Called to log all the data

               Arguments:
                  • string data
   ---------------------------------------------------------------------------]]
	function LogData( data )
		local date = os.date( "%d-%m-%Y", os.time() )
		local time = os.date( "%H:%M:%S", os.time() )

		-- In case the day changes mid round... 
		-- So I was working on this late at night and it broke... What are the chances right.

		if date != DAY then
			StartDataLog()
		end

		--------------------------- The File -------------- The Time ----- The Data - New Line -- idk why I did this
		file.Append( "crates/logs/" .. date .. ".txt", "[" .. time .. "] " .. data .. "\n" )

		if (GarrBearsCrates.Settings.ConsoleLogging) then
			print( "[" .. time .. "] " .. data )
		end
	end
end

--[[-------------------------------------------------------------------------
Returns if the player has the item
---------------------------------------------------------------------------]]
function pmeta:HasItem( item )
   if self:GetPlayerItem( item ) > 0 then
      return true
   else
      return false
   end
end

--[[-------------------------------------------------------------------------
Returns if the player has the money
---------------------------------------------------------------------------]]
function pmeta:HasMoney( money ) 
   if self:GetMoney() >= money then
      return true
   else
      return false
   end
end 

--[[-------------------------------------------------------------------------
Creates The player data file
            Meta Table:
               • Player Varible
---------------------------------------------------------------------------]]
function pmeta:SetUpPlayerData()
   local path = "crates/PLAYER_" .. self:SteamID64() .. "/maininfo.txt"
   local money = "crates/PLAYER_" .. self:SteamID64() .. "/money.txt"
   local namepath = "crates/PLAYER_" .. self:SteamID64() .. "/name.txt"
   local weaponPrim = "crates/PLAYER_" .. self:SteamID64() .. "/weaponloadout/prim.txt"
   local weaponSecound = "crates/PLAYER_" .. self:SteamID64() .. "/weaponloadout/secound.txt"
   local weaponMelee = "crates/PLAYER_" .. self:SteamID64() .. "/weaponloadout/melee.txt"
   local weaponSpecial = "crates/PLAYER_" .. self:SteamID64() .. "/weaponloadout/special.txt"

   file.CreateDir("crates/PLAYER_" .. self:SteamID64() .. "/") 
   file.CreateDir("crates/PLAYER_" .. self:SteamID64() .. "/weaponloadout")

   if !file.Exists( path, "DATA") then
      local PlayerBasicData = "ID: " .. self:SteamID() .. "\nID64: " .. self:SteamID64() .. "\nAccountID: " .. self:AccountID()
      local PlayerData = PlayerBasicData // Might Add Stuff later

      file.Write( path, PlayerData )
   end

   -- I didn't want to use a for loop in a function that might be called a lot at one time (A lot of people joining at the same time)
   if !(file.Exists( namepath, "DATA") ) then
      file.Write( namepath, self:Nick() )
   end

   if !(file.Read( namepath ) == self:Nick() ) then
      file.Write( namepath, self:Nick() )
   end

   if !file.Exists( weaponPrim, "DATA" ) then
      file.Write( weaponPrim, "" )
   end

   if !file.Exists( weaponSecound, "DATA" ) then
      file.Write( weaponSecound, "" )
   end

   if !file.Exists( weaponMelee, "DATA" ) then
      file.Write( weaponMelee, "" )
   end

   if !file.Exists( weaponSpecial, "DATA" ) then
      file.Write( weaponSpecial, "" )
   end

   if !file.Exists( money, "DATA" ) then
      file.Write( money, GarrBearsCrates.Settings.PlayersStartingMoney )
   end
end

--[[-------------------------------------------------------------------------
Gets the players money
            Meta Table:
               • Player
---------------------------------------------------------------------------]]
function pmeta:GetMoney()
   return tonumber( file.Read( "crates/PLAYER_" .. self:SteamID64() .. "/money.txt" ) )
end

--[[-------------------------------------------------------------------------
Adds money to the players total amount
            Meta Table:
               • Player

            Arguments:
               • number amount
---------------------------------------------------------------------------]]
function pmeta:AddMoney( amount )
   local money = self:GetMoney() + amount

   file.Write( "crates/PLAYER_" .. self:SteamID64() .. "/money.txt", tostring( money ) )
end

--[[-------------------------------------------------------------------------
Adds money to the player from an id
            Arguments:
               • string id
               • number amount
---------------------------------------------------------------------------]]
function AddMoneyFromID( id, amount )
   local money = self:GetMoney() + amount

   file.Write( "crates/PLAYER_" .. id .. "/money.txt", tostring( money ) )
end
--[[-------------------------------------------------------------------------
Subtracts money from the players total amount
            Meta Table:
               • Player

            Arguments:
               • number amount

            Returns:
               • false if the player doesn't have the money
---------------------------------------------------------------------------]]
function pmeta:SubMoney( amount )
   local money = self:GetMoney() - amount

   if money >= 0 then
      file.Write( "crates/PLAYER_" .. self:SteamID64() .. "/money.txt", tostring( money ) )
   else
      return false
   end
end

--[[-------------------------------------------------------------------------
Sets the players load out
            Meta Table:
               • Player

            Arguments:
               • string weaponClassName
               • string weaponType
---------------------------------------------------------------------------]]
function pmeta:SetLoadOut( weaponClassName, weaponType )
   local path = "crates/PLAYER_" .. self:SteamID64() .. "weaponloadout/" .. weaponType .. ".txt"

   file.CreateDir( "crates/PLAYER_" .. self:SteamID64() .. "/weaponloadout" ) 

   file.Write( path, weaponClassName )

end

--[[-------------------------------------------------------------------------
Gets the players loadout
            Meta Table:
               • Player

            Argumetns:
               • string weaponType

            Returns:
               • string weaponClass
---------------------------------------------------------------------------]]
function pmeta:GetLoadOut( weaponType )
   local path = "crates/PLAYER_" .. self:SteamID64() .. "weaponloadout/" .. weaponType .. ".txt"

   return file.Read( path, "DATA" )
end

--[[-------------------------------------------------------------------------
Gets the amount of a item a player has.
            Meta Table:
               • Player Varible

            Arguments
               • number itemID

            Returns:
               • number Item amount
---------------------------------------------------------------------------]]
function pmeta:GetPlayerItem( itemID )

   local path = "crates/PLAYER_"..self:SteamID64().."/ITEM_"..itemID..".txt"

   if file.Exists( path, "DATA") then
      local Data = file.Read(path, "DATA")
      if Data == nil then 
         return 0 
      end

      return tonumber(Data) -- Number of items
   else
      return 0
   end
end

--[[-------------------------------------------------------------------------
Gives a player an item or items
            Meta Table
               • Player

            Arguments
               • number itemID
               • number amount
---------------------------------------------------------------------------]]
function pmeta:GiveItemToPlayer( itemID, amount )
   local path = "crates/PLAYER_"..self:SteamID64().."/ITEM_"..itemID..".txt"

   if amount == nil then 
      amount = 1
   end

   file.CreateDir("crates/PLAYER_"..self:SteamID64() )

   if file.Exists( path, "DATA" ) then
      local Data = file.Read( path, "DATA" )
      
      if Data == "" then 
         file.Write( path, amount )
      else
         file.Write( path, (tonumber(Data) + amount) )
      end
   else
      local Data = file.Read( path, "DATA" )
      
      if Data == nil or Data == 0 then 
         file.Write( path, amount )
      else
         file.Write( path, (tonumber(Data) + amount) )
      end
   end
end 



--[[-------------------------------------------------------------------------
Takes a item or items from a player.
            Meta Table
               • Player

            Arguments
               • number ItemID
               • nubmer amount
---------------------------------------------------------------------------]]
function pmeta:SubItem( itemID, amount )
   local path = "crates/PLAYER_"..self:SteamID64().."/ITEM_"..itemID..".txt"

   if amount == nil then 
      amount = 1
   end
   
   if file.Exists( path, "DATA" ) then
      local Data = file.Read( path, "DATA" )
      
      if Data == nil then 
         file.Write( path, 0 )
      elseif ( tonumber(data) - amount ) <= 0 then 
         file.Write( path, 0 )
      else
         file.Write( path, tonumber(data) - amount)
      end
   end
end

--[[-------------------------------------------------------------------------
Resets all the players items
            Meta Table
               • Player

            Arguments
               • number itemID
---------------------------------------------------------------------------]]
function pmeta:ResetPlayerItem( itemID )
   local path = "crates/PLAYER_"..self:SteamID64().."/ITEM_"..itemID..".txt"
   file.Write(path, 0)
end

--[[-------------------------------------------------------------------------
Gets rid of all the players items... ALL OF THEM.

Might cause some lag for a bit. depends on how many items you have.

            Meta Table
               • Player
---------------------------------------------------------------------------]]
function pmeta:ErasePlayer()
   local ItemFiles, itemFolders = file.Find("crates/PLAYER_"..self:SteamID64(), "DATA")
   for k,v in ipairs( ItemFiles ) do
      file.Delete( "crates/PLAYER_"..self:SteamID64() .. "/" .. v)
   end
end

--[[-------------------------------------------------------------------------
Returns the shops items data
---------------------------------------------------------------------------]]
local util_JSONToTable = util.JSONToTable
function ViewShopItem( shopID ) 
   local item = file.Read( "crates/ShopData/" .. shopID .. ".txt", "DATA")
   item = util_JSONToTable( item )

   return item
end

--[[-------------------------------------------------------------------------
Gets the first aviable shop id0
---------------------------------------------------------------------------]]
function GetShopID()
   local shopFiles, shopFolders = file.Find("crates/ShopData/*", "DATA")
   local itemsForSaleCount = #shopFiles

   for k,v in ipairs( shopFiles ) do
      if k != string.TrimRight( v, ".txt" ) then
         return k
      end
   end

   -- won't get here if theres a missing ID
   return ( itemsForSaleCount + 1 )
end

--[[-------------------------------------------------------------------------
Gets the items the player has for sale
---------------------------------------------------------------------------]]
function pmeta:ItemsForSale()
   local itemsForSale, subFolders = file.Find("crates/ShopData/*", "DATA")
   local idHolder = {}
   local forSaleItems = {}

   for k,v in ipairs(itemsForSale) do
      idHolder = file.Read( "crates/ShopData/" .. v .. ".txt", "DATA")
      idHolder = util_JSONToTable(idHolder)
      
      if self:AccountID() == idHolder[1] then
         table.insert(forSaleItems, idHolder)
      end
   end

   LogData( self:Nick() .. " [" .. self:SteamID() .. "] put " .. item[3] .. " up for sale" )

   return forSaleItems
end

--[[-------------------------------------------------------------------------
Table Format
---------------------------------------------------------------------------]]
local util_TableToJSON = util.TableToJSON
function pmeta:SoldItem( item, price )
   file.CreateDir("crates/ShopData")
   local shopTable = { self:AccountID(), GetShopID(), item, price }
   local data = util_TableToJSON(shopTable, true) -- Its true so if someone wants to go in and change data and it looks pretty :)

   self:SubItem( item )

   file.Write( "crates/ShopData/" .. GetShopID() .. ".txt" )
end

local math_Round = math.Round
function pmeta:BoughtItem( shopID )
   local item = ViewShopItem(shopID)
   local taxAmount = GarrBearsCrates.Settings.ShopsTaxAmount * 0.01
   local money = 0

   self:SubMoney( item[4] )
   self:GiveItemToPlayer( item[3] )
   if GarrBearsCrates.Settings.ShopsTax then
      money = math_Round( item[4] - (taxAmount * item[4]) ) -- I don't deal with cents #DeathToThePenny
      AddMoneyFromID( item[1], money )
   else
      AddMoneyFromID( item[1], item[4] )
   end

   file.Delete("crates/ShopData/" .. item[2] .. ".txt")

   LogData( self:Nick() .. " [" .. self:SteamID() .. "] Bought " .. item[3] .. " from " .. item[1] )

end

--[[-------------------------------------------------------------------------
Gets the all the items in the shop
---------------------------------------------------------------------------]]
function GetShopItemsForCleint()
   local shopFiles, shopFolders = file.Find("crates/ShopData/*", "DATA")
   local shopItem = {}
   local shopItems = {}

   for k,v in ipairs( shopFiles ) do
      shopItem = file.Read("crates/ShopData/" .. v, "DATA")
      shopItem = util_JSONToTable(shopItem)

      table.insert(shopItems, nil, shopItem)
   end

   return shopItems
end

