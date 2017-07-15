local loadOutItems = {}

net.Receive( "SendLoadOutItems", function( len )
   loadOutItems = net.ReadTable()
end )

--[[-------------------------------------------------------------------------
Gets the load out items for the player.
---------------------------------------------------------------------------]]
function StartGettingLoadOutItems()
   net.Start("GetLoadOutItems")
   net.SendToServer()
end

--[[-------------------------------------------------------------------------
Gets the load out item
---------------------------------------------------------------------------]] 
function GetLoadOutItems()
   return loadOutItems
end

--[[-------------------------------------------------------------------------
Sets a new load out for the player
            Arguments:
               • string weapon
               • string weaponType
---------------------------------------------------------------------------]]
function SetLoadOutItems( weapon, weaponType )
   net.Start("SetNewLoadOut")
      net.WriteString( weapon )
      net.WriteString( weaponType )
   net.SendToServer()

   StartGettingLoadOutItems()
end

--[[-------------------------------------------------------------------------
Sets a new material for the weapon
            Arguments:
               • string material
               • string weaponType
---------------------------------------------------------------------------]] 
function SetNewMaterial( material, weaponType )
   net.Start("SetNewMaterial")
      net.WriteString( material )
      net.WriteString( weaponType )
   net.SendToServer()
end 