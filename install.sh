#!/bin/bash

echo "Installing programs..."
sleep 1

apt-get install xinit openbox obconf obmenu lxterminal leafpad firefox pcmanfm tint2 nitrogen

path=$(pwd)

ln -sf $path/.xinitrc $HOME/.xinitrc
apt-get install xinit openbox obconf obmenu alacrity leafpad firefox  
