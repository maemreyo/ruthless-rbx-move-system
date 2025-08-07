-- Slide (LocalScript)
-- Extracted from: Movement_System_By_LettuceDev/Put_in_StarterCharacterScripts/Slide

local UIS = game:GetService("UserInputService")
local char = script.Parent

local slideAnim = script:WaitForChild("SlideAnimation")


local keybind2 = Enum.KeyCode.E --key code
local canslide = true

UIS.InputBegan:Connect(function(input,gameprocessed)
	if gameprocessed then return end
	if not canslide then return end

	if input.KeyCode == keybind2 then
		canslide = false
local party	= script:WaitForChild("ParticleEmitter"):Clone()
		local playAnim = char.Humanoid:LoadAnimation(slideAnim)
		playAnim:Play()
	
		party.Parent = char:WaitForChild("Torso") -- if you have r15 change to UpperTorso	
		party.Enabled = true
	

		local slide = Instance.new("BodyVelocity")
		slide.MaxForce = Vector3.new(1,0,1)*50000
		slide.Velocity = char.HumanoidRootPart.CFrame.lookVector*100
		slide.Parent = char.HumanoidRootPart

		for count = 1,8 do
			wait(0.1)
			slide.Velocity*=0.8
		end
		
		party.Enabled = false
		playAnim:Stop()
		slide:Destroy()

		wait(2)
		party:Destroy()
		canslide = true
	end
end)