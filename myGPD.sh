#!/bin/bash

##MyGpd##
##PixelAce

##Update System##
sudo pacman -Syu --noconfirm
sudo pacman -Syy --noconfirm

##Uninstall Apps##
echo '
archcraft-help
archcraft-about
xarchiver
gpick
meld
nitrogen
plank
atril
baobab
xfce4-terminal
timeshift
gparted' > removeApps.txt

sudo pacman -Rns --noconfirm - < removeApps.txt

##Install Apps#
echo '
archcraft-i3wm
heroic-games-launcher-bin
python
python-pip
mangohud
lib32-mangohud
sublime-text-4
stremio
youtube-music-bin
cmatrix
gotop
gnome-disk-utility
fish' > installApps.txt

sudo pacman -S --noconfirm - < installApps.txt

##.config##
cp -r config/i3/ /home/$USER/.config/			#Polybar/Wallpaper/Alacritty/Rofi
cp -r config/MangoHud/ /home/$USER/.config/	#Mangohud

##.icons##
cp -r icons/default/ /home/$USER/.icons/		#Tema do mouse

##/etc##
sudo cp -r etc/default/ /etc/					#Grub
sudo cp -r etc/sddm.conf.d/ /etc/				#Tema do mouse do Sddm

##SDDM##
sudo cp -r usr/share/sddm/themes/archcraft/ /usr/share/sddm/themes/	#Wallpaper Sddm
sudo cp -r usr/share/sddm/scripts/ /usr/share/sddm/		#Configura Sddm

##Apply grub config##
sudo update-grub
