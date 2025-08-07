#!/bin/bash
# Remodel Installation Script for macOS
# This script downloads and installs Remodel, the scriptable Roblox multitool

echo "🔧 Installing Remodel..."

# Get the latest release download URL for macOS ARM64
echo "📡 Fetching latest Remodel release..."
DOWNLOAD_URL=$(curl -s https://api.github.com/repos/rojo-rbx/remodel/releases/latest | grep "browser_download_url.*macos-aarch64" | head -1 | cut -d '"' -f 4)

if [ -z "$DOWNLOAD_URL" ]; then
    echo "❌ Failed to get download URL. Trying Intel version..."
    DOWNLOAD_URL=$(curl -s https://api.github.com/repos/rojo-rbx/remodel/releases/latest | grep "browser_download_url.*macos" | head -1 | cut -d '"' -f 4)
fi

if [ -z "$DOWNLOAD_URL" ]; then
    echo "❌ Failed to get download URL for macOS. Please check your internet connection or download manually from:"
    echo "   https://github.com/rojo-rbx/remodel/releases"
    exit 1
fi

echo "📥 Downloading from: $DOWNLOAD_URL"

# Download and install
curl -L -o remodel.zip "$DOWNLOAD_URL"

if [ $? -ne 0 ]; then
    echo "❌ Download failed!"
    exit 1
fi

echo "📦 Extracting..."
unzip -q remodel.zip

if [ $? -ne 0 ]; then
    echo "❌ Extraction failed!"
    rm -f remodel.zip
    exit 1
fi

echo "🔐 Setting permissions..."
chmod +x remodel

echo "🧹 Cleaning up..."
rm -f remodel.zip

echo "✅ Remodel installed successfully!"
echo ""
echo "🎯 Usage:"
echo "  ./remodel run <script.lua> [args...]"
echo ""
echo "🔍 Verify installation:"
echo "  ./remodel --version"
echo ""
echo "📚 Documentation:"
echo "  https://github.com/rojo-rbx/remodel"

# Verify installation
if [ -f "./remodel" ]; then
    echo ""
    echo "🎉 Installation complete! Remodel is ready to use."
    ./remodel --version 2>/dev/null || echo "⚠️  Note: Run './remodel --version' to verify installation"
else
    echo "❌ Installation failed - remodel binary not found"
    exit 1
fi