#!/bin/bash

echo "Install programs and dependencies?"
select de in yes no; do
	case $de in
		
		yes)
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

		echo "Installing i3 and some your system dependencies..."
		sudo pacman -S xorg-server xorg-xinit xorg-xrdb xf86-video-intel i3-gaps rxvt-unicode dmenu qutebrowser chromium  ranger alsa-utils pulseaudio feh python-pywal xorg-xbacklight dunst libnotify scrot w3m xorg-xinput pcmanfm neovim lxappearance otf-ipafont
		yay -S polybar qogir-gtk-theme qogir-icon-theme 

		echo "Installing some fancy fonts..."
		yay -S ttf-ubuntu-font-family ttf-roboto otb-uw_ttyp0
		sudo pacman -S noto-fonts-emoji ttf-fira-code ttf-cascadia-code awesome-terminal-fonts

		wal -i $path/wallpaper.*

		break
		;;

		no)
		break
		;;

		*)
		echo "Invalid entry."
		;;
	esac

done

echo "copying dotfiles..."

sudo chmod +x $path/config/polybar/launch.sh

ln -sf $path/.xinitrc $HOME/.xinitrc
ln -sf $path/.Xresources $HOME/.Xresources
ln -sf $path/.bashrc $HOME/.bashrc
ln -sf $path/.nanorc $HOME/.nanorc
ln -sf $path/.gtkrc-2.0 $HOME/.gtkrc-2.0

#Config directory
[ ! -d $HOME/.config ] && mkdir $HOME/.config

#i3
[ ! -d $HOME/.config/i3 ] && mkdir $HOME/.config/i3
ln -sf $path/config/i3/config $HOME/.config/i3/config

#polybar
[ ! -d $HOME/.config/polybar ] && mkdir $HOME/.config/polybar
#sudo chmod +x $path/config/polybar/launch.sh
ln -sf $path/config/polybar/launch.sh $HOME/.config/polybar/launch.sh
#sudo chmod +x $HOME/.config/polybar/launch.sh
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
ln -sf $path/config/gtk-3.0/settings.ini $HOME/.config/gtk-3.0/settings.ini

#qutebrowser
[ ! -d $HOME/.config/qutebrowser ] && mkdir $HOME/.config/qutebrowser
ln -sf $path/config/qutebrowser/autoconfig.yml $HOME/.config/qutebrowser/autoconfig.yml

#nvim
[ ! -d $HOME/.config/nvim ] && mkdir $HOME/.config/nvim
ln -sf $path/config/nvim/init.vim $HOME/.config/nvim/init.vim
