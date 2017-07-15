--[[-------------------------------------------------------------------------
I think this is all for this file
---------------------------------------------------------------------------]]

--[[-------------------------------------------------------------------------
Gets the objects material
            Arguments:
               • string object
               • string fileExtention

            Returns:
               • Material the objects material
---------------------------------------------------------------------------]]
function GetItemMaterial( object, ext )
   local materialReturn = nil
   local isWeapon = false

   if IsCrateWeapon( object ) and not ext then
      materialReturn = Material( "materials/crates/weapon/crate_weapon_" .. object .. ".png")
      isWeapon = true
   else
      materialReturn = Material( "materials/crates/weapon/crate_weapon_" .. object .. "." .. ext )
      isWeapon = true
   end

   if not ext and not isWeapon then
      materialReturn = Material( "materials/crates/crate_material_object_" .. object .. ".png" )
   elseif not isWeapon then
      materialReturn = Material( "materials/crates/crate_material_object_" .. object .. "." .. ext )
   end

   if not materialReturn then
      return Material( "materials/crates/CRATE_NO_MATERIAL.png" )
   else
      return materialReturn
   end

end

