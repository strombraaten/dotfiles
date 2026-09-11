#!/bin/bash

set -e  # Exit on any error

cd "$(dirname "$0")"

echo "Installing apps via Brewfile..."
brew bundle --file=Brewfile

echo "Note: yabai + skhd are not in the Brewfile (untrusted tap) — install them"
echo "manually first, see README. Skipping if already installed."

echo "Setting up yabai + skhd config symlinks..."
ln -sf "$(pwd)/yabai/yabairc" ~/.yabairc
ln -sf "$(pwd)/yabai/skhdrc" ~/.skhdrc
echo "✓ yabai config linked (~/.yabairc)"
echo "✓ skhd config linked (~/.skhdrc)"

echo "Starting services..."
brew services start koekeishiya/formulae/yabai || true
brew services start koekeishiya/formulae/skhd || true

echo "Setup complete!"
echo "Don't forget to:"
echo "  1. Grant yabai Accessibility permissions (System Settings → Privacy & Security → Accessibility)"
echo "  2. Grant skhd Accessibility + Input Monitoring permissions"
echo "  3. See yabai/setup.sh for scripting-addition setup (optional, needed for some window features)"
