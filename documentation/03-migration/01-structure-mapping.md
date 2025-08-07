# Step 1: Structure Mapping Analysis

## 🎯 Objective
Analyze extracted files and map them to the proper Rojo project structure we created earlier.

## 🔍 Extracted Structure Analysis

### Current State
After extraction, files are organized under temporary extracted/ directory with Roblox service naming:
```
extracted/src/ReplicatedStorage/
├── Put_in_WorkSpace/              # → Workspace
├── Put_in_Lighting/               # → Lighting  
├── Put_in_Replicated_Storage/     # → ReplicatedStorage
├── Put_in_ServerScript_Servis/    # → ServerScriptService
├── Put_in_StarterPlayerScripts/   # → StarterPlayer/StarterPlayerScripts
└── Put_in_StarterCharacterScripts/ # → StarterPlayer/StarterCharacterScripts
```

### Target Structure
Our established Rojo project structure:
```
src/
├── Lighting/
├── ReplicatedStorage/
│   ├── Maps/
│   └── Modules/
├── ServerScriptService/
├── StarterGui/
├── StarterPlayer/
│   ├── StarterCharacterScripts/
│   └── StarterPlayerScripts/
└── Workspace/
    ├── Ingame/
    ├── Spawn/
    ├── Teleports/
    └── Walls/
```

## 🗺️ Mapping Strategy

### 1. Script Files Mapping

#### ServerScriptService Scripts
**Source**: `extracted/src/ReplicatedStorage/Put_in_ServerScript_Servis/`
**Target**: `src/ServerScriptService/`
**Files**:
- `leaderstats.server.lua`
- `Ragdoll.server.lua`

#### StarterCharacterScripts  
**Source**: `extracted/src/ReplicatedStorage/Put_in_StarterCharacterScripts/`
**Target**: `src/StarterPlayer/StarterCharacterScripts/`
**Files**:
- `Animate.client.lua`
- `CamController.client.lua`  
- `CameraBobble.client.lua`
- `CustomCameraSystemV2.client.lua`
- `FOVLock.client.lua`
- `LedgeGrab.client.lua`
- `Slide.client.lua`

#### StarterPlayerScripts
**Source**: `extracted/src/ReplicatedStorage/Put_in_StarterPlayerScripts/`  
**Target**: `src/StarterPlayer/StarterPlayerScripts/`
**Files**:
- `LocalScript.client.lua`
- `WindController.client.lua`
- `WindController/` (module directory)

#### Workspace Scripts
**Source**: `extracted/src/ReplicatedStorage/Put_in_WorkSpace/`
**Target**: `src/Workspace/`
**Files**:
- `Script.server.lua`
- `ShiftLock.server.lua`

### 2. Module Files Mapping

#### ReplicatedStorage Modules
**Source**: `extracted/src/ReplicatedStorage/Put_in_Replicated_Storage/Modules/`
**Target**: `src/ReplicatedStorage/Modules/`
**Contents**: 30+ professional modules including:
- CameraShaker system
- FastCastRedux projectile system
- RaycastHitboxV4 combat system
- Zone detection system
- PartCache optimization
- Lightning and crater effects
- Mouse utilities
- And many more...

#### Maps Collection
**Source**: `extracted/src/ReplicatedStorage/Put_in_Replicated_Storage/Maps/`  
**Target**: `src/ReplicatedStorage/Maps/`
**Contents**: 6 difficulty levels:
- Level - Easy
- Level - Simple  
- Level - Mild
- Level - Intermediate
- Level - Challenging
- Level - Casual

### 3. Asset Files Mapping

#### Lighting Effects
**Source**: `extracted/src/ReplicatedStorage/Put_in_Lighting.rbxmx`
**Target**: `src/Lighting/Put_in_Lighting.rbxmx`

#### Workspace Assets  
**Source**: `extracted/src/ReplicatedStorage/Put_in_WorkSpace/`
**Target**: `src/Workspace/` (respective subdirectories)
**Files**:
- `Spawn.rbxmx` → `src/Workspace/Spawn/`
- `Teleports.rbxmx` → `src/Workspace/Teleports/`  
- `Walls.rbxmx` → `src/Workspace/Walls/`

## 📋 Migration Plan

### Phase 1: Core Scripts
1. Move ServerScriptService scripts
2. Move StarterCharacterScripts  
3. Move StarterPlayerScripts (including WindController modules)
4. Move Workspace scripts

### Phase 2: Modules and Content
1. Copy all ReplicatedStorage modules
2. Copy all Maps with their script components
3. Move Lighting assets
4. Move Workspace assets to appropriate subdirectories

### Phase 3: Cleanup
1. Remove placeholder .gitkeep files
2. Remove temporary extraction directories
3. Verify final structure

## 🎯 Key Considerations

### File Overwrites
- **Expected**: Our placeholder files will be replaced with extracted versions
- **Benefit**: Maintains proper naming while adding extracted structure

### Script Content
- **Reality**: Scripts contain placeholders ("No source found")
- **Advantage**: Clean development templates with proper structure
- **Next Step**: Implement actual game logic in these template files

### Asset Preservation
- **Visual Components**: All .rbxmx files preserve original visual design
- **Structure**: Directory hierarchy matches original model organization
- **Compatibility**: Files ready for Rojo sync to Studio

## 📊 Expected Results

### Script Files
- **Total**: 90+ Lua files properly organized by service
- **Naming**: Correct extensions (.server.lua, .client.lua, .lua)
- **Structure**: Professional Rojo project organization

### Asset Files  
- **Total**: 100+ .rbxmx files for visual components
- **Organization**: Grouped by function (Maps, Modules, Workspace areas)
- **Preservation**: All original design elements maintained

## ➡️ Next Step
Continue to [File Migration](02-file-migration.md) to execute the mapping plan.