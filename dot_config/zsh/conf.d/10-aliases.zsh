# Aliases configuration

# expand aliases before completing
setopt complete_aliases # aliased ls needs if file/dir completions work

# Basic aliases
alias a=alias
alias du="du -h"
alias df="df -h"
alias h="history"
alias j="jobs -l"
alias sc="screen -D -RR"
alias screen="screen -D -RR"
alias su="su -l"
alias va="vagrant"
alias where="command -v"

# ls aliases
case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -G -w"
  ;;
linux*)
  alias ls="ls --color"
  ;;
esac

alias la="ls -aF"
alias lf="ls -F"
alias ll="ls -lF"
alias lla="ls -alF"

# tac fallback (GNU coreutils not installed on macOS by default)
if ! command -v tac &>/dev/null; then
  alias tac="tail -r"
fi

# URL encoding/decoding
alias urlencode="nkf -wMQ | tr = %"
alias urldecode="nkf --url-input"

# SSH config.d support
if [ -d ~/.ssh/conf.d ]; then
  alias ssh=": > ~/.ssh/config && echo '# DO NOT EDIT! Please edit conf.d/' >> ~/.ssh/config && find ~/.ssh/conf.d -type f | grep -v '/\.git' | xargs cat >> ~/.ssh/config; ssh"
fi

# Docker -> Finch
alias docker="finch"

# KDE open
if [[ -x "$(which kde-open)" ]]; then
  alias open="kde-open"
fi
