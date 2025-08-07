local KillBrick = script.Parent 

KillBrick.Touched:Connect(function(touched)
	
	local humanoid = touched.Parent:WaitForChild("Humanoid") --Waiting for child
	
	if humanoid  then
		humanoid.Health = 0
		
		end
end) 

