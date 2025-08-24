#!/bin/sh
# Universal Dark Glass Theme with Enhanced Palette and Shadows

# Background - Dark translucent
BACKGROUND_COLOR=0x80303030  # 50% opacity dark gray

# Base glass colors
GLASS_DARK=0x80303030        # 50% dark gray
GLASS_BLACK=0xA0202020       # 63% near black
GLASS_WHITE=0x80FFFFFF       # 50% white
GLASS_LIGHT=0x60EEEEEE       # 38% light gray

# Gradient colors for animation
GRADIENT_CYAN=0x805AC8FF     # 50% cyan
GRADIENT_BLUE=0x805EB0FF     # 50% blue
GRADIENT_PURPLE=0x80CF5AF2   # 50% purple
GRADIENT_PINK=0x80FF5AC8     # 50% pink

# Glow effects
GLOW_CYAN=0x8080D0FF         # 50% cyan glow
GLOW_BLUE=0x8070BFFF         # 50% blue glow
GLOW_PURPLE=0x80BF6FF2       # 50% purple glow
GLOW_PINK=0x80FF7AC8         # 50% pink glow

# Accent colors
ACCENT_PRIMARY=0xFFFFB74D    # Orange accent (solid)
ACCENT_SECONDARY=0xFFFFD180  # Light orange accent (solid)
SUCCESS=0xFF8BC34A           # Green success (solid)
ERROR=0xFFE57373             # Red error (solid)

# Shadow colors - Multi-layered shadow system
SHADOW_DARK=0x99101010       # 60% dark shadow for depth
SHADOW_MEDIUM=0x66202020     # 40% medium shadow
SHADOW_LIGHT=0x33303030      # 20% light shadow
SHADOW_AMBIENT=0x1A000000    # 10% ambient shadow for soft edges

# Colored shadows for glass effects
SHADOW_BLUE=0x66002A66       # 40% blue tinted shadow
SHADOW_PURPLE=0x66330066     # 40% purple tinted shadow
SHADOW_CYAN=0x66003D66       # 40% cyan tinted shadow
SHADOW_PINK=0x66660066       # 40% pink tinted shadow

# Text and UI shadows
TEXT_SHADOW=0x99000000       # 60% black text shadow
UI_SHADOW=0x4D000000         # 30% UI element shadow
ELEVATION_SHADOW=0x33000000  # 20% elevation shadow

# Inner shadows for depth
INNER_SHADOW_DARK=0x4D000000 # 30% inner shadow
INNER_SHADOW_LIGHT=0x1AFFFFFF # 10% inner highlight

# Additional universal colors
TEXT_PRIMARY=0xFFFFFFFF      # White text (solid)
TEXT_SECONDARY=0xB3FFFFFF    # 70% white text
BORDER=0x4DFFFFFF            # 30% white border
HIGHLIGHT=0x33FFFFFF         # 20% white highlight

# Shadow presets for different elevations
SHADOW_ELEVATION_1="0 1px 3px $SHADOW_LIGHT, 0 1px 2px $SHADOW_AMBIENT"
SHADOW_ELEVATION_2="0 3px 6px $SHADOW_MEDIUM, 0 2px 4px $SHADOW_AMBIENT"
SHADOW_ELEVATION_3="0 10px 20px $SHADOW_DARK, 0 6px 6px $SHADOW_AMBIENT"
SHADOW_ELEVATION_4="0 15px 25px $SHADOW_DARK, 0 10px 10px $SHADOW_AMBIENT"
SHADOW_ELEVATION_5="0 20px 40px $SHADOW_DARK, 0 15px 12px $SHADOW_AMBIENT"

# Glass-specific shadow effects
GLASS_SHADOW="0 8px 32px $SHADOW_BLUE"
GLASS_SHADOW_INTENSE="0 12px 40px $SHADOW_PURPLE, 0 4px 12px $SHADOW_CYAN"
GLASS_SHADOW_SOFT="0 4px 16px $SHADOW_AMBIENT, 0 2px 8px $SHADOW_LIGHT"

# Text shadow presets
TEXT_SHADOW_SOFT="0 1px 2px $TEXT_SHADOW"
TEXT_SHADOW_MEDIUM="0 2px 4px $TEXT_SHADOW"
TEXT_SHADOW_STRONG="0 3px 6px $TEXT_SHADOW, 0 1px 3px $SHADOW_DARK"
