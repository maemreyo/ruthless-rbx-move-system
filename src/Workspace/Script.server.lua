local status = game.ReplicatedStorage.Stat
local maps = game.ReplicatedStorage.Maps:GetChildren()
while true do
	for i = 1,60 do
		status.Value = "Intermission.. "..60-i
		wait(1)
	end

	local random = math.random(1, #maps)

	local map = maps[random]:Clone()
	map.Parent = workspace

	status.Value = " "..map.Name
	wait(5)

	local players = game.Players:GetChildren()
	for i = 1,#players do
		if players[i].Character ~= nil then
			local spawnLoc = math.random(1,#workspace.Teleports:GetChildren())
			players[i].Character:MoveTo(workspace.Teleports:GetChildren()[spawnLoc].Position)
			players[i].Character.Parent = workspace.Ingame
		end
	end

	local roundtime = 30

	repeat
		roundtime = roundtime -1
		status.Value = "Time left.. "..roundtime
		wait(1)
	until roundtime == 0 or #workspace.Ingame:GetChildren() == 0

	wait(2)
	map:Destroy()

	local players = game.Players:GetChildren()
	for i = 1,#players do
		if players[i].Character ~= nil then
			players[i]:LoadCharacter()
		end
	end
end