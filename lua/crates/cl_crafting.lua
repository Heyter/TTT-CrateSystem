--[[-------------------------------------------------------------------------
Words so gmod thinks this is a not a blank file
---------------------------------------------------------------------------]]

function StartCrafting( Item_One, Item_TWo )
   net.Start( "RequestCrafting" )
      net.WriteInt( Item_One )
      net.WriteInt( Item_Two )
   net.SendToServer()
end


net.Receive( "CraftingError", function( len )
   local CraftingError = net.ReadString() -- Currently Nothing but might do something later with it.
end )
