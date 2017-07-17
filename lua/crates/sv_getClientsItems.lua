--[[-------------------------------------------------------------------------
Gets the players Items
---------------------------------------------------------------------------]]
local ThePlayersItemsToBeSent = {}

function GetPlayersItems( ply )
   ThePlayersItemsToBeSent = {} -- Empty the table 

   local files, dir = file.Find("crates/PLAYER_"..ply:SteamID64().."/*.txt", "DATA")
   local ItemID = 0
   local NumberOfItems = 0

   for k,v in pairs( files ) do 
      if string.Left( v, 5 ) == "ITEM_" then
         NumberOfItems = file.Read("crates/PLAYER_"..ply:SteamID64().."/" .. v, "DATA")
         ItemID = tonumber( string.Left( string.TrimLeft( v, "ITEM_"), 1 ) )

         table.insert( ThePlayersItemsToBeSent, { ItemID, tonumber(NumberOfItems) } )
      end
   end
end

-- Gets the request to get the items
net.Receive( "RequestItems", function( len, ply )
   GetPlayersItems( ply )

   net.Start( "TellPlayerTheirItems")
      net.WriteTable( ThePlayersItemsToBeSent )
   net.Send( ply )
end )