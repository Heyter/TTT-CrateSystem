local table_Random. math_Rand, net = table.Random, math.Rand, net
local pmeta = FindMetaTable( "Player" )

--[[-------------------------------------------------------------------------
Checks to see if the player can open the crate.
               Meta
                  • Player
               Arguments
                  • numner crate

               Returns:
                  • boolean can the crate be opened. 
---------------------------------------------------------------------------]]
function pmeta:CanOpenCrate( crate )
   local itemAmount = 0

   if crate == GarrBearsCrates.Crates.SmallCrate then
      itemAmount = self:GetPlayerItem( GarrBearsCrates.Keys.SmallKey )
   elseif crate == GarrBearsCrates.Crates.NormalCrate then
      itemAmount = self:GetPlayerItem( GarrBearsCrates.Keys.Normal )
   elseif crate == GarrBearsCrates.Crates.BigCrate then
      itemAmount = self:GetPlayerItem( GarrBearsCrates.Keys.BigKey )
   elseif crate == GarrBearsCrates.Crates.SuperCrate then
      itemAmount = self:GetPlayerItem( GarrBearsCrates.Keys.SuperKey )
   else
      return false
   end
   
   if ( itemAmount > 0 ) and ( self:GetPlayerItem( crate ) > 0 ) then
      return true
   end
end

--[[-------------------------------------------------------------------------
Gives common cards to a player
            Meta
               • Player

            Arguments
               • number amount
---------------------------------------------------------------------------]]
function pmeta:GiveCommon( amount )
   for i=1,amount do
      local item = table_Random( GarrBearsCrates.Crates.Common ) -- I might make it the items show themself but idk
      self:GiveItemToPlayer( item )
      
      LogData("[" .. self:SteamID() .. "]" .. self:Nick() .. " Got " .. item .. " from opening a crate.")

   end 
end

--[[-------------------------------------------------------------------------
Gives common cards to a player
            Meta
               • Player

            Arguments
               • number amount
---------------------------------------------------------------------------]]
function pmeta:GiveRare( amount )
   for i=1,amount do
      local item = table_Random( GarrBearsCrates.Crates.Rare )
      self:GiveItemToPlayer( item )
      
      LogData("[" .. self:SteamID() .. "]" .. self:Nick() .. ": " .. " Got " .. item .. " from opening a crate.")

   end 
end

--[[-------------------------------------------------------------------------
Gives common cards to a player
            Meta
               • Player

            Arguments
               • number amount
---------------------------------------------------------------------------]]
function pmeta:GiveEpic( amount )
   for i=1,amount do
      local item = table_Random( GarrBearsCrates.Crates.Epic )
      self:GiveItemToPlayer( item )

      LogData("[" .. self:SteamID() .. "]" .. self:Nick() .. ": " .. " Got " .. item .. " from opening a crate.")

   end 
end

--[[-------------------------------------------------------------------------
Gives common cards to a player
            Meta
               • Player

            Arguments
               • number amount
---------------------------------------------------------------------------]]
function pmeta:GiveLengandy() -- You can only give one... and I know ;)
   local item = table_Random( GarrBearsCrates.Crates.Lengandy )
   self:GiveItemToPlayer( item )

   LogData("[" .. self:SteamID() .. "]" .. self:Nick() .. ": " .. " Got " .. item .. " from opening a crate.")

end

