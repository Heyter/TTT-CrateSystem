local weaponTypes = { "prim", "secound", "melee", "special" }

--[[-------------------------------------------------------------------------
Sends the players loadout to the client (I hate network stuff BTW)
   
               Arguments:
                  • Player ply 
---------------------------------------------------------------------------]]
function CrateLoadOutItems( ply )
   local itemTable = {}
   for k,v in pairs( weaponTypes ) do 
      table.insert( itemTable, nil, file.Read( "crates/PLAYER_" .. ply:SteamID64() .. "weaponloadout/" .. v .. ".txt", "DATA" ) )
   end

   net.Start("SendLoadOutItems")
      net.WriteTable( itemTable )
   net.Send(ply)
end

-- Request the players loadout
net.Receive( "GetLoadOutItems", function( len, ply )
   CrateLoadOutItems( ply )
end ) 

-- Request the to set a new loadout
net.Receive( "SetNewLoadOut", function( len, ply )
   local weapon = net.ReadString()
   local weaponType = net.ReadString()

   ply:SetLoadOut( weapon, weaponType )
end )


-- Gives the players
hook.Add("Loadout", "PlayersLoadOut", function()
   for k,v in pairs( weaponTypes ) do
      if file.Exists( "crates/PLAYER_" .. self:SteamID64() .. "weaponloadout/" .. v .. ".txt", "DATA" ) then
         local weaponClass = file.Read( "crates/PLAYER_" .. self:SteamID64() .. "weaponloadout/" .. v .. ".txt", "DATA" )
         
         if v == "melee" and !(weaponClass == "nil") then

            self:StripWeapon( "weapon_zm_improvised" )
            self:Give( weaponClass )

         elseif !(weaponClass == "nil") then
            self:Give( weaponClass )
         end
      end
   end
end )


net.Receive("SetNewMaterial",function( len, ply) 
   local materialStr = net.ReadString()
   local weaponType = net.ReadString()

   if file.IsDir("crates/PLAYER_" .. ply:SteamID64() .. "/MaterialSetter/" , "DATA") then
      file.Write("crates/PLAYER_" .. ply:SteamID64() .. "/MaterialSetter/" .. weaponType .. ".txt", materialStr )
   else
      file.CreateDir( "crates/PLAYER_" .. ply:SteamID64() .. "/MaterialSetter/" )
      file.Write("crates/PLAYER_" .. ply:SteamID64() .. "/MaterialSetter/" .. weaponType .. ".txt", materialStr )
   end
end )