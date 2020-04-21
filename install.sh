#!/bin/bash

echo copying dotfiles to home directory
cp .xinitrc .bashrc .Xresources ~
cp -rp .local .config ~

echo giving permissions
sudo chmod +x ~/.xinitrc ~/.local/bin/*

echo Installing packages
sudo pacman -S $(cat progs)

echo Compiling suckless software
cd .local/src/dwm
sudo make clean Install
cd ..
cd st 
sudo make clean install
cd ..
cd dmenu
sudo make clean install

echo We are ready to go
