#!/bin/bash

while true; do
    read -p 'Install xfce? yes/no: ' input
    case $input in
        [yY]*)
		echo 'Installing xfce and some basic programs'
		sudo pacman -S xorg xfce4 xfce4-goodies lightdm lightdm-gtk-greeter chromium network-manager-applet pulseaudio pavucontrol xf86-video-intel bluez bluez-utils file-roller evince flameshot sublime-text mpv transmission-gtk

		sudo systemctl enable lightdm
		sudo systemctl enable bluetooth

		echo 'Instaling yay'
		echo Installing yay
		mkdir ~/.local/src
		cd ~/.local/src
		git clone https://aur.archlinux.org/yay.git
		cd yay
		makepkg -si

		echo 'Installing yay packages'
		yay -S qogir-gtk-theme qogir-icon-theme ttf-jetbrains-mono ttf-ms-fonts ttf-ubuntu-font-family nord-xfce-terminal 
            break
            ;;
        [nN]*)
            echo 'Continue installation.'
            exit 1
            ;;
         *)
            echo 'Invalid input' >&2
    esac
done

echo "copying dotfiles..."
sleep 1

path=$(pwd)

#ln -sf $path/.xinitrc $HOME/.xinitrc

# Config directory
#[ ! -d $HOME/.config ] && mkdir $HOME/.config
