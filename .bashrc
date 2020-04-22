#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#auto start X
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

#adding scripts folder to PATH
export PATH="$HOME/.local/bin:$PATH"

#setting more enviroment variables
export BROWSER=/bin/chromium
export EDITOR=/bin/vim
