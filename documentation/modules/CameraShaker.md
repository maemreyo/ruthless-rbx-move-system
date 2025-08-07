# CameraShaker

**Author:** Stephen Leitnick  
**Type:** Essential Game Juice Module  
**Usage:** Universal - Use in any game requiring feedback

## 🎯 Purpose
Industry-standard camera shake system for damage feedback, explosions, impacts, and environmental effects. Based on Unity's EZ Camera Shake with written permission.

## ⚡ Key Features
- **Performance optimized** with debug profiling
- **Built-in presets** (Explosion, Earthquake, Bump, etc.)
- **Sustained and one-shot** shake modes
- **Customizable intensity** and fade times
- **Professional implementation** used across countless games

## 📝 Core API
```lua
local camShake = CameraShaker.new(renderPriority, callback)
camShake:Start()

-- One-shot shake
camShake:ShakeOnce(magnitude, roughness, fadeIn, fadeOut)

-- Preset shake
camShake:Shake(CameraShaker.Presets.Explosion)

-- Sustained shake
camShake:ShakeSustain(CameraShaker.Presets.Earthquake)
camShake:StopSustained(fadeTime)
```

## 🎮 Usage Examples
```lua
-- Damage feedback
humanoid.HealthChanged:Connect(function()
    camShake:Shake(CameraShaker.Presets.Bump)
end)

-- Explosion effect
camShake:ShakeOnce(5, 2, 0.1, 2.0)

-- Earthquake ambient
local earthquake = camShake:ShakeSustain(CameraShaker.Presets.Earthquake)
-- Stop after 10 seconds
wait(10)
earthquake:StartFadeOut(2)
```

## ✅ **Quality: 10/10**
- **Industry standard** - used in professional games
- **Complete documentation** and examples
- **Optimized performance** with profiling
- **Modular design** with separate presets
- **Battle-tested** implementation

## 🔧 **Reusability: 10/10** 
**Essential for any game** - works in all genres for feedback and juice.

## 📦 Dependencies
- CameraShakeInstance
- CameraShakePresets

## 🎯 Recommendation
**Must-use module.** This is professional-grade game juice that dramatically improves player experience with minimal effort.