--[[-------------------------------------------------------------------------
Gives the Items
            Meta Table
               • Player

            Arguments
               • number crateType
---------------------------------------------------------------------------]]
function pmeta:GiveItems( crateType )
   local CardsNumber = 0
   local Rares = 0
   local Epics = 0
   local legandaryPercent = 0
   local AddRareChance = 0
   local AddEpicChance = 0

   local GiveLengandyChance = 0

   -- I know I should've done this better but I don't want to change Item system to do so.
   -- Also I was teaching my friend glua and didn't want to complicated him to much.
   -- Also I made the config file before this and didn't want to change it.
   -- So deal with it. Don't look at me like that. I've done nothing to you.
   if crateType == GarrBearsCrates.Crates.SmallCrate then
      CardsNumber = GarrBearsCrates.Crates.Drops.SmallCrate["NumberOfItems"]
      Rares = GarrBearsCrates.Crates.Drops.SmallCrate["NumberOfForcedRares"]
      Epics = GarrBearsCrates.Crates.Drops.SmallCrate["NumberOfForcedEpics"]
      legandaryPercent = GarrBearsCrates.Crates.Drops.SmallCrate["LengendaryChance"]
   elseif crateType == GarrBearsCrates.Crates.NormalCrate then
      CardsNumber = GarrBearsCrates.Crates.Drops.NormalCrate["NumberOfItems"]
      Rares = GarrBearsCrates.Crates.Drops.NormalCrate["NumberOfForcedRares"]
      Epics = GarrBearsCrates.Crates.Drops.NormalCrate["NumberOfForcedEpics"]
      legandaryPercent = GarrBearsCrates.Crates.Drops.NormalCrate["LengendaryChance"]
   elseif crateType == GarrBearsCrates.Crates.BigCrate then
      CardsNumber = GarrBearsCrates.Crates.Drops.BigCrates["NumberOfItems"]
      Rares = GarrBearsCrates.Crates.Drops.BigCrates["NumberOfForcedRares"]
      Epics = GarrBearsCrates.Crates.Drops.BigCrates["NumberOfForcedEpics"]
      legandaryPercent = GarrBearsCrates.Crates.Drops.BigCrates["LengendaryChance"]
   elseif crateType == GarrBearsCrates.Crates.SuperCrate then
      CardsNumber = GarrBearsCrates.Crates.Drops.SuperCrate["NumberOfItems"]
      Rares = GarrBearsCrates.Crates.Drops.SuperCrate["NumberOfForcedRares"]
      Epics = GarrBearsCrates.Crates.Drops.SuperCrate["NumberOfForcedEpics"]
      legandaryPercent = GarrBearsCrates.Crates.Drops.SuperCrate["LengendaryChance"]
   elseif crateType == GarrBearsCrates.Crates.SpecialCrate then
      CardsNumber = GarrBearsCrates.Crates.Drops.SuperCrate["NumberOfItems"]
      Rares = GarrBearsCrates.Crates.Drops.SuperCrate["NumberOfForcedRares"]
      Epics = GarrBearsCrates.Crates.Drops.SuperCrate["NumberOfForcedEpics"]
      legandaryPercent = GarrBearsCrates.Crates.Drops.SuperCrate["LengendaryChance"]
   end


   AddRareChance = math_Rand(1, 100)
   AddEpicChance = math_Rand(1, 100)
   
   -- So its really simple to change
   -- Might make this in the settings in the future. idk... 
   -- I would but I feel like people would change it then
   -- Break it then say that it does't work...
   -- Otherwise I totaly would... But that one guy.. or girl...
   -- Or transgender... or... what else is there... idk its 
   -- to completcated... I'll stop now... But if you want to 
   -- change this, be my guest. But if it breaks don't come
   -- crying to me saying its not work. because it is.
   if AddRareChance < 31 then -- A 30% chance of adding a rare
      Rares = Rares + 1
   end

   if AddRareChance < 26 then -- A 25% chance of adding 2 rares
      Rares = Rares + 1
   end

   if AddRareChance < 21 then -- A 20% chance of adding 3 rares 
      Rares = Rares + 1
   end

   if AddRareChance < 16 then -- A 15% chance of adding 4 rares 
      Rares = Rares + 1
   end

   if AddRareChance < 11 then -- A 10% chance of adding 5 rares 
      Rares = Rares + 1
   end

   if AddRareChance < 6 then -- A 5% chance of adding 6 rares 
      Rares = Rares + 1
   end

   if AddRareChance == 1 then -- A 1% chance of adding 7 rares 
      Rares = Rares + 1

   if AddEpicChance < 16 then -- A 15% chance of adding a epic
      Epics = Epics + 1
   end

   if AddEpicChance < 11 then -- A 11% chance of adding 2 epics
      Epics = Epics + 1
   end

   if AddEpicChance < 6 then -- A 5% chance of adding 3 epic 
      Epics = Epics + 1
   end

   if AddEpicChance == 1 then -- A 1% chance of adding 4 epic extra epics
      Epics = Epics + 1
   end

   CardsNumber = ( ( CardsNumber - Rares ) - Epics )

   if GiveLengandyChance < legandaryPercent * 100 then 
      self:GiveLengandy()
      CardsNumber = CardsNumber - 1
   end
   
   self:GiveCommon( CardsNumber )
   self:GiveRare( Rares )
   self:GiveEpic( Epics )

   GiveLengandyChance = math_Rand(legandaryPercent * 100, 10000)


