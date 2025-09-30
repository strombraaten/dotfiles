# Karabiner-Elements Configuration

This directory contains the Karabiner-Elements configuration for key remapping and shortcuts.

## Setup Instructions

### First Time Setup (copy config from existing machine):
1. On your existing Mac with Karabiner configured, copy the config:
   ```bash
   scp ~/.config/karabiner/karabiner.json [new-mac]:~/dev/dotfiles/karabiner/
   ```

2. On the new Mac, create symlink to use this config:
   ```bash
   # Backup existing config if it exists
   mv ~/.config/karabiner/karabiner.json ~/.config/karabiner/karabiner.json.backup 2>/dev/null || true
   
   # Create symlink
   ln -s ~/dev/dotfiles/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
   ```

### Verify Setup:
```bash
ls -la ~/.config/karabiner/karabiner.json
# Should show: ~/.config/karabiner/karabiner.json -> /Users/[username]/dev/dotfiles/karabiner/karabiner.json
```

## Notes
- Only `karabiner.json` is version controlled to avoid app-managed files
- The `assets/` directory remains local to each machine
- Changes to keymaps will be automatically synced via this dotfiles repo