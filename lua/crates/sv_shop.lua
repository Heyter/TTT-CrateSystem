--[[-------------------------------------------------------------------------
I don't know how I want to do this.
---------------------------------------------------------------------------]]
local pmeta = FindMetaTable("Player")

function pmeta:SendMoeny()
   net.Start("SendMoney")
      net.WriteInt( self:GetMoney() )
   net.Send( self )
end

function pmeta:SendShopItems()
   net.Start("SendShopItems")
      net.WriteTable( GetShopItemsForCleint )
   net.Send( self )
end

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
   ply:SendMoney()
end )

net.Receive("GetShopItems", function( len, ply )
   ply:SendShopItems()
end )

