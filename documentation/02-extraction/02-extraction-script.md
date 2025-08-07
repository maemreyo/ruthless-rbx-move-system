# Step 2: Extraction Script Creation

## 🎯 Objective
Create a custom Remodel script to extract scripts and assets from RBXM/RBXMX files and organize them into Rojo project structure.

## 📝 Script Design Requirements

### Goals
1. Extract all scripts from model files
2. Preserve directory hierarchy  
3. Apply proper naming conventions (.server.lua, .client.lua, .lua)
4. Map instances to appropriate Rojo service directories
5. Handle both RBXM and RBXMX formats
6. Save non-script objects as .rbxmx files

### Challenges to Address
1. Script source may be empty/missing in model files
2. Complex directory mapping from model structure to Rojo services
3. File name sanitization for filesystem compatibility
4. Recursive processing of nested instances

## 🔧 Script Implementation

### Full Script: `extract-scripts.lua`

```lua
-- Remodel script to extract scripts and assets from RBXM/RBXMX files into Rojo project structure
-- Usage: ./remodel extract-scripts.lua <input-file.rbxm/rbxmx> [output-dir]

local args = {...}
if #args < 1 then
    print("Usage: remodel extract-scripts.lua <input-file.rbxm/rbxmx> [output-dir]")
    return
end

local inputFile = args[1]
local outputDir = args[2] or "extracted"

print("Loading model file: " .. inputFile)

-- Read the model file
local instances = remodel.readModelFile(inputFile)

if #instances == 0 then
    print("No instances found in the model file!")
    return
end

print("Found " .. #instances .. " top-level instances")

-- Helper function to get file extension for scripts
local function getScriptExtension(scriptType)
    if scriptType == "Script" then
        return ".server.lua"
    elseif scriptType == "LocalScript" then
        return ".client.lua"
    elseif scriptType == "ModuleScript" then
        return ".lua"
    else
        return ".lua"
    end
end

-- Helper function to sanitize file names
local function sanitizeFileName(name)
    return name:gsub("[^%w%-%_%. ]", "_"):gsub("%s+", "_")
end

-- Helper function to create directory path
local function ensureDir(path)
    remodel.createDirAll(path)
end

-- Recursive function to extract scripts from instances
local function extractScripts(instance, currentPath)
    local children = instance:GetChildren()
    
    for _, child in ipairs(children) do
        local childName = sanitizeFileName(child.Name)
        local childPath = currentPath .. "/" .. childName
        
        if child.ClassName == "Script" or child.ClassName == "LocalScript" or child.ClassName == "ModuleScript" then
            -- Extract script
            local scriptExt = getScriptExtension(child.ClassName)
            local scriptPath = childPath .. scriptExt
            
            ensureDir(currentPath)
            
            -- Check if Source property exists (it might not in some instances)
            local hasSource, source = pcall(function() return child.Source end)
            if hasSource and source and source ~= "" then
                print("  Extracting script: " .. scriptPath)
                remodel.writeFile(scriptPath, source)
            else
                print("  Warning: No source or empty script: " .. scriptPath)
                remodel.writeFile(scriptPath, "-- No source found for script: " .. child.Name)
            end
        elseif child.ClassName == "Folder" then
            -- Create directory and recurse
            ensureDir(childPath)
            extractScripts(child, childPath)
        else
            -- For other objects (Parts, Models, etc.), save as rbxmx
            if #child:GetChildren() > 0 then
                ensureDir(currentPath)
                local modelPath = childPath .. ".rbxmx"
                print("  Saving model: " .. modelPath)
                remodel.writeModelFile(modelPath, child)
            end
        end
        
        -- Recurse into children regardless of type
        if #child:GetChildren() > 0 then
            extractScripts(child, childPath)
        end
    end
end

-- Create output directory structure based on Rojo standards
local function setupRojoStructure()
    local rojoStructure = {
        "src/Lighting",
        "src/ReplicatedStorage/Maps",
        "src/ReplicatedStorage/Modules", 
        "src/ServerScriptService",
        "src/StarterPlayer/StarterCharacterScripts",
        "src/StarterPlayer/StarterPlayerScripts",
        "src/StarterGui",
        "src/Workspace/Ingame",
        "src/Workspace/Spawn",
        "src/Workspace/Teleports",
        "src/Workspace/Walls"
    }
    
    for _, dir in ipairs(rojoStructure) do
        ensureDir(outputDir .. "/" .. dir)
    end
end

-- Map instances to appropriate Rojo directories
local function mapInstanceToRojoPath(instance)
    local className = instance.ClassName
    local name = instance.Name
    
    -- Map based on common Roblox service patterns
    if name == "Lighting" or className == "Lighting" then
        return "src/Lighting"
    elseif name == "ReplicatedStorage" or className == "ReplicatedStorage" then
        return "src/ReplicatedStorage"
    elseif name == "ServerScriptService" or className == "ServerScriptService" then
        return "src/ServerScriptService"
    elseif name == "StarterPlayer" or className == "StarterPlayer" then
        return "src/StarterPlayer"
    elseif name == "StarterPlayerScripts" then
        return "src/StarterPlayer/StarterPlayerScripts"
    elseif name == "StarterCharacterScripts" then
        return "src/StarterPlayer/StarterCharacterScripts"
    elseif name == "StarterGui" or className == "StarterGui" then
        return "src/StarterGui"
    elseif name == "Workspace" or className == "Workspace" then
        return "src/Workspace"
    else
        -- Default to ReplicatedStorage for unknown instances
        return "src/ReplicatedStorage"
    end
end

-- Setup the Rojo directory structure
print("Setting up Rojo directory structure...")
setupRojoStructure()

-- Extract from all top-level instances
for i, instance in ipairs(instances) do
    local basePath = outputDir .. "/" .. mapInstanceToRojoPath(instance)
    print("Processing instance " .. i .. ": " .. instance.Name .. " (" .. instance.ClassName .. ")")
    print("  Mapping to: " .. basePath)
    
    -- Extract this instance
    extractScripts(instance, basePath)
end

print("\n✅ Extraction complete!")
print("Files extracted to: " .. outputDir)
print("\nNext steps:")
print("1. Review extracted files in '" .. outputDir .. "' directory")
print("2. Copy relevant files to your Rojo project 'src/' directory") 
print("3. Update your default.project.json if needed")
print("4. Run 'rojo serve' to sync with Roblox Studio")
```

