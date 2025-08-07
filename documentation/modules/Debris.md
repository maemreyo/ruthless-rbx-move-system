# Debris

**Type:** Visual Effects Manager  
**Usage:** Action Games - Explosions, environmental effects

## 🎯 Purpose
Specialized debris and environmental effects system that creates lightning waves, particle explosions, and dynamic debris using optimized part caching and lightning bolt integration.

## ⚡ Key Features
- **Lightning wave effects** - Circular lightning patterns
- **PartCache integration** - Optimized performance with 1000+ cached parts
- **CollectionService integration** - Works with tagged floor objects
- **Configurable parameters** - Amount, color, position control
- **Automatic cleanup** - Managed lifecycle of effect objects

## 📝 Core Functions
```lua
local Debris = require(ReplicatedStorage.Modules.Debris)

-- Create lightning wave explosion
Debris.lightningWaves(
    Vector3.new(0, 5, 0),      -- Target position
    8,                          -- Number of lightning bolts
    Color3.fromRGB(0, 150, 255) -- Lightning color
)
```

## 🎮 Effect Examples
```lua
-- Spell impact effect
local function createMagicExplosion(hitPosition)
    -- Lightning waves
    Debris.lightningWaves(hitPosition, 12, Color3.fromRGB(255, 100, 255))
    
    -- Additional effects could be added here
end

-- Environmental destruction
local function createDestructionEffect(building)
    local center = building.PrimaryPart.Position
    
    -- Multiple wave patterns
    Debris.lightningWaves(center, 6, Color3.fromRGB(255, 200, 0))
    wait(0.2)
    Debris.lightningWaves(center, 4, Color3.fromRGB(255, 100, 0))
end
```

## 🔧 **Technical Implementation**
- **Circular mathematics** - Uses cos/sin for precise positioning
- **Attachment system** - Creates proper lightning anchor points  
- **World space calculations** - Accurate 3D positioning
- **Performance optimized** - 1000-part cache pre-allocated

## ✅ **Quality: 7/10**
- **Good visual effects** with proper mathematics
- **Performance conscious** using PartCache
- **CollectionService integration** for floor detection
- **Limited scope** - focused on lightning effects only
- **Specialized use case** - not universally applicable

## 🔧 **Reusability: 6/10**
**Great for** magic systems, explosions, environmental destruction. **Limited use** in non-fantasy or minimal-effects games.

## 📦 Dependencies
- PartCache (for performance)
- LightningBolt (for effects)
- LightningSparks (for additional effects)
- CollectionService (for floor detection)

## 🎯 Recommendation
**Specialized effects module.** Use if you need dramatic lightning-based explosion effects. The circular wave pattern is particularly effective for magic spells and environmental destruction.