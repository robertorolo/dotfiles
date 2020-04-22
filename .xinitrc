#!/bin/sh

#adding scripts folder to PATH so dmenu can see my scripts
export PATH="$HOME/.local/bin:$PATH"

#setting wallpaper
xwallpaper --zoom ~/.local/wallpaper.png

#load xrdb
xrdb ~/.Xresources

#configuring trackpoint and trackpad
xinput set-prop 12 321 -1
xinput set-prop 11 309 1

#starting programs
dropbox &
compton &

#start WM
exec dwm
