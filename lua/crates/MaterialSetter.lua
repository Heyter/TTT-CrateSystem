--[[-------------------------------------------------------------------------
This just needed to be shared and I didn't want to put it in shared.lua
---------------------------------------------------------------------------]]

-- Noice and simple :)... It sets the entitys material if needed.
function CrateWeaponMaterial( ent, MaterialStr )
   ent:SetMaterial( MaterialStr, true )
end 