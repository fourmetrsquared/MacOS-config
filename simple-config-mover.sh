#!/bin/bash
# simple-config-mover.sh

set -e

CONFIG_DIR="$HOME/.config"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Create ~/.config if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Move all directories (excluding hidden files like .git)
find "$SCRIPT_DIR" -maxdepth 1 -type d ! -name ".*" ! -name "." -exec sh -c '
    for dir do
        dir_name=$(basename "$dir")
        if [ "$dir_name" != "README.md" ] && [ "$dir_name" != "colors.sh" ]; then
            echo "Moving $dir_name to ~/.config/"
            mv "$dir" "$CONFIG_DIR/" 2>/dev/null || true
        fi
    done
' sh {} +

# Move colors.sh if it exists
if [ -f "$SCRIPT_DIR/colors.sh" ]; then
    echo "Moving colors.sh to ~/.config/"
    mv "$SCRIPT_DIR/colors.sh" "$CONFIG_DIR/"
fi

# Copy README.md
if [ -f "$SCRIPT_DIR/README.md" ]; then
    echo "Copying README.md to ~/.config/"
    cp "$SCRIPT_DIR/README.md" "$CONFIG_DIR/"
fi

echo "All configurations have been moved to ~/.config/"
