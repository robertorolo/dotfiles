#!/bin/bash

echo "Installing programs..."
sleep 1

apt-get install lightdm openbox obconf obmenu lxterminal leafpad firefox

path=$(pwd)

ln -sf $path/.xinitrc $HOME/.xinitrc
apt-get install xinit openbox obconf obmenu alacrity leafpad firefox  
