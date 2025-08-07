-- Thread (ModuleScript)
-- Extracted from: Movement_System_By_LettuceDev/Put_in_Replicated_Storage/Modules/Mouse2/Thread

local Thread = {}

local RunService = game:GetService("RunService")

function Thread:Wait(t)
	if t ~= nil then
		local TotalTime = 0
		TotalTime = TotalTime + RunService.Heartbeat:Wait()
		while TotalTime < t do
			TotalTime = TotalTime + RunService.Heartbeat:Wait()
		end
	else
		RunService.Heartbeat:Wait()
	end
end

function Thread:Spawn(callback)
	local bindable = Instance.new("BindableEvent")
	bindable.Event:connect(callback)
	bindable:Fire()
	bindable:Destroy()
end

function Thread:Delay(t, callback)
	self:Spawn(function()
		self:Wait(t)
		callback()
	end)
end

return Thread