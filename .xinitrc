#!/bin/sh

for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
    [ -x "$f" ] && . "$f"
done
unset f

xrdb ~/.Xresources

# -R restores the last colorscheme that was in use.
#wal -R

teclado.sh
touchpadandtrackpoint.sh

#sh ~/.fehbg
[ -d ~/wg/ ] && random_wpp.sh $HOME/google_drive/Images/wg

xset r rate 300 50

dunst &

exec i3
