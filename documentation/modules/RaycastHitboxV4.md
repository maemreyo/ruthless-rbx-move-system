# RaycastHitboxV4

**Author:** Swordphin123  
**Type:** Melee Combat System  
**Usage:** Combat Games - Swords, tools, melee weapons

## 🎯 Purpose
Advanced raycast-based hitbox system for melee combat. Uses attachment points to create precise hit detection for weapons, tools, and character abilities.

## ⚡ Key Features
- **Attachment-based** hitbox definition using "DmgPoint" attachments
- **Raycast precision** - No missed hits or double hits
- **Flexible configuration** - Works with any model/tool
- **Group support** - Multiple hitbox groups per weapon
- **Performance optimized** - Only active when needed

## 📝 Setup Process
```lua
-- 1. Add "DmgPoint" attachments to your weapon
-- 2. Create hitbox system
local RaycastHitbox = require(ReplicatedStorage.Modules.RaycastHitboxV4)
local weaponHitbox = RaycastHitbox.new(sword) -- Your weapon model

-- 3. Connect hit events
weaponHitbox.OnHit:Connect(function(hit, humanoid)
    humanoid:TakeDamage(damage)
end)

-- 4. Control hitbox timing
weaponHitbox:HitStart() -- Enable hitbox
wait(0.5) -- Swing duration
weaponHitbox:HitStop() -- Disable hitbox
```

## 🎮 Advanced Usage
```lua
-- Custom hit points (no attachments needed)
hitbox:SetPoints(swordBlade, {
    Vector3.new(0, 0, -2),
    Vector3.new(0, 0, 0), 
    Vector3.new(0, 0, 2)
}, "blade")

-- Link attachments for dynamic hitboxes
hitbox:LinkAttachments(attachment1, attachment2)

-- Filter what can be hit
hitbox:SetFilter({workspace.Effects}, Enum.RaycastFilterType.Blacklist)
```

## ✅ **Quality: 9/10**
- **Comprehensive documentation** with examples
- **Flexible API** supports multiple use cases
- **Performance conscious** - only raycasts when active
- **Community standard** for Roblox melee combat
- **TypeScript compatible** with strict typing

## 🔧 **Reusability: 8/10**
**Essential for** any game with melee combat, tools, or character abilities. **Not needed** for ranged-only or non-combat games.

## 📦 Dependencies
- None (self-contained)

## 🎯 Recommendation
**Standard solution for melee combat.** This is the go-to module for swords, tools, punches, and any melee hit detection in Roblox games.