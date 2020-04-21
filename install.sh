#!/bin/bash

echo copying dotfiles to home directory
cp .xinitrc .bashrc .Xresources ~
cp -rp .local .config ~

echo giving permissions
sudo chmod +x ~/.xinitrc ~/.local/bin/*

echo Installing packages
sudo pacman -S $(cat progs)

echo Compiling suckless software
mkdir .local/src
cd .local/src
git clone git://git.suckless.org/dwm
cd dwm
sudo make clean install
cd ..
git clone git://git.suckless.org/dwm
cd st
sudo make clean install
cd ..
git clone git://git.suckless.org/dmenu
cd dmenu
sudo make clean install

echo We are ready to go
