-- Script (Script)
-- Extracted from: Movement_System_By_LettuceDev/Put_in_WorkSpace/Spawn/RotatingPart/Spikes/Script

local part = script.Parent

part.Touched:Connect(function(hit)
	if (game.Players:GetPlayerFromCharacter(hit.Parent)) then
		hit.Parent.Humanoid.Health = 0
	end
end)