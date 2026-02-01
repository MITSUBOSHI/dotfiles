# ~/.config/zsh/tools.zsh
# Tool initializations and environment setup

# ------------------------------
# Homebrew
# ------------------------------
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

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

# ------------------------------
# git worktree (wt)
# ------------------------------
if command -v git &>/dev/null && git wt --init zsh &>/dev/null 2>&1; then
  eval "$(git wt --init zsh)"

  # Helper function to select worktree with peco
  wt() {
    git wt "$(git wt | tail -n +2 | peco | awk '{print $(NF-1)}')"
  }
fi

# ------------------------------
# PATH extensions
# ------------------------------
# libpq (PostgreSQL client)
if [[ -d /opt/homebrew/opt/libpq/bin ]]; then
  export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
fi

# Ubie eng-tools
if [[ -d $HOME/ghq/github.com/ubie-inc/eng-tools ]]; then
  export PATH="$HOME/ghq/github.com/ubie-inc/eng-tools:$PATH"
fi

# Local bin
if [[ -f "$HOME/.local/bin/env" ]]; then
  source "$HOME/.local/bin/env"
fi

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# ------------------------------
# NPM/Node authentication
# ------------------------------
if [[ -f $HOME/.npm_access_token ]]; then
  export NPM_AUTH_TOKEN=$(cat $HOME/.npm_access_token)
  export NODE_AUTH_TOKEN=$(cat $HOME/.npm_access_token)
fi

# ------------------------------
# Google Cloud SDK
# ------------------------------
if [[ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]]; then
  source "$HOME/google-cloud-sdk/path.zsh.inc"
fi

if [[ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]]; then
  source "$HOME/google-cloud-sdk/completion.zsh.inc"
fi
