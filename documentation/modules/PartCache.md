# PartCache

**Author:** Xan the Dragon / Eti the Spirit  
**Type:** Performance Optimization System  
**Usage:** High-Performance Games - Bullets, effects, particles

## 🎯 Purpose
Object pooling system that eliminates lag from creating/destroying parts frequently. Pre-creates parts and reuses them by moving to distant locations instead of destroying.

## ⚡ Key Features
- **Dramatic performance improvement** for frequent part creation
- **Object pooling** - Reuse parts instead of create/destroy
- **Automatic management** - Handles expansion and cleanup
- **TypeScript compatible** with strict typing
- **CFrame optimization** - Only "fast" property is changed

## 📝 Basic Usage
```lua
local PartCache = require(ReplicatedStorage.Modules.PartCache)

-- Create cache for bullet parts
local bulletTemplate = -- Your bullet part template
local bulletCache = PartCache.new(bulletTemplate, 50) -- Pre-create 50

-- Get a part (instead of bulletTemplate:Clone())
local bullet = bulletCache:GetPart()
bullet.CFrame = firePosition
bullet.Parent = workspace

-- Return when done (instead of bullet:Destroy())
bulletCache:ReturnPart(bullet)
```

## 🎮 Perfect Use Cases
```lua
-- Weapon systems
local function fireBullet()
    local bullet = bulletCache:GetPart()
    bullet.CFrame = muzzle.CFrame
    bullet.Parent = workspace
    
    -- After impact/timeout
    bulletCache:ReturnPart(bullet)
end

-- Particle effects
local function createSpark()
    local spark = sparkCache:GetPart()
    spark.CFrame = explosionPos
    -- Animate, then return to cache
end
```

## ✅ **Quality: 9/10**
- **Proven performance benefits** backed by Roblox engineer insights
- **Type-safe implementation** with strict typing
- **Comprehensive API** with proper error handling
- **Community standard** for performance optimization
- **Well-documented** with clear examples

## 🔧 **Reusability: 8/10**
**Essential for** games with frequent part creation (bullets, effects, debris). **Not needed** for static or rarely-changing parts.

## 📦 Dependencies
- Table utility module

## 🎯 Recommendation
**Must-use for high-performance games.** If you create/destroy parts frequently, this module will eliminate related lag entirely.