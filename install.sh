#!/bin/bash

echo copying dotfiles to home directory
cp .xinitrc .bashrc .Xresources .vimrc .gitconfig ~
cp -rp .local .config ~

echo copying other config files
sudo cp 20-intel.conf /etc/X11/xorg.conf.d

echo giving permissions
sudo chmod +x ~/.xinitrc ~/.bashrc ~/.local/bin/* ~/.config/sxiv/exec/key-handler

echo Installing packages
sudo pacman -S $(cat progs)

echo Installing yay
mkdir ~/.local/src
cd ~/.local/src
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

echo Installing yay packages
yay -S $(cat ~/dotfiles/progs_aur)

echo Compiling suckless software
cd ..
git clone https://github.com/robertorolo/dwm.git
cd dwm
sudo make clean install
cd ..
git clone https://github.com/LukeSmithxyz/st.git
cd st
sudo make clean install
cd ..
git clone git://git.suckless.org/dmenu
cd dmenu
sudo make clean install

echo Enabling services
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
sudo echo "AutoEnable=true" >> /etc/bluetooth/main.conf

sudo systemctl enable tlp.service
sudo systemctl start tlp.service

echo We are ready to go
