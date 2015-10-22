# bash params
export TERM=xterm
export CLICOLOR=1

HISTCONTROL=ignoreboth
HISTSIZE=10000
SAVEHIST=10000

shopt -s histappend

shopt -s checkwinsize

#config directory
dotfiles=$HOME/.dotfiles/bash

# all of our bash files
config_files=($dotfiles/*.bash)
config_files=(${config_files[@]/*\/path.bash/})
config_files=(${config_files[@]/*\/functions.bash/})

# load all functions
source $dotfiles/functions.bash

# load additional paths
source $dotfiles/path.bash

# load everything else
for file in "${config_files[@]}"
do
  source $file
done

unset config_files
unset dotfiles

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
if [ -f ~/.localbashrc ]; then
    source ~/.localbashrc
fi

if [ -f ~/.dir_colors ]; then
    eval `dircolors ~/.dir_colors`
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
    fi
fi


# set hostname
export HOSTNAME=`uname -n`
