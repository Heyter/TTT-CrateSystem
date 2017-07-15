local pmeta = FindMetaTable("Player")


function pmeta:GetPrimMaterial( weapon )
   if file.Exists( "crates/PLAYER_" .. self:SteamID64() .. "/MaterialSetter/prim.txt", "DATA" ) then
      if file.Read( "crates/PLAYER_" .. self:SteamID64() .. "/MaterialSetter/prim.txt", "DATA" ) then
         return file.Read( "crates/PLAYER_" .. self:SteamID64() .. "/MaterialSetter/prim.txt", "DATA" )
      else
         return false
      end
   end
end

function pmeta:GetSecoundMaterial( weapon )
   if file.Exists( "crates/PLAYER_" .. self:SteamID64() .. "/MaterialSetter/secound.txt", "DATA" ) then
      if file.Read( "crates/PLAYER_" .. self:SteamID64() .. "/MaterialSetter/secound.txt", "DATA" ) then
         return file.Read( "crates/PLAYER_" .. self:SteamID64() .. "/MaterialSetter/secound.txt", "DATA" )
      else
         return false
      end
   end
end

function pmeta:GetMeleeMaterial( weapon )
   if file.Exists( "crates/PLAYER_" .. self:SteamID64() .. "/MaterialSetter/melee.txt", "DATA" ) then
      if file.Read( "crates/PLAYER_" .. self:SteamID64() .. "/MaterialSetter/melee.txt", "DATA" ) then
         return file.Read( "crates/PLAYER_" .. self:SteamID64() .. "/MaterialSetter/melee.txt", "DATA" )
      else
         return false
      end
   end
end

function pmeta:GetSpecialMaterial( weapon )
   if file.Exists( "crates/PLAYER_" .. self:SteamID64() .. "/MaterialSetter/special.txt", "DATA" ) then
      if file.Read( "crates/PLAYER_" .. self:SteamID64() .. "/MaterialSetter/special.txt", "DATA" ) then
         return file.Read( "crates/PLAYER_" .. self:SteamID64() .. "/MaterialSetter/special.txt", "DATA" )
      else
         return false
      end
   end
end

hook.Add( "PlayerSwitchWeapon", "SetWeaponMaterialForPlayers", function( ply, old, new )
      local materialStr = ""
      if IsPrimaryWeapon( new ) then 
         materialStr = ply:GetPrimMaterial( new )
      elseif IsSecondaryWeapon( new ) then
         materialStr = ply:GetSecoundMaterial( new )
      elseif IsMeleeWeapon( new ) then
         materialStr = ply:GetMeleeMaterial( new )
      elseif IsSpecialWeapon( new ) then
         materialStr = ply:GetSpeicalMaterial( new )
      else
         materialStr = false
      end

      if materialStr then
         CrateWeaponMaterial( new, materialStr )
      end
end )