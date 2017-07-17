if (SERVER) then
	local function AddDir(dir)
		local files, folders = file.Find(dir .. "/*", "GAME")

		for _, fdir in pairs(folders) do
			if fdir ~= ".svn" then
				AddDir(dir .. "/" .. fdir)
			end
		end

		for k, v in pairs(files) do
			resource.AddFile(dir .. "/" .. v)
		end
	end
	include("crates/init.lua")
	AddDir("materials/crates")
else
	include("crates/cl_init.lua")
end
