local tween = game:GetService("TweenService")
local part = script.Parent

local timeTaken = 10 -- Time it takes for one full rotation

while true do
	local changePerSpin = timeTaken/0.03
	
	part.CFrame = part.CFrame * CFrame.Angles(math.rad(360/changePerSpin),0,0)
	wait()
end