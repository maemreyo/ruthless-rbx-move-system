# Step 2: File Migration Execution

## 🎯 Objective
Execute the planned migration by moving extracted files to their proper locations in the Rojo project structure.

## 🔧 Migration Commands

### Phase 1: Core Scripts Migration

#### 1. ServerScriptService Scripts
```bash
cp extracted/src/ReplicatedStorage/Put_in_ServerScript_Servis/leaderstats.server.lua src/ServerScriptService/
cp extracted/src/ReplicatedStorage/Put_in_ServerScript_Servis/Ragdoll.server.lua src/ServerScriptService/
```

**Result**: Core server scripts moved to proper Rojo location.

#### 2. StarterCharacterScripts
```bash
cp extracted/src/ReplicatedStorage/Put_in_StarterCharacterScripts/*.client.lua src/StarterPlayer/StarterCharacterScripts/
```

**Files Moved**:
- `Animate.client.lua` - Character animation system
- `CamController.client.lua` - Camera control system  
- `CameraBobble.client.lua` - Camera bobbing effects
- `CustomCameraSystemV2.client.lua` - Advanced camera system
- `FOVLock.client.lua` - Field of view locking
- `LedgeGrab.client.lua` - Ledge grabbing mechanics
- `Slide.client.lua` - Sliding movement mechanics

#### 3. StarterPlayerScripts  
```bash
cp extracted/src/ReplicatedStorage/Put_in_StarterPlayerScripts/LocalScript.client.lua src/StarterPlayer/StarterPlayerScripts/
cp extracted/src/ReplicatedStorage/Put_in_StarterPlayerScripts/WindController.client.lua src/StarterPlayer/StarterPlayerScripts/
```

#### 4. WindController Module System
```bash
mkdir -p src/StarterPlayer/StarterPlayerScripts/WindController
cp -r extracted/src/ReplicatedStorage/Put_in_StarterPlayerScripts/WindController/* src/StarterPlayer/StarterPlayerScripts/WindController/
```

**WindController Structure**:
- `WindLines.lua` - Wind line effects
- `WindShake.lua` - Wind shaking system
- `WindShake/Settings.lua` - Configuration settings
- `WindShake/Octree/` - Spatial optimization system

#### 5. Workspace Scripts
```bash
cp extracted/src/ReplicatedStorage/Put_in_WorkSpace/Script.server.lua src/Workspace/
cp extracted/src/ReplicatedStorage/Put_in_WorkSpace/ShiftLock.server.lua src/Workspace/
```

### Phase 2: Modules and Content Migration

#### 1. ReplicatedStorage Modules (30+ modules)
```bash
cp -r extracted/src/ReplicatedStorage/Put_in_Replicated_Storage/Modules/* src/ReplicatedStorage/Modules/
```

**Major Modules Transferred**:
- **CameraShaker** - Professional camera shake effects
- **FastCastRedux** - High-performance projectile system  
- **RaycastHitboxV4** - Advanced combat hitbox system
- **Zone** - Area detection and management
- **PartCache** - Performance optimization for parts
- **LightningBolt** - Lightning effect system
- **CraterEffects** - Explosion crater system
- **BezierTweens** - Smooth curve animations
- **BoatTween** - Advanced tweening system
- **Mouse2** - Enhanced mouse utilities

#### 2. Maps Collection (6 difficulty levels)
```bash
cp -r extracted/src/ReplicatedStorage/Put_in_Replicated_Storage/Maps/* src/ReplicatedStorage/Maps/
```

**Maps Transferred**:
- `Level_-_Easy/` - Beginner-friendly obstacles
- `Level_-_Simple/` - Basic movement challenges  
- `Level_-_Mild/` - Moderate difficulty
- `Level_-_Intermediate/` - Advanced challenges
- `Level_-_Challenging/` - Expert-level obstacles
- `Level_-_Casual/` - Relaxed gameplay

Each map includes:
- Obstacle parts (.rbxmx files)
- Kill scripts (`KillPartScript.server.lua`)
- Custom mechanics scripts (`Script.server.lua`)

### Phase 3: Asset Files Migration

#### 1. Lighting Effects
```bash
cp extracted/src/ReplicatedStorage/Put_in_Lighting.rbxmx src/Lighting/
```

**Contents**: Professional lighting setup with atmosphere, sky, bloom, color correction, depth of field, and sun rays.

