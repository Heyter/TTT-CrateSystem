include("sv_crateRecipies.lua")

local pmeta = FindMetaTable( "Player" )


--[[-------------------------------------------------------------------------
Weather or not the item can be crafted
            Arguments:
               • number Item_One
               • number Item_Two
                  
            Returns:
               • boolean Can the item be crafted
---------------------------------------------------------------------------]]
function CanCraft( Item_One, Item_Two )
   local returnType = 0

   for k,v in pairs( GarrBearCrates.CraftingTable ) do
      if table.HasValue( v, Item_One) and table.HasValue(v, Item_Two) then
         returnType = v[3][1]
         return true, returnType
      else
         return false, nil
      end
   end
end

--[[-------------------------------------------------------------------------
Will send a message to a player saying the crafting recipe they used 
is wronge, or they don't have the items to craft the time
            Meta Table:
               • Player

            Arguments:
               • number errorMsg
                        - 0 for recipe error
                        - 1 for item errora
---------------------------------------------------------------------------]]
function pmeta:CraftingError( errorMsg )
   net.Start("CraftingError")
      net.WriteString( errorMsg )
   net.Send( self )
end

--[[-------------------------------------------------------------------------
Called when a player tries to craft an item
            Meta Table:
               • Player Varible
            Arguments:
               • number Item_one
               • number Item_Two

            Returns:
               • boolean weather the item was crafted
---------------------------------------------------------------------------]]
function pmeta:StartCraft( item_one, item_two )
   local CanCraft, item = CanCraft( item_one, item_two )


   if self:GetPlayerItems( item_one ) == 0 and self:GetPlayerItems( item_two ) == 0 then
      self:CraftingError("You don't have the items")

      return false
   end

   if !CanCraft then -- If false then return false
      self:CraftingError("Not a crafting recipe.")

      return CanCraft
   end
   
   self:SubItem( item_one, 1 )
   self:SubItem( item_two, 1 )

   self:AddItem(item, 1) -- AddItem is a client function and this is a server one

   return CanCraft
end

net.Receive("RequestCrafting", function( len, ply )
   local Item_One = net.ReadInt()
   local Item_Two = net.ReadInt()

   ply:StartCraft( Item_One, Item_Two )
end )

 
