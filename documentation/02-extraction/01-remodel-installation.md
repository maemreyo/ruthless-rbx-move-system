# Step 1: Remodel Installation

## 🎯 Objective
Install Remodel, the scriptable Roblox multitool for extracting scripts and assets from RBXM/RBXMX files.

## 🔍 Tool Research

### Research Process
Multiple tools were evaluated for RBXM/RBXMX extraction:

1. **Remodel** (Official Rojo Tool) ⭐ **CHOSEN**
   - Most popular for RBXM/RBXMX manipulation  
   - Scriptable Lua API for custom workflows
   - Official Rojo ecosystem tool
   - Best support for both binary and XML formats

2. **rbxlx-to-rojo** (Official)
   - Direct conversion from place files (.rbxl/.rbxlx)
   - Not suitable for model files (.rbxm/.rbxmx)

3. **rbx-export** (Community)
   - Simple tool but less comprehensive
   - Limited customization options

### Why Remodel?
- **Proven Solution**: Industry standard in Rojo workflows
- **Flexible API**: Custom Lua scripts for specific needs
- **Format Support**: Handles both RBXM (binary) and RBXMX (XML)
- **Active Development**: Regularly updated by Rojo team

## 📦 Installation Process

### Step 1: Get Download URL
```bash
curl -s https://api.github.com/repos/rojo-rbx/remodel/releases/latest | grep "browser_download_url.*macos" | head -1 | cut -d '"' -f 4
```

**Result**: `https://github.com/rojo-rbx/remodel/releases/download/v0.11.0/remodel-0.11.0-macos-aarch64.zip`

### Step 2: Download and Install
```bash
curl -L -o remodel.zip "https://github.com/rojo-rbx/remodel/releases/download/v0.11.0/remodel-0.11.0-macos-aarch64.zip" && unzip -q remodel.zip && chmod +x remodel && rm remodel.zip
```

**Process**:
1. Downloads the latest macOS ARM64 version
2. Extracts the binary
3. Makes it executable  
4. Cleans up the zip file

### Step 3: Verify Installation
```bash
./remodel --help
```

## 🛠️ Remodel Capabilities

### Key Functions
- `remodel.readModelFile(path)` - Load RBXM/RBXMX files
- `remodel.writeModelFile(path, instance)` - Save model files
- `remodel.writeFile(path, content)` - Write text files
- `remodel.createDirAll(path)` - Create directories

### Supported Formats
- ✅ **RBXMX (XML)**: Excellent support, all features available
- ⚠️ **RBXM (Binary)**: Early support, some limitations but functional

### Use Cases
- Extract scripts from model files
- Convert between RBXM and RBXMX formats
- Automate model processing workflows
- Break down place files into components

## 📋 Installation Alternatives

### Option 1: Foreman (Package Manager)
```toml
[tools]
remodel = { source = "rojo-rbx/remodel", version = "0.11.0" }
```

### Option 2: Manual Download
1. Visit: https://github.com/rojo-rbx/remodel/releases
2. Download platform-specific binary
3. Extract and add to PATH

### Option 3: Build from Source
Requires Rust 1.56.0 or newer:
```bash
git clone https://github.com/rojo-rbx/remodel.git
cd remodel
cargo build --release
```

## ✅ Verification

After installation, verify Remodel is working:
```bash
./remodel --version
```

Expected output: `remodel 0.11.0` (or current version)

## 🔧 Platform Support

- ✅ **macOS**: ARM64 and Intel versions available
- ✅ **Windows**: x64 version available  
- ✅ **Linux**: x64 version available

## ➡️ Next Step
Continue to [Extraction Script Creation](02-extraction-script.md) to create the custom extraction script.