#!/bin/sh

for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
    [ -x "$f" ] && . "$f"
done
unset f

#xrdb ~/.Xresources

# -R restores the last colorscheme that was in use.
wal -R

teclado
touchpadandtrackpoint

sh ~/.fehbg
#[ -d ~/wg/ ] && random_wpp $~/wg

xset r rate 300 50

dunst &

picom &

#exec i3
exec qtile start
