local PlayersItems = {}

--[[-------------------------------------------------------------------------
Gets the players Items
---------------------------------------------------------------------------]]
function GetPlayersItems()
   net.Start( "RequestItems" )
   net.SendToServer()

   return PlayersItems
end

function IsSmallKey( item )
   if item == 1 then
      return true
   else
      return false
   end
end

function IsNormalKey( item ) 
   if item == 2 then
      return true
   else
      return false
   end
end

function IsBigKey( item )
   if item == 3 then
      return true
   else
      return false
   end
end

function IsSuperKey( item )
   if item == 4 then
      return true
   else
      return false
   end
end

net.Receive( "TellPlayerTheirItems", function( len )
   PlayersItems = net.ReadTable()
end )