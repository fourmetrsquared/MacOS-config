#!/bin/bash
# Script to update Alacritty colors from universal theme

source "$HOME/.config/colors.sh"

# Function to convert hex with alpha to standard hex
hex_to_rgb() {
    local hex=${1#0x}
    local color=${hex:2:6}  # Remove alpha channel
    echo "#${color}"
}

# Create the colors-generated.toml file
cat > "$HOME/.config/alacritty/colors-generated.toml" << EOF
# Auto-generated from Universal Glass Theme
# Generated on: $(date)

[colors.primary]
background = "$(hex_to_rgb $BACKGROUND_COLOR)"
foreground = "$(hex_to_rgb $TEXT_PRIMARY)"

[colors.normal]
black   = "$(hex_to_rgb $GLASS_BLACK)"
red     = "$(hex_to_rgb $ERROR)"
green   = "$(hex_to_rgb $SUCCESS)"
yellow  = "$(hex_to_rgb $ACCENT_PRIMARY)"
blue    = "$(hex_to_rgb $GRADIENT_BLUE)"
magenta = "$(hex_to_rgb $GRADIENT_PURPLE)"
cyan    = "$(hex_to_rgb $GRADIENT_CYAN)"
white   = "$(hex_to_rgb $GLASS_LIGHT)"

[colors.bright]
black   = "$(hex_to_rgb $SHADOW_DARK)"
red     = "$(hex_to_rgb $ERROR)"
green   = "$(hex_to_rgb $SUCCESS)"
yellow  = "$(hex_to_rgb $ACCENT_SECONDARY)"
blue    = "$(hex_to_rgb $GLOW_BLUE)"
magenta = "$(hex_to_rgb $GLOW_PURPLE)"
cyan    = "$(hex_to_rgb $GLOW_CYAN)"
white   = "$(hex_to_rgb $GLASS_WHITE)"

[colors.cursor]
text = "$(hex_to_rgb $GLASS_BLACK)"
cursor = "$(hex_to_rgb $TEXT_PRIMARY)"

[colors.selection]
text = "$(hex_to_rgb $GLASS_BLACK)"
background = "$(hex_to_rgb $TEXT_PRIMARY)"

[colors.search]
matches = { foreground = "$(hex_to_rgb $TEXT_PRIMARY)", background = "$(hex_to_rgb $ACCENT_PRIMARY)" }
focused = { foreground = "$(hex_to_rgb $GLASS_BLACK)", background = "$(hex_to_rgb $SUCCESS)" }

[colors.hints]
start = { foreground = "$(hex_to_rgb $TEXT_PRIMARY)", background = "$(hex_to_rgb $ACCENT_PRIMARY)" }
end = { foreground = "$(hex_to_rgb $TEXT_PRIMARY)", background = "$(hex_to_rgb $GLASS_DARK)" }
EOF

echo "Alacritty colors updated successfully!"
echo "Generated: ~/.config/alacritty/colors-generated.toml"
