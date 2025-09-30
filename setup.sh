#!/bin/bash

set -e  # Exit on any error

echo "Setting up dotfiles..."

# Install applications
echo "Installing applications..."
brew install --cask karabiner-elements || true
brew install --cask aerospace || true
brew tap FelixKratz/formulae || true
brew install borders || true
brew install sketchybar || true
brew install --cask font-hack-nerd-font || true

echo "Setting up configuration symlinks..."

# LeaderKey config (if LeaderKey is installed)
if [ -d "/Users/$(whoami)/Library/Application Support/Leader Key" ]; then
    ln -sf "$(pwd)/leaderkey/config.json" "/Users/$(whoami)/Library/Application Support/Leader Key/config.json"
    echo "✓ LeaderKey config linked"
fi

# Karabiner-Elements config
mkdir -p ~/.config/karabiner
ln -sf "$(pwd)/karabiner/karabiner.json" ~/.config/karabiner/karabiner.json
echo "✓ Karabiner config linked"

# AeroSpace config (remove any conflicting configs first)
rm -f ~/.aerospace.toml  # Remove conflicting home directory config
mkdir -p ~/.config/aerospace
ln -sf "$(pwd)/aerospace/aerospace.toml" ~/.config/aerospace/aerospace.toml
echo "✓ AeroSpace config linked"

# SketchyBar config
mkdir -p ~/.config/sketchybar
ln -sf "$(pwd)/sketchybar/sketchybarrc" ~/.config/sketchybar/sketchybarrc
ln -sf "$(pwd)/sketchybar/plugins" ~/.config/sketchybar/plugins
echo "✓ SketchyBar config linked"

echo "Installing keyboard layout..."
cp -R "keyboard/Norwegian ColemakDH.bundle" ~/Library/Keyboard\ Layouts/
echo "✓ Keyboard layout installed"

echo "Starting services..."
brew services start felixkratz/formulae/borders || true
brew services start felixkratz/formulae/sketchybar || true

echo "Restarting applications..."
killall "Karabiner-Elements" 2>/dev/null || true
killall "AeroSpace" 2>/dev/null || true
killall "sketchybar" 2>/dev/null || true
sleep 1
open -a "Karabiner-Elements" || true
open -a "AeroSpace" || true
sketchybar &

echo "Setup complete!"
echo "Don't forget to:"
echo "  1. Add the Norwegian ColemakDH layout in System Preferences"
echo "  2. Grant permissions to Karabiner-Elements and AeroSpace"