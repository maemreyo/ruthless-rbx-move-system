-- LedgeGrab (LocalScript)
-- Extracted from: Movement_System_By_LettuceDev/Put_in_StarterCharacterScripts/LedgeGrab

local plr = game.Players.LocalPlayer
local Character = plr.Character or plr.CharacterAdded:Wait()
local Root = Character:WaitForChild("HumanoidRootPart")
local Head = Character:WaitForChild("Head")
local Hum = Character:WaitForChild("Humanoid")
local CA = Hum:LoadAnimation(script:WaitForChild("ClimbAnim"))
local HA = Hum:LoadAnimation(script:WaitForChild("HoldAnim"))
local TouchGui = plr:WaitForChild("PlayerGui"):FindFirstChild("TouchGui")
local UIS = game:GetService("UserInputService")
ledgeavailable = true
holding = false

while game:GetService("RunService").Heartbeat:Wait() do
	local r = Ray.new(Head.CFrame.p, Head.CFrame.LookVector * 5)
	local part,position = workspace:FindPartOnRay(r,Character)
	
	if part and ledgeavailable and not holding then
		if part.Size.Y >= 7 then
			if Head.Position.Y >= (part.Position.Y + (part.Size.Y / 2)) - 1 and Head.Position.Y <= part.Position.Y + (part.Size.Y / 2) and  Root.Velocity.Y <= 0 then
				Root.Anchored = true holding = true HA:Play() ledgeavailable = false
			end
		end
	end
	
	function climb()
		local Vele = Instance.new("BodyVelocity",Root)
		Root.Anchored = false
		Vele.MaxForce = Vector3.new(1,1,1) * math.huge
		Vele.Velocity = Root.CFrame.LookVector * 10 + Vector3.new(0,30,0)
		HA:Stop() CA:Play()
		game.Debris:AddItem(Vele,.15)
		holding = false
		wait(.75)
		ledgeavailable = true
	end
	
	UIS.InputBegan:Connect(function(Key,Chat)
		if not holding then return end 
		if Key.KeyCode == Enum.KeyCode.Space and not Chat then
			climb()
		end
	end)
	
	if TouchGui then
		TouchGui:WaitForChild("TouchControlFrame"):WaitForChild("JumpButton").MouseButton1Click:Connect(function()
			if not holding then return end climb()
		end)
	end
end