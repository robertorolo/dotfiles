#!/bin/bash

echo "Installing programs..."
sleep 1

pacman -S xorg-server xorg-xinit qtile kitty nitrogen

echo "copying dotfiles..."
sleep 1

path=$(pwd)

ln -sf $path/.xinitrc $HOME/.xinitrc

# Config directory
[ ! -d $HOME/.config ] && mkdir $HOME/.config
