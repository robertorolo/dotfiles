#!/bin/sh

#adding scripts folder to PATH so dmenu can see my scripts
export PATH="$HOME/.local/bin:$PATH"

exec dwm
