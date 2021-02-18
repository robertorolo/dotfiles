#!/bin/bash

path=$(pwd)
sudo chmod +x scripts/*

sudo pacman -Syuu

sudo pacman -S base-devel
echo 'Instaling yay...'
mkdir ~/.local
mkdir ~/.local/src
cd ~/.local/src
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

echo "Which DE or WM you want to install?"

# Operating system names are used here as a data source
select de in xfce gnome kde i3; do

    case $de in
    xfe)
        echo "Installing xfce..."
        echo 'Installing xfce and some basic programs'
        sudo pacman -S xorg xfce4 xfce4-goodies lightdm lightdm-gtk-greeter chromium network-manager-applet pulseaudio pavucontrol xf86-video-intel picom  bluez bluez-utils blueman file-roller evince flameshot sublime-text mpv transmission-gtk

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
	echo "Installing i3 and some basic progrmas..."

	sudo pacman -S xorg-server xorg-xinit xorg-xrdb xf86-video-intel i3-gaps rxvt-unicode dmenu qutebrowser chromium  ranger alsa-utils pulseaudio feh python-pywal xorg-xbacklight dunst libnotify scrot w3m xorg-xinput pcmanfm vim lxappearance otf-ipafont
	
	yay -S polybar qogir-gtk-theme qogir-icon-theme 
	
	echo "copying dotfiles..."

	ln -sf $path/.xinitrc $HOME/.xinitrc
	ln -sf $path/.Xresources $HOME/.Xresources
	ln -sf $path/.bashrc $HOME/.bashrc
	ln -sf $path/.nanorc $HOME/.nanorc
	ln -sf $path/.gtkrc-2.0 $HOME/.gtkrc-2.0
	ln -sf $path/.vimrc $HOME/.vimrc

	#Config directory
	[ ! -d $HOME/.config ] && mkdir $HOME/.config

	#i3
	[ ! -d $HOME/.config/i3 ] && mkdir $HOME/.config/i3
	ln -sf $path/config/i3/config $HOME/.config/i3/config
	
	#polybar
	[ ! -d $HOME/.config/polybar ] && mkdir $HOME/.config/polybar
	ln -sf $path/config/polybar/launch.sh $HOME/.config/polybar/launch.sh
	sudo chmod +x $HOME/.config/polybar/launch.sh
	ln -sf $path/config/polybar/config $HOME/.config/polybar/config
	
	#fonts
	[ ! -d $HOME/.config/fontconfig ] && mkdir $HOME/.config/fontconfig
	ln -sf $path/config/fontconfig/fonts.conf $HOME/.config/fontconfig/fonts.conf
	
	#dunst
	[ ! -d $HOME/.config/dunst ] && mkdir $HOME/.config/dunst
	ln -sf $path/config/dunst/dunstrc $HOME/.config/dunst/dunstrc

	#ranger
	[ ! -d $HOME/.config/ranger ] && mkdir $HOME/.config/ranger
        ln -sf $path/config/ranger/rc.conf $HOME/.config/ranger/rc.conf
	
	#gtk
	[ ! -d $HOME/.config/gtk-3.0 ] && mkdir $HOME/.config/gtk-3.0
        ln -sf $path/config/gtk-3.0/settings.ini $HOME/.confing/gtk-3.0/settings.ini

	wal -i $path/wallpaper.*
	
	break
	;;
    *)
        echo "Invalid entry."
        ;;
    esac

done

echo "Installing some fancy fonts..."
yay -S ttf-ubuntu-font-family otb-uw_ttyp0
sudo pacman -S noto-fonts-emoji ttf-fira-code ttf-cascadia-code awesome-terminal-fonts
