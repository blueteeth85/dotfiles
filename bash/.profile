#config directory
dotfiles=$HOME/.dotfiles/bash

# load additional paths
source $dotfiles/path.bash

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
if [ -f ~/.localprofile ]; then
    . ~/.localprofile
fi
