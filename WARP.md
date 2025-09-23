# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository focused on configurating personal preferences in producitivity apps and keyboard layout customization for macOS. The repository contains a custom Norwegian ColemakDH keyboard layout bundle that provides an ergonomic typing experience optimized for Norwegian users.

## Architecture

```
dotfiles/
├── keyboard/
│   └── Norwegian ColemakDH.bundle/
│       └── Contents/
│           ├── Info.plist                    # Bundle metadata and keyboard configuration
│           ├── version.plist                 # Version information
│           └── Resources/
│               ├── Norwegian ColemakDH-v3.keylayout    # Main keyboard layout definition
│               ├── Norwegian ColemakDH-v3.icns         # Layout icon
│               └── nb.lproj/
│                   └── InfoPlist.strings      # Localized strings
```

The core component is the `.keylayout` file (XML format) which defines:
- Key mappings for the Colemak-DH layout adapted for Norwegian
- Modifier key combinations and their outputs
- Dead key behaviors for accent characters
- Special character mappings

## Common Operations

### Installing the Keyboard Layout
```bash
# Copy the bundle to the system keyboard layouts directory
cp -R "keyboard/Norwegian ColemakDH.bundle" ~/Library/Keyboard\ Layouts/

# Or to make it available system-wide (requires admin privileges)
sudo cp -R "keyboard/Norwegian ColemakDH.bundle" /Library/Keyboard\ Layouts/
```

After installation, the layout becomes available in System Preferences → Keyboard → Input Sources.

### Viewing the Layout Structure
```bash
# Examine the bundle structure
find keyboard/ -type f -name "*.plist" -o -name "*.keylayout" | head -10

# View the main layout configuration
cat "keyboard/Norwegian ColemakDH.bundle/Contents/Info.plist"
```

### Making Layout Changes
The keyboard layout is defined in XML format. Key modifications require:
1. Editing the `.keylayout` file with proper XML structure
2. Updating version numbers in both `Info.plist` and `version.plist`
3. Reinstalling the bundle for changes to take effect

### Version Management
Current version: v3 (as indicated in filenames and bundle configuration)
- Layout identifier: `norwegiancolemakdh-v3`
- Bundle version: `3`
- Intended language: `nb` (Norwegian Bokmål)

## Development Notes

This repository uses Git for version control with a focus on keyboard layout iteration. Recent commits show refinements to key mappings (specifically swapping 'd' and 'v' positions).

The keyboard layout follows Apple's Keyboard Layout format and can be edited using:
- Ukelele (keyboard layout editor for macOS)
- Direct XML editing of the `.keylayout` file
- Testing via macOS Keyboard Viewer

## Keyboard Layout Specifics

The Norwegian ColemakDH layout provides:
- Ergonomic finger placement optimized for Norwegian text
- Dead key support for accented characters
- Standard Norwegian characters (æ, ø, å) in accessible positions
- Modifier combinations for special symbols and characters