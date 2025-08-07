# Movement System Project
A complete Roblox movement system with professional modules, extracted from a movement system by LettuceDev.

## 🎯 Project Overview
This project contains a complete movement system with:
- **E-key sliding system** with physics and particles
- **Ledge grabbing/climbing** with Space bar controls
- **Advanced camera effects** (shake, bobble, FOV management)
- **Professional module library** (CameraShaker, FastCastRedux, RaycastHitboxV4, etc.)
- **Interactive wind system** with GUI controls
- **Complete character animation system** (586 lines)

## 🚀 Quick Start
To build the place from scratch:

```bash
rojo build -o "ruthless-temp.rbxlx"
```

Next, open `ruthless-temp.rbxlx` in Roblox Studio and start the Rojo server:

```bash
rojo serve
```

## 📊 Project Statistics
- **108 working script files** with real implementations
- **50+ professional modules** from top Roblox developers
- **Complete movement systems** ready for gameplay
- **Fully organized Rojo structure** for development

## 🎮 Available Features
### Movement Systems
- **Slide**: E-key triggered sliding with velocity physics
- **LedgeGrab**: Space bar ledge climbing system  
- **CameraBobble**: Realistic walking camera effects
- **FOVLock**: Field of view management
- **CustomCameraSystemV2**: Alt+click target locking

### Professional Modules
- **CameraShaker**: Industry-standard camera shake effects by Stephen Leitnick
- **FastCastRedux**: High-performance projectile/bullet system
- **RaycastHitboxV4**: Advanced combat hitbox detection  
- **Zone**: Sophisticated area detection and management
- **WindLines**: Environmental wind effects with particles

## 📁 Project Structure
```
src/
├── ServerScriptService/      # Server scripts (leaderstats, ragdoll)
├── StarterPlayer/
│   ├── StarterCharacterScripts/  # Movement scripts (7 files)
│   └── StarterPlayerScripts/     # Client systems & wind controller
├── ReplicatedStorage/
│   ├── Modules/             # 50+ professional modules
│   └── Maps/                # 6 difficulty levels
└── Workspace/               # Core game mechanics
```

## 🛠️ Extraction Workflow
This project was created using a custom Python RBXMX extractor that successfully extracted real script implementations from model files, unlike traditional tools that only create empty placeholders.

For detailed extraction documentation, see: `documentation/README.md`

## 📚 Documentation
- **Setup Guide**: `documentation/01-setup/`
- **Extraction Process**: `documentation/02-extraction/`  
- **Migration Results**: `documentation/03-migration/`
- **Python Extractor Tool**: `documentation/scripts/rbxmx-script-extractor.py`

## 🎯 Development Ready
Start developing immediately with:
- Complete working movement systems
- Professional-grade code examples
- Modular, reusable components
- Performance-optimized implementations

For more help, check out [the Rojo documentation](https://rojo.space/docs).