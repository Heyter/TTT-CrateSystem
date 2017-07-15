--[[-------------------------------------------------------------------------
Shop
---------------------------------------------------------------------------]]
local Money = 0
local ShopItems = {}

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
   Money = net.ReadInt()
end )

net.Receive("SendShopItems", function( len )
   ShopItems = net.ReadTable()
end )