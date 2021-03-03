#!/bin/bash 

path=$(pwd)

echo "Install programs and dependencies?"
select de in yes no; do
	case $de in
		
		yes)
		echo "Installing i3 and some of your system dependencies..."
		sudo pacman -Syuu
		sudo pacman -S base-devel xorg-server xorg-xinit xorg-xrdb xf86-video-intel i3-gaps rxvt-unicode rofi qutebrowser ranger alsa-utils pulseaudio feh python-pywal xorg-xbacklight dunst libnotify scrot w3m xorg-xinput pcmanfm neovim xsel lxappearance otf-ipafont noto-fonts-emoji ttf-roboto-mono python-pip xclip xorg-xrdb mpv youtube-dl
		
		echo 'Instaling yay...'
		mkdir ~/.local
		mkdir ~/.local/src
		cd ~/.local/src
		git clone https://aur.archlinux.org/yay.git
		cd yay
		makepkg -si

		echo 'Instaling AUR and git programs...'
		yay -S polybar ttf-roboto otb-uw_ttyp0
		
		sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

		wal --theme base16-gruvbox-hard
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

ln -sfv $path/.xinitrc $HOME/.xinitrc
ln -sfv $path/.Xresources $HOME/.Xresources
ln -sfv $path/.bashrc $HOME/.bashrc
ln -sfv $path/.nanorc $HOME/.nanorc
ln -sfv $path/.gtkrc-2.0 $HOME/.gtkrc-2.0

# If ~/.inputrc doesn't exist yet: First include the original /etc/inputrc
# so it won't get overriden
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi

# Add shell-option to ~/.inputrc to enable case-insensitive tab completion
echo 'set completion-ignore-case On' >> ~/.inputrc

#Config directory
[ ! -d $HOME/.config ] && mkdir $HOME/.config

#i3
[ ! -d $HOME/.config/i3 ] && mkdir $HOME/.config/i3
ln -sfv $path/config/i3/config $HOME/.config/i3/config

#polybar
[ ! -d $HOME/.config/polybar ] && mkdir $HOME/.config/polybar
sudo chmod -v +x $path/config/polybar/launch.sh
ln -sfv $path/config/polybar/launch.sh $HOME/.config/polybar/launch.sh
ln -sfv $path/config/polybar/config $HOME/.config/polybar/config

#fonts
[ ! -d $HOME/.config/fontconfig ] && mkdir $HOME/.config/fontconfig
ln -sfv $path/config/fontconfig/fonts.conf $HOME/.config/fontconfig/fonts.conf

#dunst
[ ! -d $HOME/.config/dunst ] && mkdir $HOME/.config/dunst
ln -sfv $path/config/dunst/dunstrc $HOME/.config/dunst/dunstrc

#ranger
[ ! -d $HOME/.config/ranger ] && mkdir $HOME/.config/ranger
ln -sfv $path/config/ranger/rc.conf $HOME/.config/ranger/rc.conf

#gtk
[ ! -d $HOME/.config/gtk-3.0 ] && mkdir $HOME/.config/gtk-3.0
ln -sfv $path/config/gtk-3.0/settings.ini $HOME/.config/gtk-3.0/settings.ini

#qutebrowser
[ ! -d $HOME/.config/qutebrowser ] && mkdir $HOME/.config/qutebrowser
ln -sfv $path/config/qutebrowser/config.py $HOME/.config/qutebrowser/config.py
ln -sfv $path/config/qutebrowser/gruvbox.py $HOME/.config/qutebrowser/gruvbox.py

#nvim
[ ! -d $HOME/.config/nvim ] && mkdir $HOME/.config/nvim
ln -sfv $path/config/nvim/init.vim $HOME/.config/nvim/init.vim

#rofi
[ ! -d $HOME/.config/rofi ] && mkdir $HOME/.config/rofi
ln -sfv $path/config/rofi/config.rasi $HOME/.config/rofi/config.rasi
ln -sfv $path/config/rofi/gruvbox-dark-hard.rasi $HOME/.config/rofi/gruvbox-dark-hard.rasi

#theme
cp -r $path/.themes $HOME

#icons
#cp -r $path/.icons $HOME

sudo chmod +x scripts/*
