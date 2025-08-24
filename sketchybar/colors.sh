#!/bin/bash
# Universal Glass Theme Color Definitions

source "$HOME/.config/colors.sh"

# Base Glass Colors (using your universal theme)
export BASE_MOON=$BACKGROUND_COLOR
export SURFACE_MOON=$GLASS_LIGHT
export OVERLAY_MOON=$GLASS_DARK
export MUTED_MOON=$TEXT_SECONDARY
export SUBTLE_MOON=$GLASS_LIGHT
export TEXT_MOON=$TEXT_PRIMARY

# Accent Colors (mapped to your universal theme)
export LOVE_MOON=$ERROR              # Red error
export GOLD_MOON=$ACCENT_PRIMARY     # Orange accent
export ROSE_MOON=$ACCENT_SECONDARY   # Light orange accent
export PINE_MOON=$GRADIENT_CYAN      # Cyan gradient
export FOAM_MOON=$GLOW_CYAN          # Cyan glow
export IRIS_MOON=$GRADIENT_PURPLE    # Purple gradient

# Shadow Colors (mapped to your universal theme)
export HIGH_LOW_MOON=$SHADOW_LIGHT   # Light shadow
export HIGH_MED_MOON=$SHADOW_MEDIUM  # Medium shadow
export HIGH_HIGH_MOON=$SHADOW_DARK   # Dark shadow

# Core Colors
export BLACK=$GLASS_BLACK
export TRANSPARENT=0x00000000

# General Bar Colors
export BAR_COLOR=$BACKGROUND_COLOR
export BORDER_COLOR=$BORDER
export ICON_COLOR=$TEXT_PRIMARY      # Using universal text primary
export LABEL_COLOR=$TEXT_PRIMARY     # Using universal text primary

# Popup Colors
export POPUP_BACKGROUND_COLOR=$GLASS_BLACK
export POPUP_BORDER_COLOR=$GLASS_WHITE

# Shadow Color
export SHADOW_COLOR=$TEXT_SHADOW     # Using universal text shadow
