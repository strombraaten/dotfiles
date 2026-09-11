# dotfiles

Where I keep track of the configuration for the apps I use, plus a `Brewfile` so a new Mac gets set up fast.

## New machine setup

1. Install Git and Xcode Command Line Tools (needed before Homebrew):
   ```bash
   xcode-select --install
   ```
2. Install Homebrew if it's not already there:
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
   Follow the printed instructions to add `brew` to PATH.
3. Clone this repo and run the setup script:
   ```bash
   git clone https://github.com/strombraaten/dotfiles.git ~/dev/dotfiles
   cd ~/dev/dotfiles
   ./setup.sh
   ```
   This installs everything in `Brewfile` (apps + yabai/skhd) and symlinks the yabai/skhd config into place.

4. Grant permissions:
   - yabai: System Settings → Privacy & Security → Accessibility
   - skhd: Accessibility + Input Monitoring

## Apps not in the Brewfile (manual download)

| App | Link | Note |
|---|---|---|
| Bazecore (Dygma) | https://dygma.com/pages/raise-configuration | |
| Dropover | Mac App Store | no cask available |
| Screen Studio | https://screen.studio | |
| ScreenBrush | Mac App Store | |
| Beeper | — | probably blocked by a Telegram restriction |

## Configuration Overview

- **`Brewfile`** — every app/CLI tool used daily, installed via `brew bundle`
- **`yabai/`** — yabai window manager + skhd hotkey config

## Notes

- Configs are symlinked, so edits are automatically tracked by Git.
- Older configs (Karabiner, AeroSpace, SketchyBar, Leader Key, keyboard layout) that are no longer in daily use were removed for a leaner setup. The full history is preserved under the git tag `setup-oct-2025` if any of them are ever needed again.
