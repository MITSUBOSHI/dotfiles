# zsh options configuration

# ------------------------------
# Directory navigation
# ------------------------------
setopt auto_cd                # auto change directory
setopt auto_pushd            # auto directory pushd that you can get dirs list by cd -[tab]

# ------------------------------
# Correction
# ------------------------------
setopt correct               # command correct edition before each completion attempt

# ------------------------------
# List display
# ------------------------------
setopt list_packed          # compacked complete list display
setopt nolistbeep          # no beep sound when complete list displayed
setopt noautoremoveslash   # no remove postfix slash of command line

# ------------------------------
# Report time
# ------------------------------
export REPORTTIME=5

# ------------------------------
# Editor
# ------------------------------
export BLOCKSIZE=K
export EDITOR=vi
