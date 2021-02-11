#!/bin/bash

sudo pacman -S base-devel
echo 'Instaling yay...'
mkdir ~/.local
mkdir ~/.local/src
cd ~/.local/src
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

echo "Which DE you want to install?"

# Operating system names are used here as a data source
select de in xfce gnome kde i3; do

    case $de in
    xfe)
        echo "Installing xfce..."
        echo 'Installing xfce and some basic programs'
        sudo pacman -S xorg xfce4 xfce4-goodies lightdm lightdm-gtk-greeter chromium network-manager-applet pulseaudio pavucontrol xf86-video-intel bluez bluez-utils blueman file-roller evince flameshot sublime-text mpv transmission-gtk

        sudo systemctl enable lightdm
        sudo systemctl enable bluetooth

        yay -S qogir-gtk-theme qogir-icon-theme nord-xfce-terminal 
        
        break
        ;;
    gnome)
        echo "Installing gnome..."
        sudo pacman -S gnome gnome-extra gdm
        
        sudo systemctl enable gdm
        
        break
        ;;
    kde)
        echo "Installing kde..."
        sudo pacman -S xorg plasma-meta kde-applications 
        
        sudo systemctl enable sddm 
    
        break
        ;;
    i3)
	echo "Installing i3..."

	sudo pacman -S  xorg xorg-xinit xf86-video-intel i3-gaps i3status rxvt-unicode dmenu qutebrowser ranger 

	echo "copying dotfiles..."
	cd ~
	sleep 1

	path=$(pwd)

	ln -sf $path/.xinitrc $HOME/.xinitrc

	#Config directory
	#[ ! -d $HOME/.config ] && mkdir $HOME/.config

	#fonts
	#[ ! -d $HOME/.config/fontconfig ] && mkdir $HOME/.config/fontconfig
	#ln -sf $path/.fonts.conf $HOME/.config/fontconfig/fonts.conf

	break
	;;
    *)
        echo "Invalid entry."
        ;;
    esac

done

#echo "Installing some fancy fonts..."
#yay -S ttf-jetbrains-mono ttf-ms-fonts ttf-ubuntu-font-family ttf-iosevka nerd-fonts-sf-mono 

sudo pacman -S noto-fonts ttf-fira-code ttf-cascadia-code
