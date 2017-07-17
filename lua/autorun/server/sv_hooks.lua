local ipairs, string_lower, net_Start, net_Send = ipairs, string.lower, net.Start, net.Send -- micro optimizations

-- Net work hooks // I like to have a lot
util.AddNetworkString( "CrateMenuOpen" )
util.AddNetworkString( "OpeningCrates" )
util.AddNetworkString( "FailedOpeningCrate" )
util.AddNetworkString( "RequestItems" )
util.AddNetworkString( "TellPlayerTheirItems")
util.AddNetworkString( "RequestCrafting" )
util.AddNetworkString( "SendCrafting" )
util.AddNetworkString( "CraftingError" ) 
util.AddNetworkString( "GetLoadOutItems" )
util.AddNetworkString( "SendLoadOutItems" )
util.AddNetworkString( "SetNewLoadOut" )
util.AddNetworkString( "ItemMaterialSetter" )
util.AddNetworkString( "SetNewMaterial" )
util.AddNetworkString( "GetMoney" )
util.AddNetworkString( "SendMoney" )
util.AddNetworkString( "GetShopItems" )
util.AddNetworkString( "SendShopItems" )
util.AddNetworkString( "BuyItem" )
util.AddNetworkString( "SellItem" )
util.AddNetworkString( "AddItemCommand" )
util.AddNetworkString( "TakeItemCommand" )
util.AddNetworkString( "GiveMoneyCommand" )
util.AddNetworkString( "TakeMoneyCommand" )
util.AddNetworkString( "ErasePlayerCommand" )

local function AddDir(dir)
	local files, folders = file.Find(dir .. "/*", "GAME")

	for _, fdir in ipairs(folders) do
		if fdir ~= ".svn" then
			AddDir(dir .. "/" .. fdir)
			MsgC(Color(255, 255, 255), "AddDir")
		end
	end

	for k, v in ipairs(files) do
		resource.AddFile(dir .. "/" .. v)
		MsgC(Color(255, 50, 50), "resource.AddFile: "..v)
	end
end
AddDir("materials/crates")

-- Just crate basic player data
hook.Add("PlayerInitialSpawn", "PlayerDataSetUp", function(ply)
   ply:SetUpPlayerData() // Crates there folder.
end)

hook.Add("PlayerSay", "OpenTheCrateMenu", function( ply, text, teamChat )
	for _, cmds in ipairs( GarrBearsCrates.Settings.ChatCommands ) do
		if string_lower(text) == cmds then
			net_Start("CrateMenuOpen")
			net_Send(ply)
		end
	end
end)