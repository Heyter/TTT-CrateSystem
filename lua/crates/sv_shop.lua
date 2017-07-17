--[[-------------------------------------------------------------------------
I don't know how I want to do this.
---------------------------------------------------------------------------]]
local pmeta = FindMetaTable("Player")

function pmeta:SellItemToShop( item, price )
   if self:HasItem( item ) then
      self:SoldItem( item, price )
   end
end

function pmeta:BuyItemFromShop( shopID )
   if self:HasMoney( ViewShopItem(shopID)[4] ) then  -- ViewShopItem returns a table
      self:BoughtItem( shopID )
   end
end 

net.Receive("GetMoney", function( len, ply )
   local money = ply:GetMoney() or 0

   net.Start("SendMoney")
      net.WriteInt( money, 32 )
   net.Send( ply )
end )

net.Receive("GetShopItems", function( len, ply )
   net.Start("SendShopItems")
      net.WriteTable( GetShopItemsForCleint() )
   net.Send( ply )
end )

