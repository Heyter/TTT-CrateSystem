
--[[-------------------------------------------------------------------------
Gets the crate type...
A random number between
1 - 60: Small crate or 60% chance
61 - 80: Normal crate or 20% chance
81 - 95: Big Crate or 15% chance
95 - 100: Super Crate or 5% chance


P.S. I hate how this function looks to. 
---------------------------------------------------------------------------]]
function GetCrateType()
   local CrateChance = math.Rand(1, 100)
   if GarrBearsCrates.Settings.SpecialCrate then
      local SpecialCrateChance = math.Rand( 1, GarrBearsCrates.Settings.SpecialCrateChance ) -- A 1 in 10000 Chance of getting a create
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
   if player.GetCount() == 0 then -- So someone might find this funny but when I was checking over this I checked this twise
      return false                -- I put two if statements. not copy and pase because one was 0 == player.GetCount() and one
   end                            -- how you see now. I think im going insane... I was going to leave it but then said nahhh with 3 h's

   local PlayerThatGetsCrate = math.Rand(1, player.GetCount())

   ---------------------- It ↓↓ lookes like a sad face ):
   Player(PlayerThatGetsCrate):AddItem(GetCrateType(), 1)
end

--[[-------------------------------------------------------------------------
Tells the server to drop a crate

It is also takes the number of players into the equation.
---------------------------------------------------------------------------]]
--[[
hook.Add( "Think", "CrateDrop", function()
   if ( math.ceil( CurTime()) % ( 120 - ( player.GetCount() * 2 ) ) == 12 ) then
      GiveCrate()
   end
end )
]]
