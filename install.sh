#!/bin/bash

echo "Installing programs..."
sleep 1

pacman -S xinit openbox obconf obmenu lxterminal leafpad firefox pcmanfm tint2 nitrogen lxappearance compton rofi 

echo "copying dotfiles..."
sleep 1

path=$(pwd)

ln -sf $path/.xinitrc $HOME/.xinitrc

# Config directory
[ ! -d $HOME/.config ] && mkdir $HOME/.config

# openbox
[ ! -d $HOME/.config/openbox ] && mkdir $HOME/.config/openbox
ln -sf $path/autostart $HOME/.config/openbox/autostart
ln -sf $path/rc.xml $HOME/.config/openbox/rc.xml
ln -sf $path/menu.xml $HOME/.config/openbox/menu.xml

# tint2
[ ! -d $HOME/.config/tint2 ] && mkdir $HOME/.config/tint2
ln -sf $path/tint2rc $HOME/.config/tint2/tint2rc
