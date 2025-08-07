-- Ragdoll (Script)
-- Extracted from: Movement_System_By_LettuceDev/Put_in_ServerScript_Servis/Ragdoll

game.Players.PlayerAdded:Connect(function(Player)
	Player.CharacterAdded:Connect(function(Char)
		Char:WaitForChild("Humanoid").BreakJointsOnDeath = false
		Char.Humanoid.Died:Connect(function()
			for _, v in pairs(Char:GetDescendants()) do
				if v:IsA("Motor6D") then
					local Att0, Att1 = Instance.new("Attachment"), Instance.new("Attachment")
					Att0.CFrame = v.C0
					Att1.CFrame = v.C1
					Att0.Parent = v.Part0
					Att1.Parent = v.Part1
					local BSC = Instance.new("BallSocketConstraint")
					BSC.Attachment0 = Att0
					BSC.Attachment1 = Att1
					BSC.Parent = v.Part0

					v:Destroy()
				end
			end
			Char.HumanoidRootPart.CanCollide = false
		end)
	end)
end)