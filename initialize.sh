#!/bin/bash
#
# Simple bash script for initializing
# a dev environment on new a new
# Elementary OS machine

##### Upgrade #########################
sudo apt update 
sudo apt upgrade -y

##### Behavior #########################
# Enable PPA's
sudo apt install -y software-properties-common

# Change applications menu hotkey to windows key
gsettings set org.gnome.mutter overlay-key "'Super_L'"
gsettings set org.pantheon.desktop.gala.behavior overlay-action "'wingpanel --toggle-indicator=app-launcher'"

##### Aesthetic #########################
# Install Elementary Tweaks:
sudo add-apt-repository ppa:philip.scott/elementary-tweaks && sudo apt-get update
sudo apt install -y elementary-tweaks

# Install OSX-ARC Themes
sudo apt install -y gdebi
mkdir ~/temp
cd ~/temp
sudo wget https://github.com/LinxGem33/OSX-Arc-Darker/releases/download/v1.4.3/osx-arc-collection_1.4.3_amd64.deb
sudo gdebi osx-arc-collection_1.4.3_amd64.deb
cd rm -rf ~/temp

# Icons
sudo add-apt-repository ppa:papirus/papirus
sudo apt update
sudo apt install -y papirus-icon-theme

##### Dev Env #########################
# Make gnome-terminal default
sudo apt install -y gnome-terminal
sudo sed -i -e 's/OnlyShowIn=GNOME;Unity;/#OnlyShowIn=Gnome;Unity;/g' /usr/share/applications/gnome-terminal.desktop
sudo sed -i -e 's/OnlyShowIn=Unity/#OnlyShowIn=Unity/g' /usr/share/applications/gnome-terminal.desktop
gsettings set org.gnome.desktop.default-applications.terminal exec gnome-terminal
gsettings set org.gnome.desktop.default-applications.terminal exec-arg ''
sudo apt purge pantheon-terminal
sudo apt install -y dconf-cli
wget -O gogh https://git.io/vQgMr && chmod +x gogh && ./gogh && rm gogh

# install atom text editor
mkdir ~/temp
cd ~/temp
sudo wget https://github.com/atom/atom/releases/download/v1.21.1/atom-amd64.deb
sudo gdebi atom-amd64.deb
cd rm -rf ~/temp

# install chromium browser
sudo apt install -y chromium-browser

# install node + npm
sudo apt install -y nodejs
sudo apt install -y npm

# install virtualvbox + vagrant
sudo apt install -y virtualbox
sudo apt install -y vagrant
