-- Template Generator for Ruthless Movement System
-- Creates customized project configurations based on game type and feature selection

local TemplateGenerator = {}

-- Module categories for selective inclusion
local MODULES = {
    universal = {
        "CameraShaker",
        "Janitor", 
        "Signal",
        "Zone"
    },
    
    movement = {
        "BezierTweens",
        "PartCache"
    },
    
    combat = {
        "FastCastRedux",
        "RaycastHitboxV4"
    },
    
    effects = {
        "LightningBolt",
        "CraterEffects"
    },
    
    utilities = {
        "Mouse2",
        "Misc"
    }
}

-- Character scripts for different game types  
local CHARACTER_SCRIPTS = {
    parkour = {
        "Slide",
        "LedgeGrab",
        "CameraBobble.client.lua",
        "FOVLock.client.lua", 
        "CamController.client.lua"
    },
    
    combat = {
        "CamController.client.lua",
        "CameraBobble.client.lua",
        "FOVLock.client.lua"
    },
    
    shooter = {
        "CamController.client.lua", 
        "CustomCameraSystemV2",
        "FOVLock.client.lua"
    },
    
    adventure = {
        "Slide",
        "LedgeGrab",
        "CameraBobble.client.lua",
        "CamController.client.lua"
    },
    
    racing = {
        "Slide", 
        "CameraBobble.client.lua",
        "FOVLock.client.lua",
        "CamController.client.lua"
    }
}

-- Player scripts for different game types
local PLAYER_SCRIPTS = {
    parkour = {
        "WindController",
        "LocalScript"
    },
    
    combat = {
        "LocalScript"
    },
    
    shooter = {
        "LocalScript"
    },
    
    adventure = {
        "WindController",
        "LocalScript" 
    },
    
    racing = {
        "WindController",
        "LocalScript"
    }
}

-- Template configurations
local TEMPLATES = {
    parkour = {
        name = "ParkourGameTemplate",
        modules = {"universal", "movement", "effects"},
        utilization = 100,
        description = "Complete parkour game with all movement systems"
    },
    
    combat = {
        name = "CombatArenaTemplate", 
        modules = {"universal", "combat", "effects"},
        utilization = 90,
        description = "PvP combat arena with hitbox systems"
    },
    
    shooter = {
        name = "MovementShooterTemplate",
        modules = {"universal", "combat", "movement"},
        utilization = 85,
        description = "Movement-based shooter with projectile physics"
    },
    
    adventure = {
        name = "AdventureGameTemplate",
        modules = {"universal", "movement", "effects"},
        utilization = 70,
        description = "Exploration game with movement and environmental effects"
    },
    
    racing = {
        name = "RacingGameTemplate",
        modules = {"universal", "movement"},
        utilization = 65,
        description = "Racing game with advanced movement physics"
    }
}

function TemplateGenerator.generateTemplate(gameType, customModules)
    local template = TEMPLATES[gameType]
    if not template then
        error("Unknown game type: " .. tostring(gameType))
    end
    
    -- Build module list
    local moduleList = {}
    for _, category in ipairs(template.modules) do
        for _, module in ipairs(MODULES[category]) do
            table.insert(moduleList, module)
        end
    end
    
    -- Add custom modules if specified
    if customModules then
        for _, module in ipairs(customModules) do
            table.insert(moduleList, module)
        end
    end
    
    -- Generate project.json structure
    local projectConfig = {
        name = template.name,
        tree = {
            ["$className"] = "DataModel",
            
            Lighting = {
                ["$path"] = "src/Lighting"
            },
            
            ReplicatedStorage = {
                Modules = {
                    ["$path"] = "src/ReplicatedStorage/Modules",
                    ["$include"] = moduleList
                },
                Maps = {
                    ["$path"] = "src/ReplicatedStorage/Maps"
                }
            },
            
            ServerScriptService = {
                ["$path"] = "src/ServerScriptService",
                ["$include"] = {
                    "leaderstats.server.lua"
                }
            },
            
            StarterPlayer = {
                StarterCharacterScripts = {
                    ["$path"] = "src/StarterPlayer/StarterCharacterScripts", 
                    ["$include"] = CHARACTER_SCRIPTS[gameType]
                },
                StarterCharacter = {
                    ["$path"] = "src/StarterPlayer/StarterCharacter"
                },
                StarterPlayerScripts = {
                    ["$path"] = "src/StarterPlayer/StarterPlayerScripts",
                    ["$include"] = PLAYER_SCRIPTS[gameType]
                }
            },
            
            StarterGui = {
                ["$path"] = "src/StarterGui"
            },
            
            Workspace = {
                ["$path"] = "src/Workspace"
            }
        }
    }
    
    return projectConfig
end

function TemplateGenerator.getTemplateInfo(gameType)
    return TEMPLATES[gameType]
end

function TemplateGenerator.listAvailableTemplates()
    local templates = {}
    for gameType, info in pairs(TEMPLATES) do
        table.insert(templates, {
            type = gameType,
            name = info.name,
            utilization = info.utilization,
            description = info.description
        })
    end
    return templates
end

function TemplateGenerator.getModuleCategories()
    return MODULES
end

-- CLI-style interface for interactive template creation
function TemplateGenerator.interactiveCreate()
    print("🎮 Ruthless Movement System - Template Generator")
    print("=" .. string.rep("=", 50))
    
    -- Display available templates
    print("\nAvailable Templates:")
    local templates = TemplateGenerator.listAvailableTemplates()
    for i, template in ipairs(templates) do
        print(string.format("%d. %s (%d%% utilization)", 
            i, template.description, template.utilization))
    end
    
    print("\nChoose template type:")
    print("1. Parkour Game (100% features)")
    print("2. Combat Arena (90% features)")  
    print("3. Movement Shooter (85% features)")
    print("4. Adventure Game (70% features)")
    print("5. Racing Game (65% features)")
    
    -- This would be interactive in a real CLI tool
    return "Select 1-5 to generate template configuration"
end

return TemplateGenerator