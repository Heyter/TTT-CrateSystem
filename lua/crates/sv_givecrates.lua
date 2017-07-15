local pmeta = FindMetaTable("Player")

function pmeta:GiveItemToPlayer( itemID, amount )
   local path = "crates/PLAYER_"..self:SteamID64().."/ITEM_"..itemID..".txt"

   if amount == nil then 
      amount = 1
   end

   if file.Exists( path, "DATA" ) then
      local Data = file.Read( path, "DATA" )
      
      if Data == nil then 
         file.Write( path, amount )
      else
         file.Write( path, (tonumber(data) + amount) )
      end
   end
end

--[[-------------------------------------------------------------------------
Gets the crate type...

P.S. I hate how this function looks to. 
---------------------------------------------------------------------------]]
function GetCrateType()
   local CrateChance = math.random(1, 100)
   if GarrBearsCrates.Settings.SpecialCrate then
      local SpecialCrateChance = math.random( 1, GarrBearsCrates.Settings.SpecialCrateChance ) 
   else
      local SpecialCrateChance = 1
   end

   if SpecialCrateChance == 500 then -- Hint: It will never equal 500 if it's disabled in settings/shared.lua
      return GarrBearsCrates.Crates.SpecialCrate
   else
      if (CrateChance >= 1) && (CrateChance <= GarrBearsCrates.Settings.SmallCrateChance) then
         return GarrBearsCrates.Crates.SmallCrate
      elseif (CrateChance > GarrBearsCrates.Settings.SmallCrateChance ) && (CrateChance <= (GarrBearsCrates.Settings.SmallCrateChance + GarrBearsCrates.Settings.NormalCrateChance)) then
         return GarrBearsCrates.Crates.NormalCrate
      elseif (CrateChance > (GarrBearsCrates.Settings.SmallCrateChance + GarrBearsCrates.Settings.NormalCrateChance) ) && (CrateChance <= (GarrBearsCrates.Settings.SmallCrateChance + GarrBearsCrates.Settings.NormalCrateChance) + GarrBearsCrates.Settings.BigCrateChance) then
         return GarrBearsCrates.Crates.BigCrate
      elseif (CrateChance > ( 100 - GarrBearsCrates.Settings.SuperCrateChance )) then
         return GarrBearsCrates.Crates.SuperCrate
      end
   end
end

--[[-------------------------------------------------------------------------
Gives the crate to the player
---------------------------------------------------------------------------]]
function GiveCrate() 
   if player.GetCount() == 0 then 
      return false                
   end                            

   local PlayerThatGetsCrate = math.random(player.GetCount())

   ---------------------- It ↓↓ looks like a sad face ):
   Player(PlayerThatGetsCrate):GiveItemToPlayer(GetCrateType(), 1)
end

--[[-------------------------------------------------------------------------
Tells the server to drop a crate
---------------------------------------------------------------------------]]
local GiveCrateToPlayer = true
hook.Add( "Think", "CrateDrop", function()
   if ( math.ceil( CurTime()) % ( 120 - ( player.GetCount() * 2 ) ) == 1 ) then
      GiveCrateToPlayer = true -- So it doesn't give crates inbettween all the ticks of that secound... if that makes scenese
      if GiveCrateToPlayer then
         GiveCrate()
      end
   else
      GiveCrateToPlayer = false
   end
end )
