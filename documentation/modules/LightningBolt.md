# LightningBolt

**Type:** Visual Effects System  
**Usage:** Action Games - Lightning, electricity, energy effects

## 🎯 Purpose
Professional lightning bolt generation system that creates realistic branching lightning effects with customizable appearance and animation.

## ⚡ Key Features
- **Realistic branching** - Authentic lightning patterns
- **Customizable appearance** - Color, thickness, animation
- **Performance optimized** - Efficient part management
- **Multiple styles** - Different lightning types available
- **Easy integration** - Simple API for complex effects

## 📝 Basic Usage
```lua
local LightningBolt = require(ReplicatedStorage.Modules.LightningBolt)

-- Create lightning between two points
local bolt = LightningBolt.new(startPos, endPos, {
    PartCount = 30,
    Thickness = 2,
    Color = Color3.new(0, 0.5, 1),
    AnimationSpeed = 2
})

-- Show the lightning
bolt:Show()

-- Clean up after animation
wait(0.5)
bolt:Destroy()
```

## 🎮 Effect Examples
```lua
-- Magic spell effect
local function castLightningSpell(caster, target)
    local bolt = LightningBolt.new(caster.HumanoidRootPart.Position, target.Position)
    bolt:Show()
    -- Apply damage, effects, etc.
end

-- Environmental lightning
local function createStorm()
    for i = 1, 10 do
        local bolt = LightningBolt.new(
            Vector3.new(math.random(-100, 100), 100, math.random(-100, 100)),
            Vector3.new(math.random(-100, 100), 0, math.random(-100, 100))
        )
        bolt:Show()
        wait(math.random(1, 3))
    end
end
```

## ✅ **Quality: 8/10**
- **Realistic visual effects** with proper branching
- **Performance conscious** implementation
- **Customizable parameters** for different needs
- **Professional appearance** suitable for published games

## 🔧 **Reusability: 7/10**
**Great for** magic systems, electrical effects, storms, energy weapons. **Limited use** in non-fantasy/sci-fi games.

## 📦 Dependencies
- Part creation utilities

## 🎯 Recommendation
**Excellent for visual polish.** Adds professional lightning effects that significantly enhance the visual appeal of magic and electrical systems.