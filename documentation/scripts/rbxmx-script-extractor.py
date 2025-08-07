#!/usr/bin/env python3
"""
RBXMX Script Extractor - Extracts actual script source code from RBXMX files
This tool properly parses ProtectedString elements to extract real script source code

Created as an improved solution over Remodel for RBXMX model file extraction.
Successfully extracts actual working script implementations vs empty placeholders.
"""

import xml.etree.ElementTree as ET
import os
import re
import sys
from pathlib import Path

def sanitize_filename(name):
    """Sanitize filename for filesystem compatibility"""
    return re.sub(r'[^\w\-_. ]', '_', name).replace(' ', '_')

def get_script_extension(class_name):
    """Get proper file extension based on script type"""
    if class_name == "Script":
        return ".server.lua"
    elif class_name == "LocalScript":
        return ".client.lua"
    elif class_name == "ModuleScript":
        return ".lua"
    else:
        return ".lua"

def extract_scripts_from_item(item, current_path="", extracted_scripts=None):
    """Recursively extract scripts from XML items"""
    if extracted_scripts is None:
        extracted_scripts = []
    
    # Get item class and properties
    class_name = item.get('class', '')
    
    # Look for Properties section
    properties = item.find('Properties')
    if properties is None:
        # Recurse into child items
        for child_item in item.findall('Item'):
            child_name = ""
            child_props = child_item.find('Properties')
            if child_props is not None:
                name_elem = child_props.find(".//string[@name='Name']")
                if name_elem is not None:
                    child_name = name_elem.text or ""
            
            child_path = f"{current_path}/{sanitize_filename(child_name)}" if current_path else sanitize_filename(child_name)
            extract_scripts_from_item(child_item, child_path, extracted_scripts)
        return extracted_scripts
    
    # Get the name of this item
    name_elem = properties.find(".//string[@name='Name']")
    item_name = name_elem.text if name_elem is not None else "Unknown"
    
    # Update current path
    if current_path:
        full_path = f"{current_path}/{sanitize_filename(item_name)}"
    else:
        full_path = sanitize_filename(item_name)
    
    # Check if this is a script item
    if class_name in ["Script", "LocalScript", "ModuleScript"]:
        # Look for Source ProtectedString
        source_elem = properties.find(".//ProtectedString[@name='Source']")
        if source_elem is not None and source_elem.text:
            source_code = source_elem.text.strip()
            
            script_info = {
                'name': item_name,
                'class': class_name,
                'path': full_path,
                'source': source_code,
                'extension': get_script_extension(class_name)
            }
            extracted_scripts.append(script_info)
            print(f"✓ Found {class_name}: {full_path}")
        else:
            print(f"⚠ Empty {class_name}: {full_path}")
    
    # Continue recursing into child items
    for child_item in item.findall('Item'):
        extract_scripts_from_item(child_item, full_path, extracted_scripts)
    
    return extracted_scripts

def parse_rbxmx_file(rbxmx_path):
    """Parse RBXMX file and extract all scripts"""
    print(f"📄 Parsing: {rbxmx_path}")
    
    try:
        tree = ET.parse(rbxmx_path)
        root = tree.getroot()
        
        extracted_scripts = []
        
        # Find all top-level items
        for item in root.findall('Item'):
            extract_scripts_from_item(item, "", extracted_scripts)
        
        print(f"📊 Found {len(extracted_scripts)} scripts with source code")
        return extracted_scripts
        
    except ET.ParseError as e:
        print(f"❌ XML Parse Error: {e}")
        return []
    except Exception as e:
        print(f"❌ Error: {e}")
        return []

def create_output_structure(output_dir):
    """Create Rojo-compatible output directory structure"""
    directories = [
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
    ]
    
    for directory in directories:
        Path(os.path.join(output_dir, directory)).mkdir(parents=True, exist_ok=True)

def map_script_to_service(script_path, script_class):
    """Map script to appropriate Roblox service directory"""
    path_lower = script_path.lower()
    
    # Service-specific mappings
    if "serverscript" in path_lower or "server_script" in path_lower:
        return "src/ServerScriptService"
    elif "startercharacter" in path_lower or "starter_character" in path_lower:
        return "src/StarterPlayer/StarterCharacterScripts"
    elif "starterplayer" in path_lower or "starter_player" in path_lower:
        return "src/StarterPlayer/StarterPlayerScripts"
    elif "startergui" in path_lower or "starter_gui" in path_lower:
        return "src/StarterGui"
    elif "lighting" in path_lower:
        return "src/Lighting"
    elif "workspace" in path_lower or "put_in_workspace" in path_lower:
        return "src/Workspace"
    
    # Class-based fallbacks
    if script_class == "Script":
        return "src/ServerScriptService"  # Server scripts
    elif script_class == "LocalScript":
        return "src/StarterPlayer/StarterPlayerScripts"  # Client scripts
    else:
        return "src/ReplicatedStorage/Modules"  # Module scripts

def save_scripts(scripts, output_dir):
    """Save extracted scripts to appropriate directories"""
    print(f"\n💾 Saving {len(scripts)} scripts to: {output_dir}")
    
    # Create directory structure
    create_output_structure(output_dir)
    
    saved_count = 0
    
    for script in scripts:
        # Determine target directory
        service_dir = map_script_to_service(script['path'], script['class'])
        
        # Create filename
        filename = f"{sanitize_filename(script['name'])}{script['extension']}"
        
        # Full output path
        full_output_path = os.path.join(output_dir, service_dir, filename)
        
        # Ensure directory exists
        os.makedirs(os.path.dirname(full_output_path), exist_ok=True)
        
        # Write script content
        try:
            with open(full_output_path, 'w', encoding='utf-8') as f:
                f.write(f"-- {script['name']} ({script['class']})\n")
                f.write(f"-- Extracted from: {script['path']}\n\n")
                f.write(script['source'])
            
            print(f"✅ {script['class']}: {full_output_path}")
            saved_count += 1
            
        except Exception as e:
            print(f"❌ Failed to save {filename}: {e}")
    
    print(f"\n🎉 Successfully saved {saved_count}/{len(scripts)} scripts!")
    return saved_count

def main():
    """Main extraction function"""
    if len(sys.argv) < 2:
        print("Usage: python3 rbxmx-script-extractor.py <input.rbxmx> [output_dir]")
        return
    
    input_file = sys.argv[1]
    output_dir = sys.argv[2] if len(sys.argv) > 2 else "rbxmx_extracted"
    
    if not os.path.exists(input_file):
        print(f"❌ File not found: {input_file}")
        return
    
    print("🚀 RBXMX Script Extractor")
    print("=" * 50)
    
    # Extract scripts
    scripts = parse_rbxmx_file(input_file)
    
    if not scripts:
        print("❌ No scripts found or extraction failed")
        return
    
    # Save scripts
    saved_count = save_scripts(scripts, output_dir)
    
    if saved_count > 0:
        print(f"\n🎯 Next Steps:")
        print(f"1. Review extracted files in '{output_dir}' directory")
        print(f"2. Copy relevant files to your Rojo project 'src/' directory")
        print(f"3. Update your default.project.json if needed")
        print(f"4. Run 'rojo serve' to sync with Roblox Studio")
    
if __name__ == "__main__":
    main()