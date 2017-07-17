--[[-------------------------------------------------------------------------
Shop
---------------------------------------------------------------------------]]
local Money = 0
local ShopItems = {}

function ShopMenuBox( item )

   local ShopMenuDerma = vgui.Create( "DFrame", GetPartent() )
   ShopMenuDerma:SetSize( 300, 300 )
   ShopMenuDerma:Center()
   ShopMenuDerma:MakePopup()
   ShopMenuDerma:SetVisible( true )
   ShopMenuDerma:ShowCloseButton( false )
   ShopMenuDerma:SetDraggable( false )
   ShopMenuDerma:SetBackgroundBlur( true )
   ShopMenuDerma:SetTitle( "" )
   ShopMenuDerma.Paint = function( s, w, h )
      draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 255) )
   end

   local SellingBackGround = vgui.Create( "DImage", ShopMenuDerma )
   SellingBackGround:SetSize( 300, 300 )
   SellingBackGround:SetPos( 0, 0 )
   SellingBackGround:SetImage( "materials/crates/Crate_Open_Failed.png" )

   local CancelButton = vgui.Create( "DButton", ShopMenuDerma )
   CancelButton:SetSize( 50, 20 )

   local CloseButton = vgui.Create( "DButton", ShopMenuDerma )
   CloseButton:SetSize( 35, 35 )
   CloseButton:SetPos( 265, 0 )
   CloseButton:SetText( "" ) 
   CloseButton:SetImage("materials/crates/Red_X.png")
   CloseButton.Paint = function ( s, w, h )
      -- Calling this fixes a glitch         
   end
   CloseButton.DoClick = function()
      ShopMenuDerma:Close()
   end

end

function UpDateMoney()
   net.Start("GetMoney")
   net.SendToServer()
end

function UpDateShop()
   net.Start("GetShopItems")
   net.SendToServer()
end

function GetMoney()
   UpDateMoney()
   return Money
end

function GetShopItems()
   UpDateShop()
   return ShopItems
end

function SellItem( item, price )
   net.Start("SellItem")

   net.SendToServer()
end

function BuyItem( id )
   net.Start("BuyItem")

   net.SendToServer()
end

net.Receive("SendMoney", function( len )
   Money = net.ReadInt(32)
end )

net.Receive("SendShopItems", function( len )
   ShopItems = net.ReadTable()
end )