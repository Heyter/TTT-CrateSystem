local net, draw_RoundedBox, vgui_Create = net, draw.RoundedBox, vgui.Create
--[[-------------------------------------------------------------------------
Called on a request to open a crate
               Arguments:
                  • crate
---------------------------------------------------------------------------]]
function RequestOpen( crate )
   net.Start( "OpeningCrates" )
      net.WriteInt( crate, 32 )
   net.SendToServer()
end

-- If the crate couldn't be opened
net.Receive( "FailedOpeningCrate", function( len ) 
   local FailedToOpen = vgui_Create( "DFrame", GetPartent() )
   FailedToOpen:SetSize( 300, 300 )
   FailedToOpen:Center()
   FailedToOpen:MakePopup()
   FailedToOpen:SetVisible( true )
   FailedToOpen:ShowCloseButton( false )
   FailedToOpen:SetDraggable( false )
   FailedToOpen:SetBackgroundBlur( true )
   FailedToOpen:SetTitle( "" )
   FailedToOpen.Paint = function( s, w, h )
      draw_RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 0) )
   end

   local FailedToOpenBackGround = vgui_Create( "DImage", FailedToOpen )
   FailedToOpenBackGround:SetSize( 300, 300 )
   FailedToOpenBackGround:SetPos( 0, 0 )
   FailedToOpenBackGround:SetImage("materials/crates/Crate_Open_Failed.png")

   local CloseButton = vgui_Create("DButton", FailedToOpen)
   CloseButton:SetSize( 35, 35 )
   CloseButton:SetPos( 265, 0 )
   CloseButton:SetText( "" ) 
   CloseButton:SetImage("materials/crates/Red_X.png")
   CloseButton.Paint = function ( s, w, h )
      -- Calling this fixes a glitch         
   end
   CloseButton.DoClick = function()
      FailedToOpen:Close()
   end
end )