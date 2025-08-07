local status = game.ReplicatedStorage.Stat
status.Changed:Connect(function()
	script.Parent.Text = status.Value
end)