## 🔍 Script Features

### Core Functions

#### 1. File Type Detection
```lua
local function getScriptExtension(scriptType)
    if scriptType == "Script" then
        return ".server.lua"
    elseif scriptType == "LocalScript" then
        return ".client.lua"
    elseif scriptType == "ModuleScript" then
        return ".lua"
    else
        return ".lua"
    end
end
```

#### 2. Safe Source Extraction
```lua
-- Check if Source property exists (it might not in some instances)
local hasSource, source = pcall(function() return child.Source end)
if hasSource and source and source ~= "" then
    print("  Extracting script: " .. scriptPath)
    remodel.writeFile(scriptPath, source)
else
    print("  Warning: No source or empty script: " .. scriptPath)
    remodel.writeFile(scriptPath, "-- No source found for script: " .. child.Name)
end
```

#### 3. Intelligent Directory Mapping
Maps Roblox instances to appropriate Rojo service directories based on name and class patterns.

#### 4. Asset Preservation
Non-script objects are saved as .rbxmx files to preserve visual/structural components.

## 🎯 Script Capabilities

### Input Support
- ✅ RBXM (binary) files
- ✅ RBXMX (XML) files
- ✅ Custom output directory
- ✅ Recursive processing

### Output Features
- ✅ Proper script file extensions
- ✅ Directory structure creation
- ✅ Asset preservation as .rbxmx
- ✅ Detailed logging
- ✅ Error handling

### Edge Case Handling
- ✅ Missing script source
- ✅ Invalid file names
- ✅ Nested folder structures
- ✅ Empty instances

## ➡️ Next Step
Continue to [Running Extraction](03-running-extraction.md) to execute the script on the model files.