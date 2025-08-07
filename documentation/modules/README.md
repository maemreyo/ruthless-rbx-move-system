# Module Documentation Overview

This directory contains detailed documentation for all 52+ professional modules in the codebase.

## 📊 Module Categories & Recommendations

### 🌟 **Universal Modules** (Use in Any Game)
| Module | Quality | Priority | Purpose |
|--------|---------|----------|---------|
| **CameraShaker** | 10/10 | MUST USE | Camera feedback effects |
| **Janitor** | 10/10 | MUST USE | Memory management |
| **Signal** | 9/10 | ESSENTIAL | Custom events |
| **Zone** | 8/10 | HIGH | Area detection |
| **PartCache** | 9/10 | HIGH | Performance optimization |

### 🎯 **Action Game Modules**
| Module | Quality | Priority | Purpose |
|--------|---------|----------|---------|
| **FastCastRedux** | 9/10 | ESSENTIAL | Projectile systems |
| **RaycastHitboxV4** | 9/10 | ESSENTIAL | Melee combat |
| **LightningBolt** | 8/10 | MEDIUM | Visual effects |
| **BezierTweens** | 8/10 | MEDIUM | Smooth animations |

### 🏃 **Movement Specific**
| Module | Quality | Priority | Purpose |
|--------|---------|----------|---------|
| **Mouse2** | 7/10 | MEDIUM | Enhanced mouse utilities |
| **SystemCursors** | 6/10 | LOW | Custom cursor system |

## 🎯 **Usage Recommendations by Game Type**

### ⭐ **Parkour/Movement Games** - Use Everything
- **Essential**: CameraShaker, Janitor, Signal, Zone
- **Movement**: All character scripts + wind system
- **Polish**: BezierTweens, LightningBolt

### ⚔️ **Combat Games** - Action Focus
- **Core**: CameraShaker, Janitor, Signal, PartCache
- **Combat**: FastCastRedux, RaycastHitboxV4
- **Effects**: LightningBolt, BezierTweens

### 🏠 **Casual/Social Games** - Minimal Set
- **Essential**: Janitor, Signal
- **Optional**: CameraShaker for feedback
- **Skip**: Combat and movement modules

### 🏗️ **Simulation/Building** - Utility Focus  
- **Core**: Janitor, Signal, Zone
- **Performance**: PartCache (if creating many objects)
- **Skip**: Combat and movement modules

## 📈 **Module Quality Tiers**

### 🏆 **Tier 1: Industry Standard** (Use First)
- CameraShaker - Essential game juice
- Janitor - Prevents memory leaks
- FastCastRedux - Standard projectile system
- RaycastHitboxV4 - Standard melee system

### 🥇 **Tier 2: Professional Quality** (High Value)
- Signal - Custom events
- PartCache - Performance boost
- Zone - Advanced area detection
- BezierTweens - Smooth animations

### 🥈 **Tier 3: Specialized Tools** (Situational)
- LightningBolt - Visual effects
- Mouse2 - Enhanced mouse utilities
- Various utility modules

## 🔍 **Quick Selection Guide**

**Building a new game?** Start with:
1. **Janitor** - Essential memory management
2. **Signal** - For custom events
3. **CameraShaker** - For game feedback
4. Add others based on your game type

**Need combat?** Add:
- **RaycastHitboxV4** for melee
- **FastCastRedux** for ranged
- **PartCache** for effects

**Want polish?** Include:
- **BezierTweens** for animations
- **LightningBolt** for effects
- **Zone** for triggers

## 📚 **Learning Path**

### Beginner (Start Here)
1. **Signal** - Understand custom events
2. **Janitor** - Learn memory management
3. **CameraShaker** - Add game juice

### Intermediate
1. **Zone** - Area detection systems
2. **PartCache** - Performance optimization
3. **BezierTweens** - Animation polish

### Advanced
1. **FastCastRedux** - Complex projectile systems
2. **RaycastHitboxV4** - Advanced combat
3. **Custom module creation** using these patterns

---

## 📁 Individual Module Files

Each module has detailed documentation including:
- Purpose and use cases
- Code examples
- Quality assessment
- Reusability rating  
- Dependencies
- Recommendations

Browse the individual `.md` files for complete module documentation.