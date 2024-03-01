#!/bin/bash
if [ "$(whoami)" == "root" ]; then
    exit 1
fi

archivos=$(pwd)

#instalamo la mierda esta xd
sudo pacman -Syu
sudo pacman -S i3-wm zsh awesome-terminal-fonts polybar rofi picom feh sddm nvim chromium flameshot ranger kitty  gst-libav phonon-qt5-gstreamer gst-plugins-good qt5-quickcontrols qt5-graphicaleffects qt5-multimedia



#copio las fuentes todas hackeadoras
mkdir $HOME/.local
cp -r $archivos/fonts $HOME/.local/


sudo unzip $archivos/fonts/hack.zip /usr/share/fonts/

#la config

cp -r $archivos/i3 $HOME/.config
cp -r $archivos/neofetch $HOME/.config
cp -r $archivos/rofi $HOME/.config
cp -r $archivos/kitty $HOME/.config
cp -r $archivos/polybar $HOME/.config
sudo cp -r $archivos/zsh/ /usr/share/
sudo cp -r $archivos/zsh-sudo /usr/share
sudo cp $archivos/picom.conf /etc/xdg/
sudo chmod +x $HOME/.config/polybar/scripts/checkupdates
sudo chmod +x $HOME/.config/polybar/scripts/updates.sh
cp $archivos/wp.jpg $HOME
cp $archivos/neo.jpg $HOME

#iniciamos la mierda esta xd
systemctl enable sddm.service
sudo cp -r $archivos/aerial-sddm-theme-master/ /usr/share/sddm/themes/
sudo cp -r $archivos/sddm.conf.d/ /etc/

#install powerlevel10k bitch
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

cp -r $archivos/powerlevel10k $HOME
sudo -r $archivos/zsh-sudo/ /usr/share/
sudo -r $archivos/zsh/ /usr/share
