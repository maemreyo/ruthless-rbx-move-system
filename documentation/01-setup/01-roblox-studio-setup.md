# Step 1: Roblox Studio Setup and Model Acquisition

## 🎯 Objective
Obtain the Movement System model from Roblox Creator Hub and prepare it for extraction.

## 📋 Prerequisites
- Roblox Studio installed
- Roblox account with access to Creator Hub

## 🔧 Process

### 1.1 Access Creator Hub
1. Open Roblox Studio
2. Navigate to the **Creator Hub** or **Toolbox**
3. Search for "Movement System By LettuceDev"
4. Add the model to your inventory

### 1.2 Insert Model into Studio
1. Create a new place in Roblox Studio
2. Insert the "Movement System By LettuceDev" model
3. The model will appear in your Workspace

### 1.3 Analyze Model Structure
1. Expand the model in the Explorer window
2. Take screenshots of the structure for analysis
3. Note the different components:
   - Scripts and LocalScripts
   - Models and Parts
   - Folders and organization

### 1.4 Export Model Files
Export the model in both formats for maximum compatibility:

#### Export as RBXM (Binary)
1. Right-click on the model in Studio
2. Select "Save to File..."
3. Choose "Roblox Model Files (*.rbxm)"
4. Save as `movement-system.rbxm`

#### Export as RBXMX (XML) 
1. Right-click on the model in Studio
2. Select "Save to File..."
3. Choose "Roblox Model XML Files (*.rbxmx)"
4. Save as `movement-system-xml.rbxmx`

## 📸 Analysis Phase (Gemini AI)

### 1.5 Generate Structure Analysis
1. Take clear screenshots of the model structure in Studio Explorer
2. Upload screenshots to Gemini AI
3. Ask Gemini to analyze the structure and create a Rojo mapping guide

**Prompt used for Gemini:**
```
Please analyze this Roblox model structure from the screenshot and create a guide 
for mapping it to a Rojo project structure. Include the proper directory layout 
and file naming conventions for each service (ServerScriptService, StarterPlayer, 
ReplicatedStorage, etc.).
```

### 1.6 Review Generated Guide
Gemini generated the comprehensive `guide.md` file that includes:
- Service-by-service breakdown
- File naming conventions (.server.lua, .client.lua, .lua)
- Directory structure for Rojo
- Asset organization guidelines

## 📁 Files Created
- `samples/movement-system.rbxm` - Binary model file
- `samples/movement-system-xml.rbxmx` - XML model file  
- `guide.md` - Structure analysis by Gemini

## ➡️ Next Step
Continue to [Initial Analysis](02-initial-analysis.md) to understand the model contents.