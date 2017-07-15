local PlayersItems = {}

--[[-------------------------------------------------------------------------
Asks the server for the times
---------------------------------------------------------------------------]]
function GetPlayersItems()
   net.Start( "RequestItems" )
   net.SendToServer()
end

--[[-------------------------------------------------------------------------
Gets the players Items
---------------------------------------------------------------------------]]
function GetPlayersItems()
   GetPlayersItems()

   return PlayersItems
end

net.Receive( "TellPlayerTheirItems", function( len )
   PlayersItems = net.ReadTable()
end )