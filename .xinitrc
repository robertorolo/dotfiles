#!/bin/sh

#adding scripts folder to PATH so dmenu can see my scripts
export PATH="$HOME/.local/bin:$PATH"

#setting wallpaper
xwallpaper --zoom ~/.local/wallpaper.png

#load xrdb
xrdb ~/.Xresources

#configuring trackpoint and trackpad
xinput set-prop 12 319 -1
xinput set-prop 11 307 1

#configuring keyboard
setxkbmap -layout gb -variant intl

#starting programs
dropbox &
xcompmgr &
statusbar &
dunst &

#start WM
exec dwm
