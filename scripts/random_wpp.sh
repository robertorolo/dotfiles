#!/bin/bash

WLPDIR="$HOME/wg/"

files=($WLPDIR*)
wlpfile=${files[RANDOM % ${#files[@]}]}
printf "Setting wallpaper to %s\n" "$wlpfile"
feh --bg-fill "$wlpfile"
