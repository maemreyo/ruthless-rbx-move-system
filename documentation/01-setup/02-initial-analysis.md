# Step 2: Initial Analysis and Requirements

## 🎯 Objective
Analyze the Gemini-generated guide and understand the model structure for proper Rojo mapping.

## 📋 Generated Structure Analysis (from guide.md)

### Model Components Identified:

#### Lighting Objects
- Atmosphere
- Sky  
- Bloom
- ColorCorrection
- DepthOfField
- GUIBlur
- SunRays

#### ReplicatedStorage
- Maps (Folder)
- Modules (Folder)
- Stat (Value)

#### ServerScriptService  
- Ragdoll (Script)
- leaderstats (Script)

#### StarterCharacterScripts
- Animate (LocalScript)
- CamController (LocalScript)
- CameraBobble (LocalScript)
- CustomCameraSystemV2 (LocalScript)
- FOVLock (LocalScript)
- LedgeGrab (LocalScript)
- Slide (LocalScript)

#### StarterPlayerScripts
- LocalScript (LocalScript)
- WindController (LocalScript)

#### StarterGui
- Map Select (ScreenGui)

#### Workspace
- Ingame (Folder)
- Script (Script)
- ShiftLock (Script)
- Stat (Value)
- Spawn (Folder)
- Teleports (Folder)
- Walls (Folder)

## 🗺️ Rojo Project Structure Design

Based on the analysis, the following directory structure was planned:

```
src/
├── Lighting/                    # Lighting effects
├── ReplicatedStorage/
│   ├── Maps/                   # Game maps
│   └── Modules/                # Shared modules
├── ServerScriptService/        # Server-side scripts
├── StarterGui/                 # GUI elements
├── StarterPlayer/
│   ├── StarterCharacterScripts/ # Character-specific scripts
│   └── StarterPlayerScripts/    # Player-specific scripts
└── Workspace/                  # Game world objects
    ├── Ingame/
    ├── Spawn/
    ├── Teleports/
    └── Walls/
```

## 📝 File Naming Conventions

According to the guide:
- **Script** → `.server.lua`
- **LocalScript** → `.client.lua`  
- **ModuleScript** → `.lua`
- **Models/Parts/GUI** → `.rbxmx` or `.rbxm`

## 🎯 Key Insights

1. **Movement System Focus**: This is a comprehensive movement system with camera controls, sliding, ledge grabbing, and advanced features
2. **Multiple Maps**: Contains different difficulty levels for testing
3. **Rich Module Library**: Includes many popular Roblox modules (CameraShaker, FastCast, etc.)
4. **Complete Lighting Setup**: Professional lighting configuration included
5. **GUI System**: Map selection interface provided

## 📋 Requirements for Extraction

Based on this analysis, we need:
1. Tool to extract scripts from RBXM/RBXMX files
2. Automated way to organize files into Rojo structure
3. Preserve both scripts (for development) and assets (for visual components)
4. Maintain proper file naming conventions

## 🔍 Challenges Identified

1. **Script Source Extraction**: RBXM/RBXMX files may not contain actual script source code
2. **Complex Directory Mapping**: Need intelligent mapping from model structure to Rojo services
3. **Asset Preservation**: Visual components need to be preserved while scripts are extracted
4. **Naming Conflicts**: Multiple files with same names in different locations

## ➡️ Next Step
Continue to [Rojo Project Creation](03-rojo-project-creation.md) to set up the base project structure.