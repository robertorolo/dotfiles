#!/bin/sh

for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
    [ -x "$f" ] && . "$f"
done
unset f

xrdb ~/.Xresources

# -R restores the last colorscheme that was in use.
wal -R

exec i3
