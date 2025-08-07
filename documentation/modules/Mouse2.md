# Mouse2

**Author:** Jiwonz  
**Type:** Enhanced Mouse System  
**Usage:** UI/Input - Custom cursors, mouse effects

## 🎯 Purpose
Advanced mouse utility system that provides enhanced cursor control, custom cursors, trail effects, and first-person/third-person detection with proper GUI positioning.

## ⚡ Key Features
- **First-person detection** - Automatically detects camera mode
- **Custom cursor system** - Replace default mouse cursor
- **Trail effects** - Visual mouse trails with customization
- **System cursor integration** - Access to built-in cursor types
- **Position management** - Handles GUI inset and scaling
- **Color/transparency** control

## 📝 Basic Setup
```lua
local Mouse2 = require(ReplicatedStorage.Modules.Mouse2)

-- Initialize enhanced mouse
local mouse = Mouse2.new()

-- Set custom cursor
mouse:SetIcon("rbxassetid://123456789")

-- Configure appearance
mouse:SetSize(Vector2.new(32, 32))
mouse:SetColor(Color3.new(1, 0.5, 0))
mouse:SetTransparency(0.2)
```

## 🎮 Advanced Features
```lua
-- Trail effects
mouse:TrailStart(0.5, 0.1) -- duration, rate
mouse.trail_enabled = false -- Stop trails

-- Camera mode detection
if mouse:IsFirstPerson() then
    -- Cursor centers on screen
    print("First person mode")
else
    -- Cursor follows mouse position
    print("Third person mode")
end

-- System cursors
local crosshairId = mouse:GetSystemCursor("Crosshair")
mouse:SetIcon(crosshairId)

-- Hide/show cursor
mouse:Hide(true)  -- Hide cursor
mouse:Hide(false) -- Show cursor
```

## 🎨 Visual Customization
```lua
-- Animated cursor changes
local function animateCursor()
    -- Pulse effect
    for i = 1, 10 do
        mouse:SetSize(Vector2.new(16 + i*2, 16 + i*2))
        wait(0.05)
    end
    
    -- Color transitions
    mouse:SetColor(Color3.fromRGB(255, 100, 100))
    wait(0.5)
    mouse:SetColor(Color3.fromRGB(100, 100, 255))
end

-- Context-sensitive cursors
workspace.Part.MouseEnter:Connect(function()
    mouse:SetIcon(mouse:GetSystemCursor("PointingHand"))
end)

workspace.Part.MouseLeave:Connect(function()
    mouse:SetIcon("") -- Default cursor
end)
```

## ✅ **Quality: 7/10**
- **Useful functionality** for cursor customization
- **First-person detection** is clever implementation
- **Trail effects** add visual polish
- **System cursor access** provides consistency
- **Limited documentation** and some complexity

## 🔧 **Reusability: 6/10**
**Good for** UI-heavy games, point-and-click adventures, games needing cursor feedback. **Not essential** for most action games.

## 📦 Dependencies
- SystemCursors module
- Thread utility
- MouseFixScreen GUI component

## 🎯 Recommendation
**Useful for specific needs.** Great if you need custom cursors or mouse trails, but not essential for most games. Best for UI-focused or point-and-click style games.