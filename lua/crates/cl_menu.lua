local last_page = 1 -- The Last Page they had open.
local PlayerIsAdmin = LocalPlayer():IsAdmin()
local PlayerIsSuperAdmin = LocalPlayer():IsSuperAdmin()

function UpDateItem()
   StartGettingLoadOutItems()
   UpDateMoney()
   UpDateShop()
end

function OpenCrateMenu()
   UpDateItems() -- Im going to call this a lot
   if PlayerIsSuperAdmin then
      if last_page == 1 then -- Inventory

      elseif last_page == 2 then -- Crafting

      elseif last_page == 3 then -- Loadout

      elseif last_page == 4 then -- Shop

      elseif last_page == 5 then -- SueprAdmin Page

      end

      -- Might add a settings page
   elseif PlayerIsAdmin then
      if last_page == 1 then -- Inventory

      elseif last_page == 2 then -- Crafting

      elseif last_page == 3 then -- Loadout

      elseif last_page == 4 then -- Shop

      elseif last_page == 5 then -- Admin Page

      end

      -- Might add a settings page
   else 
      if last_page == 1 then -- Inventory

      elseif last_page == 2 then -- Crafting

      elseif last_page == 3 then -- Loadout

      elseif last_page == 4 then -- Shop

      end

      -- Might add a settings page
   end
end

net.Receive( "CrateMenuOpen", function( len )
   UpDateItems
   
   OpenCrateMenu()
end ) 