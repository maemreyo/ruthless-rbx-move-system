# Signal

**Author:** stravant  
**Type:** Event System  
**Usage:** Universal - Custom events, communication

## 🎯 Purpose
Custom event system that mimics RBXScriptSignal behavior with yield-safe handlers and performance optimizations. Essential for creating custom events in modules.

## ⚡ Key Features
- **Identical API** to RBXScriptSignal (Connect, Fire, Wait)
- **Yield-safe** handlers can use wait() safely
- **Performance optimized** with cached coroutine runners
- **Batched execution** reduces overhead
- **MIT licensed** for commercial use

## 📝 Basic Usage
```lua
local Signal = require(ReplicatedStorage.Modules.Signal)

-- Create custom event
local onPlayerJoined = Signal.new()

-- Connect handlers
local connection = onPlayerJoined:Connect(function(player, data)
    print(player.Name .. " joined with data:", data)
end)

-- Fire event
onPlayerJoined:Fire(player, {level = 1, coins = 100})

-- Clean up
connection:Disconnect()
onPlayerJoined:DisconnectAll() -- Disconnect all handlers
```

## 🎮 Module Pattern
```lua
local MyModule = {}
MyModule.PlayerDied = Signal.new()
MyModule.ItemCollected = Signal.new()

function MyModule:DoSomething()
    -- Internal logic
    self.PlayerDied:Fire(player, reason)
end

return MyModule

-- Usage:
MyModule.PlayerDied:Connect(function(player, reason)
    -- Handle player death
end)
```

## ✅ **Quality: 9/10**
- **Professional implementation** with proper coroutine management
- **Performance optimized** with thread caching
- **API compatibility** with RBXScriptSignal
- **Yield-safe** - handlers can use wait() safely
- **Well-documented** with clear license

## 🔧 **Reusability: 10/10**
**Essential for module development.** Any module that needs custom events should use this.

## 📦 Dependencies
- None (self-contained)

## 🎯 Recommendation
**Standard for custom events.** This is the go-to solution for creating custom events in Roblox modules and systems.