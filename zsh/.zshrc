# ~/.zshrc
# Symlinked from dotfiles/zsh/.zshrc — see setup.sh

HOMEBREW_PREFIX="$(brew --prefix)"

# History (kept for zsh built-ins that still read it; Atuin below replaces
# interactive search)
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Autosuggestions (fish-style "grey text" suggestions from history)
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Syntax highlighting (must be sourced last, after other plugins)
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Starship prompt
eval "$(starship init zsh)"

# Atuin: cross-session searchable history (ctrl+r takes over history search)
eval "$(atuin init zsh)"
export PATH="$HOME/.local/bin:$PATH"
