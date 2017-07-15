local pmeta = FindMetaTable("Player")

function pmeta:AddItemCommand( ply, item, amount )
   if self:IsAdmin() then
      ply:AddItem( item, amount )

      LogData( self:Nick() .. " [" .. self:SteamID() .. "] Gave " .. ply:Nick() .. " [" .. ply:SteamID() .. "] Amount:" .. amount .. " Item: " .. item )
   end
end

function pmeta:TakeItemCommand( ply, item, amount )
   if self:IsAdmin() then
      ply:SubItem( item, amount )

      LogData( self:Nick() .. " [" .. self:SteamID() .. "] took " .. ply:Nick() .. " [" .. ply:SteamID() .. "] Amount:" .. amount .. " Item: " .. item )
   end
end 

function pmeta:GiveMoneyCommand( ply, amount )
   if self:IsAdmin() then
      ply:AddMoeny( amount )

   end
end

function pmeta:TakeMoneyCommand( ply, amount )
   if self:IsAdmin() then
      ply:SubMoney( amount )

   end 
end


function pmeta:ErasePlayerCommand( ply )
   if self:IsSuperAdmin() then
      ply:ErasePlayer()
   end
end

net.Receive( "AddItemCommand", function( len, Calling )
   local typeOfItem = net.ReadString()
   local ply = net.ReadEntity
   local item = nil
   local amount = 0

   if typeOfItem == "string" then
      item = net.ReadString()
   else
      item = net.ReadInt()
   end

   amount = net.ReadInt()

   Calling:AddItemCommand( ply, item, amount )
end )

net.Receive( "TakeItemCommand", function( len, Calling )
   local typeOfItem = net.ReadString()
   local ply = net.ReadEntity
   local item = nil
   local amount = 0

   if typeOfItem == "string" then
      item = net.ReadString()
   else
      item = net.ReadInt()
   end

   amount = net.ReadInt()

   Calling:TakeItemCommand( ply, item, amount )
end )

net.Receive( "GiveMoneyCommand", function( len, Calling )   
   local ply = net.ReadEntity() 
   local amount = net.ReadInt()

   Calling:GiveMoneyCommand( ply, amount )
end )

net.Receive( "TakeMoneyCommand", function( len, Calling )
   local ply = net.ReadEntity() 
   local amount = net.ReadInt()

   Calling:TakeMoneyCommand( ply, amount )
end )

net.Receive( "ErasePlayerCommand", function( len, Calling )
   local ply = net.ReadEntity()
   
   Calling:ErasePlayerCommand( ply )
end )
