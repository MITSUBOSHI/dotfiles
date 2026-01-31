# Tool initialization

# ------------------------------
# Ruby
# ------------------------------
if command -v rbenv &>/dev/null; then
  eval "$(rbenv init - zsh)"
elif [[ -s $HOME/.rvm/scripts/rvm ]]; then
  source $HOME/.rvm/scripts/rvm
fi

# ------------------------------
# Go
# ------------------------------
if [[ -d /usr/local/go/bin ]]; then
  export PATH=$PATH:/usr/local/go/bin
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOPATH/bin
fi

if [[ -d $HOME/.goenv ]]; then
  export GOENV_ROOT="$HOME/.goenv"
  export PATH="$GOENV_ROOT/bin:$PATH"
  export GOENV_DISABLE_GOPATH=1
  eval "$(goenv init -)"
fi

if [[ -d $HOME/go ]]; then
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOPATH/bin
fi

# ------------------------------
# PHP
# ------------------------------
if command -v phpenv &>/dev/null; then
  eval "$(phpenv init - zsh)"
fi

# ------------------------------
# anyenv
# ------------------------------
if command -v anyenv &>/dev/null; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
fi

# ------------------------------
# direnv
# ------------------------------
if command -v direnv &>/dev/null; then
  eval "$(direnv hook zsh)"
fi

# ------------------------------
# opam
# ------------------------------
if command -v opam &>/dev/null; then
  source "$HOME/.opam/opam-init/init.zsh"
fi

# ------------------------------
# asdf
# ------------------------------
if command -v asdf &>/dev/null; then
  source "$(brew --prefix asdf)/libexec/asdf.sh"
fi

# ------------------------------
# pyenv
# ------------------------------
if [[ -d $HOME/.pyenv ]]; then
  export PYENV_ROOT=$HOME/.pyenv
  export PATH=$PYENV_ROOT/bin:$PATH
  eval "$(pyenv init -)"
fi

# ------------------------------
# PostgreSQL
# ------------------------------
export PGDATA=/usr/local/var/postgres

# ------------------------------
# JVM SBT
# ------------------------------
export SBT_OPTS='-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=1024M'

# ------------------------------
# Haskell
# ------------------------------
if [[ -d $HOME/.cabal ]]; then
  export PATH=$PATH:$HOME/.cabal/bin
fi

# ------------------------------
# kubectl krew
# ------------------------------
if [[ -d $HOME/.krew ]]; then
  export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
fi

# ------------------------------
# User local script
# ------------------------------
if [[ -d $HOME/bin ]]; then
  export PATH=$PATH:$HOME/bin
fi

# ------------------------------
# nvm
# ------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && source "/usr/local/opt/nvm/nvm.sh"

# ------------------------------
# volta
# ------------------------------
if [[ -d $HOME/.volta ]]; then
  export VOLTA_HOME="$HOME/.volta"
  export PATH="$VOLTA_HOME/bin:$PATH"
fi
