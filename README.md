# dotfiles

Modern dotfiles managed with chezmoi, featuring XDG Base Directory compliance and plugin management with sheldon.

## Features

- **Modern structure**: Uses `~/.config` for configuration files (XDG Base Directory)
- **Plugin management**: Uses [sheldon](https://sheldon.cli.rs/) instead of git submodules
- **Clean organization**: Separated by functionality (options, history, completion, keybind, prompt, aliases)
- **Tool initialization**: Automatic setup for rbenv, goenv, direnv, pyenv, volta, and more
- **Managed with chezmoi**: Easy deployment and synchronization across machines

## Setup

### Install chezmoi and clone this repository

```bash
# Install chezmoi (macOS)
brew install chezmoi

# Clone this repository
git clone https://github.com/MITSUBOSHI/dotfiles.git ~/ghq/github.com/MITSUBOSHI/dotfiles

# Create symlink to chezmoi source directory
rm -rf ~/.local/share/chezmoi
ln -s ~/ghq/github.com/MITSUBOSHI/dotfiles ~/.local/share/chezmoi

# Initialize dotfiles
chezmoi init

# Preview changes
chezmoi diff

# Apply dotfiles
chezmoi apply
```

The `run_once_install-sheldon.sh.tmpl` script will automatically install sheldon on first run.

## Directory Structure

```
dotfiles/
├── dot_zshenv                         # Environment variables
├── dot_zshrc                          # Main zsh configuration
├── dot_config/
│   ├── zsh/
│   │   ├── conf.d/
│   │   │   ├── 01-options.zsh        # zsh options
│   │   │   ├── 02-history.zsh        # History settings
│   │   │   ├── 03-completion.zsh     # Completion settings
│   │   │   ├── 04-keybind.zsh        # Keybindings
│   │   │   ├── 05-prompt.zsh         # Prompt configuration
│   │   │   └── 10-aliases.zsh        # Aliases
│   │   ├── functions/                # Custom functions
│   │   │   ├── cd                    # Auto-ls after cd
│   │   │   ├── cd-git-root           # Jump to git root
│   │   │   ├── do_enter              # Custom enter behavior
│   │   │   ├── ls_abbrev             # Abbreviated ls
│   │   │   └── rprompt_git_current_branch  # Git branch in prompt
│   │   └── tools.zsh                 # Tool initialization
│   ├── git/
│   │   └── config                    # Git configuration
│   └── sheldon/
│       └── plugins.toml              # Plugin configuration
├── dot_tmux.conf                     # tmux configuration
└── run_once_install-sheldon.sh.tmpl  # Auto-install sheldon
```

## Managed Files

- `.zshenv`: Environment variables, XDG Base Directory setup
- `.zshrc`: Main zsh configuration, loads all modules
- `.config/zsh/`: All zsh configuration files
- `.config/git/config`: Git aliases with peco integration
- `.config/sheldon/plugins.toml`: zsh plugins (syntax-highlighting, autosuggestions, completions)
- `.tmux.conf`: tmux configuration

## Adding New Files

```bash
# Add a single file
chezmoi add ~/.zshrc

# Add a directory recursively
chezmoi add -r ~/.config/zsh

# Edit a file with chezmoi
chezmoi edit ~/.zshrc
```

## Making Changes

```bash
# Edit files directly in the source directory
cd ~/.local/share/chezmoi
# Make your changes

# Preview changes
chezmoi diff

# Apply changes
chezmoi apply
```

## Syncing Changes

```bash
cd ~/.local/share/chezmoi
git add .
git commit -m "Update dotfiles"
git push
```

## Plugins

Managed by sheldon (`~/.config/sheldon/plugins.toml`):

- **zsh-syntax-highlighting**: Syntax highlighting for commands
- **zsh-autosuggestions**: Fish-like autosuggestions
- **zsh-completions**: Additional completion definitions

To update plugins:

```bash
sheldon lock --update
```

## Tools Automatically Initialized

- Ruby: rbenv, rvm
- Go: goenv
- PHP: phpenv
- Python: pyenv
- Node.js: nvm, volta
- Multi-version managers: anyenv, asdf
- Others: direnv, opam

## Dependencies

- [chezmoi](https://www.chezmoi.io/): Dotfiles manager
- [sheldon](https://sheldon.cli.rs/): Plugin manager (auto-installed)
- [peco](https://github.com/peco/peco): Interactive filtering tool (optional)
- [ghq](https://github.com/x-motemen/ghq): Repository management (optional)
