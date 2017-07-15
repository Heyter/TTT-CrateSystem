--[[-------------------------------------------------------------------------
File header stuffy... I just wanted to type... don't judge me
---------------------------------------------------------------------------]]

--[[-------------------------------------------------------------------------
Adds the resources
---------------------------------------------------------------------------]]
if (SERVER) then -- I want this up here by its self... Don't judge me.
   function AddResources()
      resource.AddFile("materials/crates/CRATE_NO_MATERIAL.png") 
      -- Ill add this later
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
