--[[-------------------------------------------------------------------------
Gets the players Items
---------------------------------------------------------------------------]]
local ThePlayersItemsToBeSent = {}

function GetPlayersItems( ply )
   local files, dir = file.Find("crates/PLAYER_"..self:SteamID64().."/*.txt", "DATA")
   local PlayersItems = {}
   local ItemID = 0
   local NumberOfItems = 0

   for k,v in pairs( files ) do 
      NumberOfItems = file.Read("crates/PLAYER_"..self:SteamID64().."/" .. v, "DATA")
      ItemID = string.Trim( v, "ITEM_")

      table.insert( { ItemID, NumberOfItems } )
   end
end

-- Gets the request to get the items
net.Receive( "RequestItems", function( len, ply )
   GetPlayersItems()

   net.Start( "TellPlayerTheirItems")
      net.WriteTable( ThePlayersItemsToBeSent )
   net.Send( ply )
end )