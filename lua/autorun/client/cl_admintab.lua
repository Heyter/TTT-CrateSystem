local net, LocalPlayer, type = net, LocalPlayer, type
--[[-------------------------------------------------------------------------
Adds an item to a player...
---------------------------------------------------------------------------]]
function AddItemsToPlayerCommmand( ply, item, amount )
   net.Start("AddItemCommand")
      net.WriteString( type(item) )

      net.WriteEntity( ply )
      if type(item) == "string" then
         net.WriteString( item )
      else
         net.WriteInt( item, 32 )
      end
      net.WriteInt( amount, 32 )
   net.SendToServer()
end 

--[[-------------------------------------------------------------------------
... Ctrl+C, Ctrl+V
---------------------------------------------------------------------------]]
function SubItemFromPlayerCommand( ply, item, amount )
   net.Start("TakeItemCommand")
      net.WriteString( type(item) )

      net.WriteEntity( ply )
      if type(item) == "string" then
         net.WriteString( item )
      else
         net.WriteInt( item, 32 )
      end
      net.WriteInt( amount, 32 )
   net.SendToServer()
end

--[[-------------------------------------------------------------------------
Gives money to the player
---------------------------------------------------------------------------]]
function GiveMoneyToPlayerCommand( ply, amount )
   net.Start("GiveMoneyCommand")
      net.WriteEntity( ply )
      net.WriteInt( amount, 32 )
   net.SendToServer()
end

--[[-------------------------------------------------------------------------
Takes Money from the player
---------------------------------------------------------------------------]]
function TakeMoneyToPlayerCommand( ply, amount )
   net.Start("TakeMoneyCommand")
      net.WriteEntity( ply )
      net.WriteInt( amount, 32 )
   net.SendToServer()
end

--[[-------------------------------------------------------------------------
Eraes the Players Data --- MUST BE SUPERADMIN
---------------------------------------------------------------------------]]
function ErasePlayerDataCommand( ply )
   if LocalPlayer():IsSuperAdmin() then
      net.Start("ErasePlayerCommand")
         net.WriteEntity( ply )
      net.SendToServer()
   end
end 
