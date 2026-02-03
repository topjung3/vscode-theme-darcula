#!/bin/bash

# Get extension info from package.json
EXT_NAME="vscode-theme-darcula-heesu"
EXT_VERSION="0.0.1"
EXT_DIR="${EXT_NAME}-${EXT_VERSION}"

# Check if VS Code is installed
CODE_PATH=$(which code)
if [ -z "$CODE_PATH" ]; then
    echo "Error: VS Code 'code' command not found in PATH"
    exit 1
fi

echo "Found VS Code at: $CODE_PATH"

# Determine extensions directory (works for macOS and Linux)
VSCODE_EXT_DIR="$HOME/.vscode/extensions"

# Create extension directory
TARGET_DIR="${VSCODE_EXT_DIR}/${EXT_DIR}"

if [ -d "$TARGET_DIR" ]; then
    echo "Removing existing installation..."
    rm -rf "$TARGET_DIR"
fi

echo "Installing to: $TARGET_DIR"
mkdir -p "$TARGET_DIR"

# Copy extension files
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cp -r "$SCRIPT_DIR/package.json" "$SCRIPT_DIR/themes" "$SCRIPT_DIR/icon.png" "$TARGET_DIR/"

echo "Installation complete!"
echo "Please restart VS Code and select the theme:"
echo "  Cmd+K Cmd+T (macOS) or Ctrl+K Ctrl+T (Linux/Windows)"
echo "  Then choose 'Darcula-heesu'"
