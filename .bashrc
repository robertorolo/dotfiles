#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
# Lambda PS1
PS1="\[\e[00;34m\]λ \W \[\e[0m\]"

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

export PATH=~/dotfiles/scripts:$PATH
export PF_INFO="title os host kernel uptime pkgs wm shell palette"

EDITOR=vim
#BROWSER=chromium
#BROWSER=qutebrowser

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

alias v='vim'
alias g='git'
alias f='pfetch'
alias c='colorscript -r'
alias wg='ranger $HOME/Google\ Drive/Images/wg '
alias i3conf='v $HOME/.config/i3/config'
alias r='ranger'

shopt -s cdspell

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/void/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/void/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/void/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/void/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
