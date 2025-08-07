# Janitor

**Author:** Validark (with community contributions)  
**Type:** Memory Management System  
**Usage:** Universal - Essential for all projects

## 🎯 Purpose
Automatic cleanup and memory management system that prevents memory leaks by tracking and disposing of connections, instances, functions, and other resources when no longer needed.

## ⚡ Key Features
- **Automatic cleanup** when objects are destroyed
- **Multiple resource types** - connections, instances, functions
- **LinkToInstance** - Auto-cleanup when parent instance is destroyed  
- **TypeScript support** with proper type definitions
- **Performance optimized** with efficient tracking

## 📝 Basic Usage
```lua
local Janitor = require(ReplicatedStorage.Modules.Janitor)
local janitor = Janitor.new()

-- Add resources to track
janitor:Add(connection, "Disconnect") -- RBXScriptConnection
janitor:Add(part, "Destroy") -- Instance
janitor:Add(function() print("cleanup") end, true) -- Function

-- Auto-cleanup when instance is destroyed
janitor:LinkToInstance(character)

-- Manual cleanup
janitor:Cleanup() -- Cleans everything
```

## 🎮 Real-World Pattern
```lua
-- Character system example
local function setupCharacter(character)
    local janitor = Janitor.new()
    
    -- Track all character-related resources
    janitor:Add(character.Humanoid.Died:Connect(onDeath), "Disconnect")
    janitor:Add(RunService.Heartbeat:Connect(updateLoop), "Disconnect")
    janitor:Add(gui, "Destroy")
    
    -- Auto-cleanup when character is removed
    janitor:LinkToInstance(character)
    
    -- No manual cleanup needed - happens automatically!
end
```

## ✅ **Quality: 10/10**
- **Industry standard** memory management
- **Well-documented** with type annotations
- **Community maintained** with active development
- **TypeScript support** for modern workflows
- **Battle-tested** across countless projects

## 🔧 **Reusability: 10/10**
**Essential for every project.** Memory leaks are a major issue in Roblox games - this prevents them entirely.

## 📦 Dependencies
- None (standalone utility)

## 🎯 Recommendation
**Use in every script.** This is fundamental to proper Roblox development and prevents the #1 cause of performance issues in games.