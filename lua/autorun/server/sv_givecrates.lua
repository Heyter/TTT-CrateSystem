local player = player
local math_random, player_GetAll, table_Random, math_ceil, timer_Create, CurTime = math.random, player.GetAll, table.Random, math.ceil, timer.Create, CurTime
--[[-------------------------------------------------------------------------
Gets the crate type...

P.S. I hate how this function looks to. 
---------------------------------------------------------------------------]]
function GetCrateType()
   local CrateChance = math_random(1, 100)
   if GarrBearsCrates.Settings.SpecialCrate then
      local SpecialCrateChance = math_random( 1, GarrBearsCrates.Settings.SpecialCrateChance ) 
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
local function GiveCrate() 
	if player.GetCount() < 3 then 
		LogData("Would have given a crate but there is not enough players")
		return false
	end

	local playerThatGetsCrate = table_Random( player_GetAll() )
	playerThatGetsCrate:GiveItemToPlayer(GetCrateType(), 1)
	LogData("The server gave " .. playerThatGetsCrate:Nick() .. " a crate.")
end

--[[-------------------------------------------------------------------------
Tells the server to drop a crate
---------------------------------------------------------------------------]]
local GiveCrateToPlayer = true
timer_Create("CrateDropTimer", 1, 0, function()
	if (math_ceil(CurTime()) % (120 - (player.GetCount() * 2)) == 1) then
		if GiveCrateToPlayer then
			GiveCrateToPlayer = false -- So it doesn't give crates inbettween all the ticks of that secound... if that makes scenese
			GiveCrate()
		end
	else
		GiveCrateToPlayer = true
	end
end