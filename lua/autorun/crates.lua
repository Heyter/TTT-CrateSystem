--[[-------------------------------------------------------------------------
File header stuffy... I just wanted to type... don't judge me
---------------------------------------------------------------------------]]

--[[-------------------------------------------------------------------------
Adds the resources
---------------------------------------------------------------------------]]
if (SERVER) then -- I want this up here by its self... Don't judge me.
   function AddResources()
      resource.AddFile("materials/crates/CRATE_NO_MATERIAL.png")
      resource.AddFile("materials/crates/crate_material_object_1.png")
      resource.AddFile("materials/crates/crate_material_object_2.png")
      resource.AddFile("materials/crates/crate_material_object_3.png")
      resource.AddFile("materials/crates/crate_material_object_4.png")
      resource.AddFile("materials/crates/crate_material_object_5.png")
      resource.AddFile("materials/crates/crate_material_object_6.png")
      resource.AddFile("materials/crates/crate_material_object_7.png")
      resource.AddFile("materials/crates/crate_material_object_8.png")
      resource.AddFile("materials/crates/NoBackGround.png")
      resource.AddFile("materials/crates/Crate_Open_Failed.png")
      resource.AddFile("materials/crates/Garr_Bear_Crates_Admin_Button.png")
      resource.AddFile("materials/crates/Garr_Bear_Crates_Crafting_Button.png")
      resource.AddFile("materials/crates/Garr_Bear_Crates_Inventory_Button.png")
      resource.AddFile("materials/crates/Garr_Bear_Crates_Loadout_Button.png")
      resource.AddFile("materials/crates/Garr_Bear_Crates_Shop_Button.png")
      resource.AddFile("materials/crates/Garr_Bear_Crates_SuperAdmin_Button.png")
      resource.AddFile("materials/crates/Red_X.png")
      resource.AddFile("materials/crates/Inventory_Back_Ground.png")
      resource.AddFile("materials/crates/Crate_Background.png")
      resource.AddFile("materials/crates/Tab.png")
   end
end

-- I said don't judge me
if (SERVER) then
   AddResources()

   include("crates/init.lua")
end

-- Now you can't judge me
if (CLIENT) then
   include("crates/cl_init.lua")
end

-- If you didn't get the don't judge me then you need learn more glua... Nerd.