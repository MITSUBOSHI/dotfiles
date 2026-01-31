# Keybinding configuration

# Emacs like keybind
bindkey -e

# Historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
zle -N do_enter

bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward
bindkey '^m' do_enter

# peco history selection
if command -v peco &>/dev/null; then
  function peco-history-selection() {
      BUFFER=$(history -n 1 | tac | awk '!a[$0]++' | peco)
      CURSOR=$#BUFFER
      zle reset-prompt
  }

  zle -N peco-history-selection
  bindkey '^R' peco-history-selection
fi
