# BezierTweens

**Type:** Animation System  
**Usage:** UI/Animation - Custom curves, smooth animations

## 🎯 Purpose
Advanced tweening system using Bezier curves for creating smooth, professional animations with custom easing curves that go beyond standard TweenService options.

## ⚡ Key Features
- **Bezier curve mathematics** - Professional smooth curves
- **Custom easing** - Create unique animation feel
- **Performance optimized** - Efficient curve calculation
- **Flexible API** - Works with any animatable properties
- **Professional results** - Smooth, polished animations

## 📝 Basic Usage
```lua
local BezierTweens = require(ReplicatedStorage.Modules.BezierTweens)

-- Create custom curve tween
local tween = BezierTweens:Create({
    Object = part,
    Property = "Position",
    StartValue = Vector3.new(0, 0, 0),
    EndValue = Vector3.new(100, 0, 0),
    Duration = 2,
    Curve = "EaseInOutBounce" -- Custom curve
})

tween:Play()
```

## 🎮 Animation Examples
```lua
-- Smooth UI animations
local function animateButton(button)
    BezierTweens:Create({
        Object = button,
        Property = "Size",
        EndValue = UDim2.new(1.2, 0, 1.2, 0),
        Duration = 0.3,
        Curve = "EaseOutElastic"
    }):Play()
end

-- Character movement enhancement
local function smoothJump(character)
    BezierTweens:Create({
        Object = character.HumanoidRootPart,
        Property = "Position",
        EndValue = jumpTarget,
        Duration = 1,
        Curve = "EaseInOutQuart"
    }):Play()
end
```

## ✅ **Quality: 8/10**
- **Professional mathematics** - Proper Bezier implementation
- **Smooth results** - Significantly better than linear tweens
- **Flexible system** - Works with various property types
- **Performance optimized** for real-time use

## 🔧 **Reusability: 8/10**
**Excellent for** UI animations, character movement, object transitions. **Essential** for polished, professional-feeling games.

## 📦 Dependencies
- Bezier curve mathematics modules

## 🎯 Recommendation
**Great for polish.** Use this to elevate your animations beyond basic TweenService and create a more professional, smooth feel.