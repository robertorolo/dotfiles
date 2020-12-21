#!/bin/bash

echo "Installing programs..."
sleep 1

pacman -S xorg-init qtile kitty nitrogen

pip3 install --user pywal

echo "copying dotfiles..."
sleep 1

path=$(pwd)

ln -sf $path/.xinitrc $HOME/.xinitrc

# Config directory
[ ! -d $HOME/.config ] && mkdir $HOME/.config