end -- IDK why but it wasn't working with out this.
end

--[[-------------------------------------------------------------------------
Called to open a crate
            Meta
               • Player

            Arguments
               • number crateType
---------------------------------------------------------------------------]]
function pmeta:OpenCrate( crateType )
   if ( crateType == GarrBearsCrates.Crates.SmallCrate ) and ( ply:GetPlayerItem(GarrBearsCrates.Keys.SmallKey) > 0 ) then
      LogData("[" .. self:SteamID() .. "]" .. self:Nick() .. ": Opened a small crate")
      
      ply:SubItem( GarrBearsCrates.Crates.SmallCrate )
      ply:SubItem( GarrBearsCrates.Keys.SmallKey )

      ply:GiveItems( crateType )
   elseif crateType == GarrBearsCrates.Crates.NormalCrate and ( ply:GetPlayerItem(GarrBearsCrates.Keys.SmallKey) > 0 ) then
      LogData("[" .. self:SteamID() .. "]" .. self:Nick() .. ": Opened a Normal crate")

      ply:SubItem( GarrBearsCrates.Crates.NormalCrate )
      ply:SubItem( GarrBearsCrates.Keys.NormalKey )

      ply:GiveItems( crateType )
   elseif crateType == GarrBearsCrates.Crates.BigCrate and ( ply:GetPlayerItem(GarrBearsCrates.Keys.SmallKey) > 0 ) then
      LogData("[" .. self:SteamID() .. "]" .. self:Nick() .. ": Opened a Big crate")

      ply:SubItem( GarrBearsCrates.Crates.BigCrate )
      ply:SubItem( GarrBearsCrates.Keys.BigKey )
      
      ply:GiveItems( crateType )
   elseif crateType == GarrBearsCrates.Crates.SuperCrate and ( ply:GetPlayerItem(GarrBearsCrates.Keys.SmallKey) > 0 ) then
      LogData("[" .. self:SteamID() .. "]" .. self:Nick() .. ": Opened a super crate")

      ply:SubItem( GarrBearsCrates.Crates.SuperCrate )
      ply:SubItem( GarrBearsCrates.Keys.SuperKey )

      ply:GiveItems( crateType )
   elseif crateType == GarrBearsCrates.Crates.SpecialCrate and ( ply:GetPlayerItem(GarrBearsCrates.Keys.SpecialKey) > 0 ) then
      LogData("[" .. self:SteamID() .. "]" .. self:Nick() .. ": Opened a special crate")
      
      ply:SubItem( GarrBearsCrates.Crates.SuperCrate )
      ply:SubItem( GarrBearsCrates.Keys.SuperKey )

      ply:GiveItems( crateType )
   end
end

-- Will open the crate and give items if valid
net.Receive("OpeningCrates", function ( len, ply )
	local crateType = net.ReadInt(32)

	if ply:CanOpenCrate( crateType ) then
		ply:OpenCrate( crateType )
	else
		net.Start( "FailedOpeningCrate" )
		net.Send( ply )
	end
end )