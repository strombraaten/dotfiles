#!/bin/sh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

# Norwegian month names
case $(date '+%m') in
  01) month="Januar" ;;
  02) month="Februar" ;;
  03) month="Mars" ;;
  04) month="April" ;;
  05) month="Mai" ;;
  06) month="Juni" ;;
  07) month="Juli" ;;
  08) month="August" ;;
  09) month="September" ;;
  10) month="Oktober" ;;
  11) month="November" ;;
  12) month="Desember" ;;
esac

# Format: "08. Oktober 09:10"
date_str="$(date '+%d'). $month $(date '+%H:%M')"
sketchybar --set "$NAME" label="$date_str"

