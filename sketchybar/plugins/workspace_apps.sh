#!/bin/sh

# Script to update workspace indicators with app icons
# Shows which apps are running in each workspace

# Emoji mapping function (reusing from front_app.sh)
get_app_emoji() {
  case "$1" in
    "TIDAL"|"Tidal") echo "🎧" ;;
    "Figma") echo "🎨" ;;
    "Microsoft Outlook"|"Outlook") echo "✉️" ;;
    "Eagle") echo "🗄" ;;
    "Morgen") echo "📆" ;;
    "Warp") echo "👨‍💻" ;;
    "Cursor") echo "👨‍💻" ;;
    "Microsoft Teams"|"Teams") echo "👨‍💼" ;;
    "Obsidian") echo "📓" ;;
    "Arc") echo "💻" ;;
    "Slack") echo "💬" ;;
    "ChatGPT") echo "🤖" ;;
    "Claude") echo "💭" ;;
    "Safari") echo "🧭" ;;
    "Chrome"|"Google Chrome") echo "🌐" ;;
    "Firefox") echo "🦊" ;;
    "Code"|"Visual Studio Code") echo "💻" ;;
    "Terminal") echo "⚡️" ;;
    "Finder") echo "📁" ;;
    "Notes") echo "📝" ;;
    "Calculator") echo "🧮" ;;
    *) echo "" ;;  # No icon for unmapped apps
  esac
}

# Update all workspace indicators
for workspace in $(seq 1 5); do
  # Get apps in this workspace
  apps=$(aerospace list-windows --workspace "$workspace" --format '%{app-name}' 2>/dev/null | sort -u)
  
  # Build the display string
  if [ -n "$apps" ]; then
    icons=""
    for app in $apps; do
      emoji=$(get_app_emoji "$app")
      if [ -n "$emoji" ]; then
        icons="$icons $emoji"
      fi
    done
    
    # Set workspace label with number and app icons
    if [ -n "$icons" ]; then
      display_text="$workspace$icons"
    else
      display_text="$workspace"
    fi
  else
    display_text="$workspace"
  fi
  
  # Update the workspace indicator
  sketchybar --set "space.$workspace" label="$display_text"
done