#### 2. Workspace Assets
```bash
cp extracted/src/ReplicatedStorage/Put_in_WorkSpace/Spawn.rbxmx src/Workspace/Spawn/
cp extracted/src/ReplicatedStorage/Put_in_WorkSpace/Teleports.rbxmx src/Workspace/Teleports/  
cp extracted/src/ReplicatedStorage/Put_in_WorkSpace/Walls.rbxmx src/Workspace/Walls/
```

**Asset Types**:
- **Spawn.rbxmx** - Player spawn points and mechanisms
- **Teleports.rbxmx** - Teleportation system components
- **Walls.rbxmx** - Wall and barrier structures

## 🔧 Cleanup Operations

### Phase 4: Project Cleanup

#### 1. Remove Placeholder Files
```bash
find src/ -name ".gitkeep" -delete
```

**Result**: Cleaned up temporary placeholder files that were used to maintain directory structure.

#### 2. Remove Extraction Directories
```bash
rm -rf extracted extracted-binary
```

**Result**: Removed temporary extraction directories to clean up project workspace.

## 📊 Migration Results

### File Count Analysis
```bash
find src/ -name "*.lua" | wc -l
```
**Result**: 90+ Lua script files properly organized

```bash
find src/ -name "*.rbxmx" | wc -l  
```
**Result**: 100+ asset files for visual components

### Structure Verification
```bash
tree src -I "*.rbxmx" | head -50
```

**Final Structure**:
```
src/
├── client/
│   └── init.client.luau
├── Lighting/
├── ReplicatedStorage/
│   ├── Maps/
│   │   ├── Level_-_Easy/
│   │   ├── Level_-_Simple/
│   │   ├── Level_-_Mild/
│   │   ├── Level_-_Intermediate/
│   │   ├── Level_-_Challenging/
│   │   └── Level_-_Casual/
│   └── Modules/
│       ├── CameraShaker/
│       ├── FastCastRedux/
│       ├── RaycastHitboxV4/
│       └── [27 more modules]/
├── ServerScriptService/
│   ├── leaderstats.server.lua
│   └── Ragdoll.server.lua
├── shared/
│   └── Hello.luau
├── StarterGui/
├── StarterPlayer/
│   ├── StarterCharacterScripts/
│   │   ├── Animate.client.lua
│   │   ├── CamController.client.lua
│   │   ├── CameraBobble.client.lua
│   │   ├── CustomCameraSystemV2.client.lua
│   │   ├── FOVLock.client.lua
│   │   ├── LedgeGrab.client.lua
│   │   └── Slide.client.lua
│   └── StarterPlayerScripts/
│       ├── LocalScript.client.lua
│       ├── WindController.client.lua
│       └── WindController/
└── Workspace/
    ├── Ingame/
    ├── Script.server.lua
    ├── ShiftLock.server.lua
    ├── Spawn/
    ├── Teleports/
    └── Walls/
```

## ✅ Migration Success Metrics

### Quantitative Results
- ✅ **90 script files** properly organized by Roblox service
- ✅ **100+ visual assets** preserved and organized
- ✅ **30+ professional modules** ready for advanced features
- ✅ **6 complete maps** with varying difficulty levels
- ✅ **Complete service coverage** (all major Roblox services populated)

### Qualitative Results
- ✅ **Professional Structure**: Industry-standard Rojo organization
- ✅ **Development Ready**: All files have proper naming and extensions
- ✅ **Asset Integrity**: Visual components preserved for Studio import
- ✅ **Template Quality**: Comprehensive foundation for movement system development

### File Organization Quality
- ✅ **Service Separation**: Scripts properly divided by function
- ✅ **Naming Conventions**: Correct .server.lua, .client.lua, .lua extensions
- ✅ **Module Organization**: Complex modules with proper subdirectory structure
- ✅ **Asset Grouping**: Related assets grouped by functional area

## 🎯 Migration Impact

### For Development
1. **Clean Codebase**: Each script is a separate, editable file
2. **Version Control**: Full Git compatibility with meaningful diffs
3. **Collaboration**: Multiple developers can work on different systems
4. **Professional Workflow**: Industry-standard development practices

### For Assets
1. **Studio Integration**: All visual components sync to Roblox Studio
2. **Design Preservation**: Original model aesthetics maintained
3. **Modular Structure**: Assets organized by functional purpose
4. **Update Workflow**: Changes sync automatically during development

## ➡️ Next Step
Continue to [Final Cleanup](03-final-cleanup.md) to complete the migration process.