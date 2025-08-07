game.Players.PlayerAdded:Connect(function(player) --code runs when the player joins the game, we also get the actual player and put it in a variable called "player"
	local leaderstats = Instance.new("Folder", player) --creates a new folder, puts it under the player
	leaderstats.Name = "leaderstats" --names the leaderstats to leaderstats so Roblox knows its a leaderstat

	local wins = Instance.new("IntValue", leaderstats) --creates a new IntValue and puts it under the leaderstats
	wins.Name = "wins" --names the money "money"
	wins.Value = 1 --Player starts off with 100 "money". Change the 100 to how much you want the player to start with

	--if you want to add more values, copy and paste the 3 lines about the   money, then change all the text that says "money" to your new value.      Example:
	--local level = Instance.new("IntValue", leaderstats)
	--level.Name = "level"
	--level.Value = 100
end)