db = false
script.Parent.Touched:Connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") then
		local player = game.Players:GetPlayerFromCharacter(hit.Parent)
		if db == false then
			db = true
			script.Parent.BrickColor = BrickColor.new("Bright red")
			player.leaderstats.wins.Value = player.leaderstats.wins.Value + 1
			wait(3)
			script.Parent.BrickColor = BrickColor.new("Bright green")
			db = false
		end
	end
end)