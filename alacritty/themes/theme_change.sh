#!/bin/bash

# Define an array of theme filenames
THEMES=(
  "breeze.toml"
  "catppuccin-frappe.toml"
  "catppuccin-macchiato.toml"
  "catppuccin-mocha.toml"
  "one_dark.toml"
  "tokyonight_moon.toml"
  "tokyonight_night.toml"
  "tokyonight_storm.toml"
  "ubuntu.toml"
)

# Path to the index file that stores the current theme index
INDEX_FILE="$HOME/.config/alacritty/themes/.alacritty_theme_index"

# Check if the index file exists, if not, initialize it with the default index (0)
if [ ! -f "$INDEX_FILE" ]; then
  echo "0" > "$INDEX_FILE"
fi

# Read the current theme index from the index file
current_index=$(cat "$INDEX_FILE")

# Get the theme file based on the current index
theme_file="${THEMES[$current_index]}"

# Update the theme file path in the alacritty.toml configuration file (10th line)
# sed -i "10s|.*|  \"~/.config/alacritty/themes/themes/${theme_file}\"|" "$HOME/.config/alacritty/alacritty.toml"

#After Updating theme from this script Softlink is loosing, soo to fix it
sed -i "10s|.*|  \"~/.config/alacritty/themes/themes/${theme_file}\"|" ~/GIT/dotfiles/alacritty/alacritty.toml

# Print the updated theme name
echo "Theme updated to: $theme_file"

# Calculate the next index (loop back to 0 if at the end)
next_index=$(( (current_index + 1) % ${#THEMES[@]} ))

# Update the index file with the next theme index
echo $next_index > "$INDEX_FILE"

# Print the new index (debugging purpose)
echo "Next theme index: $next_index"
