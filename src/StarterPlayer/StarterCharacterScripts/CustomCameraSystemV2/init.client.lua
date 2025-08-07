-- SERVICES --  MADE BY VUUKSTUDIOS
local RS = game:GetService("ReplicatedStorage")
local TS = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- FOLDERS --
local Modules = RS:WaitForChild("Modules")

-- VALUES --
local RangeFromChar = 8
local UpdateDB = false
local Rotate = false
local LockedValue = script:WaitForChild("LockedValue")
local TargetLock = script:WaitForChild("TargetLock")

local Mouse = require(Modules.Mouse2)


local camera = workspace.CurrentCamera
camera.CameraType = Enum.CameraType.Custom

local CameraPart = Instance.new("Part", workspace)
CameraPart.Name = "CameraPart"
CameraPart.Anchored = true
CameraPart.CanCollide = false
CameraPart.Transparency = 1

local Player = game.Players.LocalPlayer
local Character = script.Parent
local HRP = Character:WaitForChild("HumanoidRootPart")
local Hum = Character:WaitForChild("Humanoid")

CameraPart.Parent = Character
CameraPart.CFrame = HRP.CFrame * CFrame.new(1,1.5,0)


local function lockBehavior(Bool)
	if Bool == true then
		Rotate = true
		if Rotate == false then
			local FOVTI = TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
			local FOVTween = TS:Create(camera, FOVTI, {FieldOfView = 65})
			FOVTween:Play()
		end
	end
end

local diedConnection


local d1 = false
UIS.InputBegan:Connect(function(Input, T)
	if T then return end
	Player:GetMouse().TargetFilter = Character

	if Input.KeyCode == Enum.KeyCode.LeftAlt then
		 if d1 == false then return end
		local target = Player:GetMouse().Target
		if target then
			if target.Parent:FindFirstChild("Humanoid") and target.Parent ~= Character or target.Parent.Parent:FindFirstChild("Humanoid") and target.Parent ~= Character then
				if target.Parent:FindFirstChild("Humanoid") then
					if TargetLock.Value ~= target.Parent.PrimaryPart then
						TargetLock.Value = target.Parent.PrimaryPart
						

						diedConnection = target.Parent["Humanoid"].Died:Connect(function()
							TargetLock.Value = nil
					

							diedConnection:Disconnect()
							diedConnection = nil
						end)

						
					end 
				else
					if TargetLock.Value ~= target.Parent.Parent.PrimaryPart then
						TargetLock.Value = target.Parent.Parent.PrimaryPart
					

						diedConnection = target.Parent.Parent["Humanoid"].Died:Connect(function()
							TargetLock.Value = nil
						
							diedConnection:Disconnect()
							diedConnection = nil
						end)

					
					end 
				end
			else
				if diedConnection then
					diedConnection:Disconnect()
					diedConnection = nil
				end
				TargetLock.Value = nil
			
			end
		end
	end
end)

coroutine.wrap(function()
	RunService.Heartbeat:Connect(function()
		local tweenTime = 0.6 -- Time it takes for the camera to reach the destination, increase to make it smoother / slower.

		camera.CameraSubject = CameraPart

		if TargetLock.Value == nil then
			camera.CameraType = Enum.CameraType.Custom
			local TI = TweenInfo.new(tweenTime, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
			local NewTw = TS:Create(CameraPart, TI, {CFrame = HRP.CFrame * CFrame.new(1, 1.5, 0)})
			NewTw:Play()
		else
			camera.CameraType = Enum.CameraType.Scriptable
			local TI = TweenInfo.new(tweenTime, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
			local NewTw = TS:Create(CameraPart, TI, {CFrame = CFrame.new((HRP.CFrame * CFrame.new(1.5, 1.5, 0)).Position, TargetLock.Value.Position)}) -- Position of the camera when it is NOT locked to a target.
			NewTw:Play()

			local TI = TweenInfo.new(tweenTime, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
			local NewTw = TS:Create(camera, TI, {CFrame = CFrame.new((HRP.CFrame * CFrame.new(4, 4, 10)).Position, TargetLock.Value.Position)}) -- Position of the camera when locked to a target.
			NewTw:Play()

			HRP.CFrame = CFrame.new(HRP.CFrame.p, Vector3.new(TargetLock.Value.Position.X, HRP.Position.Y, TargetLock.Value.Position.Z))
		end

		if UIS.MouseBehavior == Enum.MouseBehavior.LockCenter and LockedValue.Value == false then
			if TargetLock.Value ~= nil then return end
			LockedValue.Value = true
			lockBehavior(true)
		elseif UIS.MouseBehavior ~= Enum.MouseBehavior.LockCenter and LockedValue.Value == true then
			if TargetLock.Value ~= nil then return end
			LockedValue.Value = false
		end

		if Rotate and LockedValue.Value and not TargetLock.Value then
			local FOVTI = TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
			local FOVTween = TS:Create(camera, FOVTI, {FieldOfView = 65})
			FOVTween:Play()

			local MousePos = Mouse:GetHit().Position
			local lookVector = Vector3.new(MousePos.X, HRP.Position.Y, MousePos.Z)
			HRP.CFrame = CFrame.new(HRP.CFrame.p, Vector3.new(camera.CFrame.Position.X, HRP.CFrame.p.Y, camera.CFrame.Position.Z)) * CFrame.fromEulerAnglesXYZ(math.rad(0), math.rad(170), math.rad(0))
		elseif LockedValue.Value == false and not TargetLock.Value then
			local FOVTI = TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
			local FOVTween = TS:Create(camera, FOVTI, {FieldOfView = 65})
			FOVTween:Play()
		end
	end)
end)()