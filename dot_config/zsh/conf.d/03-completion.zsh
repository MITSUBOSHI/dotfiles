# Completion configuration

# Initialize completion system
autoload -U compinit
compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"

# Create cache directory if it doesn't exist
[[ -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh" ]] || mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}/zsh"

# Enable completion for aliases
setopt complete_aliases
