#!/bin/sh

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

if [ "$SENDER" = "front_app_switched" ]; then
  # Icon mapping for apps using emojis
  case "$INFO" in
    "TIDAL"*|"Tidal"*) ICON="🎧" ;;
    "Figma"*) ICON="🎨" ;;
    "Microsoft Outlook"*|"Outlook"*) ICON="✉️" ;;
    "Eagle"*) ICON="🗄" ;;
    "Morgen"*) ICON="📆" ;;
    "Warp"*) ICON="👨‍💻" ;;
    "Cursor"*) ICON="👨‍💻" ;;
    "Microsoft Teams"*|"Teams"*) ICON="👨‍💼" ;;
    "Obsidian"*) ICON="📓" ;;
    "Arc"*) ICON="💻" ;;
    "Slack"*) ICON="💬" ;;
    "ChatGPT"*) ICON="🤖" ;;
    "Claude"*) ICON="💭" ;;
    "Safari"*) ICON="🧭" ;;
    "Chrome"*|"Google Chrome"*) ICON="🌐" ;;
    "Firefox"*) ICON="🦊" ;;
    "Code"*|"Visual Studio Code"*) ICON="💻" ;;
    "Terminal"*) ICON="⚡️" ;;
    "Finder"*) ICON="📁" ;;
    "Notes"*) ICON="📝" ;;
    "Calculator"*) ICON="🧮" ;;
    *) ICON="" ;;
  esac
  
  sketchybar --set "$NAME" label="$INFO" icon="$ICON"
else
  # Initial load - get current front app
  FRONT_APP=$(osascript -e 'tell application "System Events" to get name of first application process whose frontmost is true')
  sketchybar --set "$NAME" label="$FRONT_APP" icon=""
fi
