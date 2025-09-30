# dotfiles
Where I keep track of all the configurations for the apps I use

## Quick Setup

### Prerequisites
- macOS with Homebrew installed
- Git configured

### One-line setup (run from this directory):
```bash
./setup.sh
```

### Manual Setup

#### 1. Install Applications
```bash
# Window management and visual enhancements
brew install --cask karabiner-elements
brew install --cask aerospace

# Window borders and status bar
brew tap FelixKratz/formulae
brew install borders
brew install sketchybar
brew install --cask font-hack-nerd-font
brew services start felixkratz/formulae/borders
brew services start felixkratz/formulae/sketchybar
```

#### 2. Link Configuration Files
```bash
# LeaderKey config
ln -sf ~/dev/dotfiles/leaderkey/config.json "/Users/$(whoami)/Library/Application Support/Leader Key/config.json"

# Karabiner-Elements config
mkdir -p ~/.config/karabiner
ln -sf ~/dev/dotfiles/karabiner/karabiner.json ~/.config/karabiner/karabiner.json

# AeroSpace config
mkdir -p ~/.config/aerospace
ln -sf ~/dev/dotfiles/aerospace/aerospace.toml ~/.config/aerospace/aerospace.toml

# SketchyBar config
mkdir -p ~/.config/sketchybar
ln -sf ~/dev/dotfiles/sketchybar/sketchybarrc ~/.config/sketchybar/sketchybarrc
ln -sf ~/dev/dotfiles/sketchybar/plugins ~/.config/sketchybar/plugins
```

#### 3. Install Keyboard Layout
```bash
# Copy Norwegian ColemakDH layout
cp -R "keyboard/Norwegian ColemakDH.bundle" ~/Library/Keyboard\ Layouts/
```

#### 4. Restart Applications
```bash
# Restart applications to pick up new configs
killall "Leader Key" 2>/dev/null || true
killall "Karabiner-Elements" 2>/dev/null || true
killall "AeroSpace" 2>/dev/null || true

# Reopen applications
open -a "Leader Key"
open -a "Karabiner-Elements" 
open -a "AeroSpace"
```

## Configuration Overview

- **`keyboard/`** - Norwegian ColemakDH keyboard layout bundle
- **`leaderkey/`** - Leader Key shortcuts and automation config
- **`karabiner/`** - Karabiner-Elements key remapping config
- **`aerospace/`** - AeroSpace window manager config
- **`sketchybar/`** - SketchyBar status bar config and plugins

## Notes

- All configs use symlinks so changes are automatically synced via Git
- The keyboard layout needs to be manually selected in System Preferences after installation
- Services (like borders) will start automatically on login after setup
