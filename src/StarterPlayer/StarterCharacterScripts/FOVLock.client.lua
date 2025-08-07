-- FOVLock (LocalScript)
-- Extracted from: Movement_System_By_LettuceDev/Put_in_StarterCharacterScripts/FOVLock

local Player = game:GetService('Players').LocalPlayer
Player.CharacterAdded:Wait()
local cam = workspace.CurrentCamera
cam.FieldOfView = 60