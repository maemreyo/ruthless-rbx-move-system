# Step 3: Rojo Project Creation

## 🎯 Objective
Create the base Rojo project structure based on the Movement System requirements.

## 📋 Rojo Configuration

### default.project.json
The main Rojo configuration file was created to map directories to Roblox services:

```json
{
  "name": "MovementSystemProject",
  "tree": {
    "$className": "DataModel",

    "Lighting": {
      "$path": "src/Lighting"
    },

    "ReplicatedStorage": {
      "$path": "src/ReplicatedStorage"
    },

    "ServerScriptService": {
      "$path": "src/ServerScriptService"
    },

    "StarterPlayer": {
      "StarterCharacterScripts": {
        "$path": "src/StarterPlayer/StarterCharacterScripts"
      },
      "StarterPlayerScripts": {
        "$path": "src/StarterPlayer/StarterPlayerScripts"
      },
      "$path": "src/StarterPlayer"
    },

    "StarterGui": {
      "$path": "src/StarterGui"
    },

    "Workspace": {
      "$path": "src/Workspace"
    }
  }
}
```

## 📁 Directory Structure Creation

### Command Used
```bash
mkdir -p src/{Lighting,ReplicatedStorage/{Maps,Modules},ServerScriptService,StarterPlayer/{StarterCharacterScripts,StarterPlayerScripts},StarterGui,Workspace/{Ingame,Spawn,Teleports,Walls}}
```

### Created Structure
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

## 📝 Placeholder Files Created

Initial placeholder script files were created with proper naming:

### ServerScriptService
- `Ragdoll.server.lua`
- `leaderstats.server.lua`

### StarterCharacterScripts  
- `Animate.client.lua`
- `CamController.client.lua`
- `CameraBobble.client.lua`
- `CustomCameraSystemV2.client.lua`
- `FOVLock.client.lua`
- `LedgeGrab.client.lua`
- `Slide.client.lua`

### StarterPlayerScripts
- `LocalScript.client.lua`
- `WindController.client.lua`

### Workspace
- `Script.server.lua`
- `ShiftLock.server.lua`

### Placeholder Content Example
```lua
-- Ragdoll script placeholder
-- Add your ragdoll system logic here
```

## 🎯 Key Features

1. **Service Mapping**: Each Roblox service properly mapped to filesystem
2. **Nested Structure**: StarterPlayer correctly handles both character and player scripts
3. **Asset Directories**: Separate folders for different types of workspace objects
4. **Naming Conventions**: All script files follow Rojo conventions

## 📋 Configuration Benefits

- **Hot Reloading**: Changes sync instantly to Studio
- **Version Control**: Each script is a separate file
- **Collaboration**: Multiple developers can work on different scripts
- **Professional Structure**: Industry-standard organization

## ✅ Verification

After creation, the structure was verified:
```bash
tree src
```

Result: Complete directory tree matching the planned structure.

## 🔄 Rojo Integration

This structure is now ready for:
1. `rojo serve` - Start development server
2. Roblox Studio plugin connection
3. Real-time synchronization
4. Professional development workflow

## ➡️ Next Step
Continue to [Remodel Installation](../02-extraction/01-remodel-installation.md) to begin script extraction.