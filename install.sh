#!/bin/bash

while true; do
    read -p 'Install xfce? yes/no: ' input
    case $input in
        [yY]*)
            echo 'Installing xfce'
		        pacman -S xorg xfce4 xfce4-goodies lightdm lightdm-gtk-greeter chromium network-manager-applet pulseaudio pavucontrol xf86-video-intel bluez blueman
				
		        systemctl enable lightdm
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
