#!/bin/bash

WLPDIR="$1"

files=($WLPDIR*)
wlpfile=${files[RANDOM % ${#files[@]}]}
printf "Setting wallpaper to %s\n" "$wlpfile"
wal -i "$wlpfile"
#feh --bg-fill "$wlpfile"
