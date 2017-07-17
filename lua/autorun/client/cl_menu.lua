local vgui, pairs, Material, surface, net, LocalPlayer, draw.RoundedBox = vgui, pairs, Material, surface, net, LocalPlayer, draw.RoundedBox

local last_page = 1 -- The Last Page they had open.
local is_Open = false
local MasterParent = nil

function GetPartent() -- Its like this becauase there already is a GetParent Function
   return MasterParent
end

local function UpDateItem()
   StartGettingLoadOutItems()
   UpDateMoney()
   UpDateShop()
   GetPlayersItems()
end

local function Tab_Shower( pos, parent )
   local TabSelected = vgui.Create( "DImage", parent )
   TabSelected:SetSize( 20, 75 )
   TabSelected:SetPos( 128, pos )
   TabSelected:SetImage("materials/crates/Tab.png")
end

local function InventoryBackGround( parent )
   local BackGroundInvImage = vgui.Create( "DImage", parent )
   BackGroundInvImage:SetSize( 655, 400 )
   BackGroundInvImage:SetPos( 200, 5 )
   BackGroundInvImage:SetImage("materials/crates/Inventory_Back_Ground.png")
end

local function CrateInventory( parent )
   local ItemAmount = 0
   local Items = GetPlayersItems()

   InventoryBackGround( parent )
   
   local Scroll = vgui.Create( "DScrollPanel", parent ) //Create the Scroll panel
   Scroll:SetSize( 655, 400 )
   Scroll:SetPos( 200, 5 )

   local List  = vgui.Create( "DIconLayout", Scroll )
   List:SetSize( 655, 400 )
   List:SetPos( 0, 0 )
   List:SetSpaceY( 5 ) 
   List:SetSpaceX( 5 )

   for k,v in pairs( Items ) do
      for i=1, v[2] do
         local ListItem = List:Add( "DComboBox" ) 
         ListItem:SetSize( 120, 120 )
         ListItem:AddChoice( "Sell" )
         ListItem:AddChoice( "Craft" )
 
         if IsCrate( v[1] ) then
            ListItem:AddChoice( "Open" )
         elseif IsCrateWeapon( v[1] ) then
            ListItem:AddChoice( "Add To Loadout" ) 
         end

         ListItem:SetImage( GetItemMaterial( v[1] ) )
         ListItem.Paint = function ( s, w, h )
            -- Calling this fixes a glitch
         end 

         ListItem.OnSelect = function( panel, index, value )
            if value == "Open" then
               RequestOpen( v[1] )
            elseif value == "Sell" then
               ShopMenuBox( v[1] )
            elseif value == "Craft" then
               last_page = 2
               OpenCrateMenu()
               parent:Close()
               return false 
            end
         end
      end
   end

end

function OpenCrateMenu() -- I didn't want to make functions because I didn't know what to call all of them... Deal with it.
   UpDateItem() -- Im going to call this a lot
   is_Open = true
	
	local ply = LocalPlayer()
   if ply:IsSuperAdmin() then
      local MainMenu = vgui.Create( "DFrame" )
      local MasterParent = MainMenu
      MainMenu:SetSize( 900, 600 )
      MainMenu:Center()
      MainMenu:SetDraggable( false )
      MainMenu:MakePopup()
      MainMenu:SetDeleteOnClose( true )
      MainMenu:SetTitle( "" )
      MainMenu:ShowCloseButton( false )
      MainMenu.Paint = function( s, w, h )
         draw_RoundedBox( 5, 0, 0, w, h, Color( 100, 100, 100 ) )
      end

      local BackGround = vgui.Create( "DImage", MainMenu ) 
      BackGround:SetSize( 900, 600 )
      BackGround:SetPos( 0, 0 )
      BackGround:SetImage("materials/crates/Crate_Background.png")

      local CloseButton = vgui.Create( "DButton", MainMenu )
      CloseButton:SetSize( 35, 35 )
      CloseButton:SetPos( 860, 0 )
      CloseButton:SetText( "" )
      CloseButton:SetImage("materials/crates/Red_X.png")
      
      CloseButton.DoClick = function()
         is_Open = false
         MainMenu:Close()
      end

      local InventoryTab = vgui.Create( "DButton", MainMenu )
      InventoryTab:SetSize( 132, 75 )
      InventoryTab:SetPos(-5, 0)
      InventoryTab:SetText( "" )
      InventoryTab:SetImage("materials/crates/Garr_Bear_Crates_Inventory_Button.png")

      InventoryTab.Paint = function ( s, w, h )
         local mat = Material( "materials/crates/Garr_Bear_Crates_Inventory_Button.png" )
         surface.DrawTexturedRect( 0, 0, w, h)
         surface.SetMaterial( mat )
         
      end 

      InventoryTab.DoClick = function()
         last_page = 1
         OpenCrateMenu()
         MainMenu:Close()
         return false
      end 

      local CraftingTab = vgui.Create( "DButton", MainMenu )
      CraftingTab:SetSize( 132, 75 )
      CraftingTab:SetPos( -5, 76 )
      CraftingTab:SetText( "" )
      CraftingTab:SetImage("materials/crates/Garr_Bear_Crates_Crafting_Button.png")
      CraftingTab.DoClick = function()
         last_page = 2
         OpenCrateMenu()
         MainMenu:Close()
         return false
      end 

      local LoadoutTab = vgui.Create( "DButton", MainMenu )
      LoadoutTab:SetSize( 132, 75 )
      LoadoutTab:SetPos( -5, 152 )
      LoadoutTab:SetText( "" )
      LoadoutTab:SetImage("materials/crates/Garr_Bear_Crates_Loadout_Button.png")
      LoadoutTab.DoClick = function()
         last_page = 3
         OpenCrateMenu()
         MainMenu:Close()
         return false
      end 

      local ShopTab = vgui.Create( "DButton", MainMenu )
      ShopTab:SetSize( 132, 75 )
      ShopTab:SetPos( -5, 228 )
      ShopTab:SetText( "" )
      ShopTab:SetImage("materials/crates/Garr_Bear_Crates_Shop_Button.png")
      ShopTab.DoClick = function()
         last_page = 4
         OpenCrateMenu()
         MainMenu:Close()
         return false
      end 

      local SueprAdminTab = vgui.Create( "DButton", MainMenu )
      SueprAdminTab:SetSize( 132, 75 )
      SueprAdminTab:SetPos( -5, 304 )
      SueprAdminTab:SetText( "" )
      SueprAdminTab:SetImage("materials/crates/Garr_Bear_Crates_SuperAdmin_Button.png")
      SueprAdminTab.DoClick = function()
         last_page = 5
         OpenCrateMenu()
         MainMenu:Close()
         return false
      end 

      if last_page == 1 then -- Inventory
         Tab_Shower( 0, MainMenu )
         CrateInventory( MainMenu )

      elseif last_page == 2 then -- Crafting
         Tab_Shower( 76, MainMenu )
         
      elseif last_page == 3 then -- Loadout
         Tab_Shower( 152, MainMenu )
         
      elseif last_page == 4 then -- Shop
         Tab_Shower( 228, MainMenu )
         
      elseif last_page == 5 then -- SueprAdmin Page
         Tab_Shower( 304, MainMenu )
         
      end

      -- Might add a settings page
   elseif ply:IsAdmin() then


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
   UpDateItem()
   if !is_Open then
      OpenCrateMenu()
   end
end ) 
