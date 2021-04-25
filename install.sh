#!/bin/bash 

path=$(pwd)

echo "Install programs and dependencies?"
select de in yes no; do
	case $de in
		
		yes)
		echo "Installing i3 and some of your system dependencies..."
		sudo pacman -Syuu
		sudo pacman -S base-devel xorg-server xorg-xinit xorg-xrdb xf86-video-intel i3-gaps rofi ranger alsa-utils pulseaudio feh python-pywal xorg-xbacklight dunst libnotify scrot ueberzug xorg-xinput pcmanfm neovim xsel lxappearance otf-ipafont noto-fonts-emoji ttf-roboto-mono python-pip xclip mpv youtube-dl zathura zathura-pdf-mupdf transmission-cli picom alacritty rxvt-unicode sxiv tlp tp_smapi acpi_call

		sudo enable tlp.service
		sudo start tlp.service
		
		echo 'Instaling yay...'
		mkdir ~/.local
		mkdir ~/.local/src
		cd ~/.local/src
		git clone https://aur.archlinux.org/yay.git
		cd yay
		makepkg -si

		echo 'Instaling AUR and git programs...'
		yay -S polybar ttf-roboto otb-uw_ttyp0 sc-im brave ttf-iosevka terminus-font
		
		sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

		# If ~/.inputrc doesn't exist yet: First include the original /etc/inputrc
		# so it won't get overriden
		if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi

		# Add shell-option to ~/.inputrc to enable case-insensitive tab completion
		echo 'set completion-ignore-case On' >> ~/.inputrc

		wal --theme random_dark

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
sudo ln -sfv $path/tlp.conf /etc/tlp.conf 

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
#[ ! -d $HOME/.config/dunst ] && mkdir $HOME/.config/dunst
#ln -sfv $HOME/.cache/wal/dunstrc $HOME/.config/dunst/dunstrc
cp $path/config/dunst/dunstrc $HOME/.config/wal/templates/dunstrc 

#ranger
[ ! -d $HOME/.config/ranger ] && mkdir $HOME/.config/ranger
ln -sfv $path/config/ranger/rc.conf $HOME/.config/ranger/rc.conf

#nvim
[ ! -d $HOME/.config/nvim ] && mkdir $HOME/.config/nvim
ln -sfv $path/config/nvim/init.vim $HOME/.config/nvim/init.vim

#rofi
[ ! -d $HOME/.config/rofi ] && mkdir $HOME/.config/rofi
ln -sfv $path/config/rofi/config.rasi $HOME/.config/rofi/config.rasi

#alacritty
[ ! -d $HOME/.config/alacritty ] && mkdir $HOME/.config/alacritty
ln -sfv $path/config/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml

#sxiv
[ ! -d $HOME/.config/sxiv/exec ] && mkdir $HOME/.config/sxiv && mkdir $HOME/.config/sxiv/exec
ln -sfv $path/config/sxiv/exec/key-handler $HOME/.config/sxiv/exec/key-handler

#picom
[ ! -d $HOME/.config/picom ] && mkdir $HOME/.config/picom
ln -sfv $path/config/picom/picom.conf $HOME/.config/picom/picom.conf

#zathura
[ ! -d $HOME/.config/zathura ] && mkdir $HOME/.config/zathura
ln -sfv $path/config/zathura/zathurarc $HOME/.config/zathura/zathurarc

sudo chmod +x scripts/*

xdg-mime default feh.desktop image/jpeg
xdg-mime default feh.desktop image/png
xdg-mime default org.pwmt.zathura.desktop application/pdf
