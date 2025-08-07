local part = script.Parent

part.Touched:Connect(function(hit)
	if (game.Players:GetPlayerFromCharacter(hit.Parent)) then
		hit.Parent.Humanoid.Health = 0
	end
end)