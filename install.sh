#!/bin/bash

echo copying dotfiles to home directory
cp .xinitrc .bashrc .Xresources ~
cp -rp .local .config ~

echo giving permissions
sudo chmod +x ~/.xinitrc ~/.local/bin/*

echo Installing packages
sudo pacman -S $(cat progs)
