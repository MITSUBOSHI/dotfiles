# History configuration

HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
HISTSIZE=10000
SAVEHIST=10000

# Create history directory if it doesn't exist
[[ -d "${HISTFILE:h}" ]] || mkdir -p "${HISTFILE:h}"

setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
