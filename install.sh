#!/bin/bash

echo Installing packages
sudo pacman -S $(cat progs)

echo copying dotfiles to home directory
cp .xinitrc ~
cp -rp .local .config ~
