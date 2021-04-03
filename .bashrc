#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -hN --color=auto --group-directories-first'
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

#vi mode
set -o vi

export PATH=~/dotfiles/scripts:$PATH
export PF_INFO="title os host kernel uptime pkgs wm shell palette"

export EDITOR=nvim;
export VISUAL=nvim;
#export BROWSER=qutebrowser;
export BROWSER=brave;
#export TERMINAL=urxvt;
export TERMINAL=alacritty;
export READER=zathura;

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

alias v='nvim'
alias g='git'
alias f='pfetch'
alias fm='macchina  -b --no-ascii --no-box'
alias p='sudo pacman'
alias r='ranger'
alias tsm='transmission-remote'
alias rw='random_wpp.sh $HOME/google_drive/Images/wg'
alias rdt='wal --theme random_dark && killall dunst && notify-send "random dark theme applied!"'
alias rlt='wal --theme random_light && killall dunst && notify-send "random light theme applied!"'
alias drh='conda activate drh'
alias geostat='conda activate geostat'
alias jp='jupyter notebook'
alias clima='curl wttr.in/~Porto+Alegre'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'

alias tpoff='xinput set-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 0 && notify-send "Trackpad off"'
alias tpon='xinput set-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 1 && notify-send "Trackpad on"'

# Extracts any archive(s) (if unp isn't installed)
extract () {
	for archive in $*; do
		if [ -f $archive ] ; then
			case $archive in
				*.tar.bz2)   tar xvjf $archive    ;;
				*.tar.gz)    tar xvzf $archive    ;;
				*.bz2)       bunzip2 $archive     ;;
				*.rar)       rar x $archive       ;;
				*.gz)        gunzip $archive      ;;
				*.tar)       tar xvf $archive     ;;
				*.tbz2)      tar xvjf $archive    ;;
				*.tgz)       tar xvzf $archive    ;;
				*.zip)       unzip $archive       ;;
				*.Z)         uncompress $archive  ;;
				*.7z)        7z x $archive        ;;
				*)           echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}

senha () {
	
	cat "$1" | grep -i $2

}

shopt -s cdspell
shopt -s autocd

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

