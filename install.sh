#!/bin/bash

# config-mover.sh
# Moves all configuration directories to ~/.config/

set -e # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"

# List of directories to move (excluding README.md and colors.sh)
CONFIG_DIRS=(
    "QtProject"
    "alacritty"
    "borders"
    "doom"
    "emacs"
    "envman"
    "github-copilot"
    "gitui"
    "kitty"
    "neofetch"
    "nvim"
    "sketchybar"
    "skhd"
    "yabai"
)

# Function to create backup of existing config
backup_existing_config() {
    local config_name="$1"
    local target_path="$CONFIG_DIR/$config_name"
    
    if [[ -e "$target_path" ]]; then
        local backup_path="${target_path}.backup.$(date +%Y%m%d_%H%M%S)"
        info "Backing up existing $config_name to $backup_path"
        mv "$target_path" "$backup_path"
    fi
}

# Function to move config directory
move_config() {
    local config_name="$1"
    local source_path="$SCRIPT_DIR/$config_name"
    local target_path="$CONFIG_DIR/$config_name"
    
    if [[ ! -d "$source_path" && ! -f "$source_path" ]]; then
        warning "$config_name not found in current directory, skipping"
        return 1
    fi
    
    # Create backup of existing config if it exists
    backup_existing_config "$config_name"
    
    # Move the config to ~/.config/
    info "Moving $config_name to ~/.config/"
    mv "$source_path" "$target_path"
    
    if [[ $? -eq 0 ]]; then
        success "Moved $config_name successfully"
        return 0
    else
        error "Failed to move $config_name"
        return 1
    fi
}

# Function to create symlink instead of moving (optional)
symlink_config() {
    local config_name="$1"
    local source_path="$SCRIPT_DIR/$config_name"
    local target_path="$CONFIG_DIR/$config_name"
    
    if [[ ! -d "$source_path" && ! -f "$source_path" ]]; then
        warning "$config_name not found in current directory, skipping"
        return 1
    fi
    
    # Create backup of existing config if it exists
    backup_existing_config "$config_name"
    
    # Create symlink instead of moving
    info "Creating symlink for $config_name in ~/.config/"
    ln -sf "$source_path" "$target_path"
    
    if [[ $? -eq 0 ]]; then
        success "Created symlink for $config_name successfully"
        return 0
    else
        error "Failed to create symlink for $config_name"
        return 1
    fi
}

# Function to handle colors.sh specially
handle_colors_sh() {
    local source_path="$SCRIPT_DIR/colors.sh"
    local target_path="$CONFIG_DIR/colors.sh"
    
    if [[ ! -f "$source_path" ]]; then
        warning "colors.sh not found, skipping"
        return 1
    fi
    
    # Create backup if colors.sh already exists in ~/.config/
    if [[ -f "$target_path" ]]; then
        local backup_path="${target_path}.backup.$(date +%Y%m%d_%H%M%S)"
        info "Backing up existing colors.sh to $backup_path"
        mv "$target_path" "$backup_path"
    fi
    
    # Move colors.sh
    info "Moving colors.sh to ~/.config/"
    mv "$source_path" "$target_path"
    
    if [[ $? -eq 0 ]]; then
        success "Moved colors.sh successfully"
        
        # Make it executable if it contains shell code
        if head -n 1 "$target_path" | grep -q "^#!/bin/bash\|^#!/bin/sh"; then
            chmod +x "$target_path"
            info "Made colors.sh executable"
        fi
        return 0
    else
        error "Failed to move colors.sh"
        return 1
    fi
}

# Main function
main() {
    info "Starting configuration migration to ~/.config/"
    
    # Ensure ~/.config directory exists
    if [[ ! -d "$CONFIG_DIR" ]]; then
        info "Creating ~/.config directory"
        mkdir -p "$CONFIG_DIR"
    fi
    
    # Ask user if they want to move or symlink
    echo -e "${BLUE}How would you like to handle the configuration files?${NC}"
    echo "1) Move them to ~/.config/ (original files will be removed from here)"
    echo "2) Create symlinks in ~/.config/ (files stay in this directory)"
    read -p "Enter choice [1/2]: " -n 1 -r
    echo
    
    local move_files=true
    if [[ $REPLY =~ ^[2]$ ]]; then
        move_files=false
        info "Will create symlinks instead of moving files"
    else
        info "Will move files to ~/.config/"
    fi
    
    # Process each configuration directory
    for config in "${CONFIG_DIRS[@]}"; do
        if [[ "$move_files" = true ]]; then
            move_config "$config"
        else
            symlink_config "$config"
        fi
    done
    
    # Handle colors.sh specially
    handle_colors_sh
    
    # Handle README.md (optional - copy instead of move)
    if [[ -f "$SCRIPT_DIR/README.md" ]]; then
        if [[ "$move_files" = true ]]; then
            info "Copying README.md to ~/.config/ (keeping original)"
            cp "$SCRIPT_DIR/README.md" "$CONFIG_DIR/README.md"
        else
            # For symlink mode, we can symlink README too
            ln -sf "$SCRIPT_DIR/README.md" "$CONFIG_DIR/README.md"
        fi
    fi
    
    success "Configuration migration completed!"
    
    if [[ "$move_files" = true ]]; then
        info "Original configuration files have been moved to ~/.config/"
    else
        info "Symlinks have been created in ~/.config/"
        info "Original files remain in: $SCRIPT_DIR"
    fi
    
    info "You may want to restart your applications for changes to take effect"
}

# Check if running as root
if [[ "$EUID" -eq 0 ]]; then
    error "Please do not run this script as root."
    exit 1
fi

# Run main function
main "$@"
