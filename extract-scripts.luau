-- Lune script to extract scripts and assets from RBXM/RBXMX files into Rojo project structure
-- Usage: lune run extract-scripts <input-file.rbxm/rbxmx> [output-dir]

local fs = require("@lune/fs")
local roblox = require("@lune/roblox")
local process = require("@lune/process")

local args = process.args
if #args < 1 then
    print("Usage: lune run extract-scripts <input-file.rbxm/rbxmx> [output-dir]")
    return
end

local inputFile = args[1]
local outputDir = args[2] or "extracted"

print("Loading model file: " .. inputFile)

-- Read the model file
local fileContents = fs.readFile(inputFile)
local instances = roblox.deserializeModel(fileContents)

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

-- Helper function to check if a class should be saved as rbxmx
local function shouldSaveAsRbxmx(className)
    local rbxmxClasses = {
        "Part", "Texture", "TextLabel", "ScreenGui", "Decal", "Attachment", 
        "Motor6D", "Animator", "HumanoidDescription", "Humanoid", 
        "BodyPartDescription", "BodyColor", "Shirt", "Pants", "SpecialMesh", 
        "KeyframeSequence", "Keyframe", "Pose", "Highlight", "BoolValue", 
        "ObjectValue", "ParticleEmitter", "StringValue", "NumberValue", 
        "BindableFunction", "Sound", "SpawnLocation", "Weld", "Sky", 
        "Atmosphere", "Model"
    }
    
    -- Check for classes ending with "Effect"
    if className:match("Effect$") then
        return true
    end
    
    -- Check if className is in the list
    for _, class in ipairs(rbxmxClasses) do
        if className == class then
            return true
        end
    end
    
    return false
end

-- Helper function to check if a ModuleScript has nested children (should use barrier pattern)
local function moduleHasNestedChildren(instance)
    local children = instance:GetChildren()
    for _, child in ipairs(children) do
        if child.ClassName == "ModuleScript" or child.ClassName == "Script" or child.ClassName == "LocalScript" then
            return true
        end
    end
    return false
end

-- Helper function to sanitize file names
local function sanitizeFileName(name)
    return name:gsub("[^%w%-%_%. ]", "_"):gsub("%s+", "_")
end

-- Helper function to create directory path
local function ensureDir(path)
    if not fs.isDir(path) then
        fs.writeDir(path)
    end
end

-- Recursive function to extract scripts from instances
local function extractScripts(instance, currentPath)
    local children = instance:GetChildren()
    
    for _, child in ipairs(children) do
        local childName = sanitizeFileName(child.Name)
        local childPath = currentPath .. "/" .. childName
        
        if child.ClassName == "Model" then
            -- Rule 1: Model -> convert all items inside to individual rbxmx files
            print("  Processing Model: " .. child.Name)
            ensureDir(currentPath)
            local modelPath = childPath .. ".rbxmx"
            print("  Saving model: " .. modelPath)
            local serializedModel = roblox.serializeModel({child})
            fs.writeFile(modelPath, serializedModel)
            
            -- Also recurse into children to extract any scripts inside
            extractScripts(child, childPath)
            
        elseif child.ClassName == "Folder" then
            -- Rule 2: Folder -> find all items inside to process further
            print("  Processing Folder: " .. child.Name)
            ensureDir(childPath)
            extractScripts(child, childPath)
            
        elseif child.ClassName == "ModuleScript" then
            if moduleHasNestedChildren(child) then
                -- Rule 4: ModuleScript with nested children -> use barrier pattern
                print("  Processing ModuleScript with children (barrier pattern): " .. child.Name)
                ensureDir(childPath)
                
                -- Create init.lua for the main module
                local initPath = childPath .. "/init.lua"
                local hasSource, source = pcall(function() return child.Source end)
                if hasSource and source and source ~= "" then
                    print("    Creating init.lua: " .. initPath)
                    fs.writeFile(initPath, source)
                else
                    print("    Warning: No source for ModuleScript: " .. child.Name)
                    fs.writeFile(initPath, "-- No source found for ModuleScript: " .. child.Name)
                end
                
                -- Process children
                extractScripts(child, childPath)
            else
                -- Rule 3: Single ModuleScript -> convert to script.lua
                print("  Processing single ModuleScript: " .. child.Name)
                local scriptPath = childPath .. ".lua"
                ensureDir(currentPath)
                
                local hasSource, source = pcall(function() return child.Source end)
                if hasSource and source and source ~= "" then
                    print("    Extracting ModuleScript: " .. scriptPath)
                    fs.writeFile(scriptPath, source)
                else
                    print("    Warning: No source for ModuleScript: " .. child.Name)
                    fs.writeFile(scriptPath, "-- No source found for ModuleScript: " .. child.Name)
                end
            end
            
        elseif child.ClassName == "Script" or child.ClassName == "LocalScript" then
            -- Rule 6: Single Script/LocalScript -> convert to script.lua
            print("  Processing " .. child.ClassName .. ": " .. child.Name)
            local scriptExt = getScriptExtension(child.ClassName)
            local scriptPath = childPath .. scriptExt
            ensureDir(currentPath)
            
            local hasSource, source = pcall(function() return child.Source end)
            if hasSource and source and source ~= "" then
                print("    Extracting script: " .. scriptPath)
                fs.writeFile(scriptPath, source)
            else
                print("    Warning: No source for script: " .. child.Name)
                fs.writeFile(scriptPath, "-- No source found for script: " .. child.Name)
            end
            
            -- Also process any children (rare but possible)
            if #child:GetChildren() > 0 then
                extractScripts(child, childPath)
            end
            
        elseif shouldSaveAsRbxmx(child.ClassName) then
            -- Rule 5: Specific classes -> convert to rbxmx file
            print("  Processing " .. child.ClassName .. " as rbxmx: " .. child.Name)
            ensureDir(currentPath)
            local modelPath = childPath .. ".rbxmx"
            print("    Saving as rbxmx: " .. modelPath)
            local serializedModel = roblox.serializeModel({child})
            fs.writeFile(modelPath, serializedModel)
            
            -- Also recurse into children if they exist
            if #child:GetChildren() > 0 then
                extractScripts(child, childPath)
            end
            
        else
            -- Default case: save as rbxmx and recurse
            print("  Processing unknown class " .. child.ClassName .. ": " .. child.Name)
            if #child:GetChildren() > 0 then
                ensureDir(currentPath)
                local modelPath = childPath .. ".rbxmx"
                print("    Saving unknown class as rbxmx: " .. modelPath)
                local serializedModel = roblox.serializeModel({child})
                fs.writeFile(modelPath, serializedModel)
                extractScripts(child, childPath)
            end
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