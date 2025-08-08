local runservice = game:GetService("RunService")

local camera = workspace.CurrentCamera

local character = script.Parent
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local defaultOffset = Vector3.new(0, -0.5, -2)
local rotationSpeed = 3
local bobbleSpeed = 3
local rotationIntensity = 0.03
local bobbleIntensity = 0.7

local shakeEnabled = true
local x, y, z = 0, 0, 0

local lastTime = tick()
local currentTime = 0

runservice.RenderStepped:Connect(function()
	local distance = (camera.CFrame.p - camera.Focus.p).Magnitude

	local rayParams = RaycastParams.new()
	rayParams.FilterType = Enum.RaycastFilterType.Blacklist
	rayParams.FilterDescendantsInstances = {character}

	local raycast = workspace:Raycast(humanoidRootPart.Position, humanoidRootPart.CFrame.LookVector * 3, rayParams)

	if distance < 0.7 then
		if raycast then
			shakeEnabled = false
			defaultOffset = Vector3.new(0, -0.2, -0.6)
		else
			shakeEnabled = true
			defaultOffset = Vector3.new(0, -0.2, -2)
		end
	else
		shakeEnabled = true
		defaultOffset = Vector3.new(0, -0.2, 0)
	end

	if humanoid.MoveDirection.Magnitude > 0 and shakeEnabled then		
		if lastTime == 0 then
			lastTime = tick()
		end
		currentTime = tick() - lastTime

		local offsetY = math.abs(math.sin(currentTime * bobbleSpeed) * bobbleIntensity)

		local rotation = math.sin(currentTime * rotationSpeed) * rotationIntensity

		local offset = Vector3.new(0, offsetY) + defaultOffset

		humanoid.CameraOffset = humanoid.CameraOffset:Lerp(offset, 0.1)

		camera.CFrame = camera.CFrame * CFrame.Angles(x, y, rotation)
		z = rotation
	else
		lastTime = 0
		humanoid.CameraOffset = humanoid.CameraOffset:Lerp(defaultOffset, 0.1)

		z = z * 0.9
		camera.CFrame = camera.CFrame * CFrame.Angles(x, y, z)
	end
end)
