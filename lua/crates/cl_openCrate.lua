
--[[-------------------------------------------------------------------------
Called on a request to open a crate
               Arguments:
                  • crate
---------------------------------------------------------------------------]]
function RequestOpen( crate )
   net.Start( "OpeningCrates" )
      net.WriteInt( crate )
   net.SendToServer()
end

-- If the crate couldn't be opened
net.Receive( "FailedOpeningCrate", function( len ) 
   -- ERROR MESSAGE
end )