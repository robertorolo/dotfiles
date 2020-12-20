#!/bin/bash

echo "Installing programs..."
sleep 1

apt-get install xinit openbox obconf obmenu lxterminal leafpad firefox pcmanfm tint2 nitrogen lxappearance compton rofi

echo "copying dotfiles..."
sleep 1

path=$(pwd)

ln -sf $path/.xinitrc $HOME/.xinitrc
