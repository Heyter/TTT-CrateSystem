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
   local materialReturn = false
   local isWeapon = false

   if not ext then
      ext = ".png"
   end

   if IsCrateWeapon( object ) then
      materialReturn = "materials/crates/weapon/crate_weapon_object_" .. object .. ext
   else
      materialReturn = "materials/crates/crate_material_object_" .. object .. ext
   end

   if not materialReturn then
      return "materials/crates/CRATE_NO_MATERIAL.png" 
   else
      return materialReturn
   end

end

