#!/bin/bash
#
# Simple bash script for initializing
# a dev environment on new a new
# Elementary OS machine

##### Upgrade #########################
sudo apt-get update
sudo apt-get upgrade

##### Behavior #########################
# Enable PPA's
sudo apt install software-properties-common

# Change applications menu hotkey to windows key
gsettings set org.gnome.mutter overlay-key "'Super_L'"
gsettings set org.pantheon.desktop.gala.behavior overlay-action "'wingpanel --toggle-indicator=app-launcher'"

##### Aesthetic #########################
# Install Elementary Tweaks:
sudo add-apt-repository ppa:philip.scott/elementary-tweaks && sudo apt-get update
sudo apt-get install elementary-tweaks

# Install OSX-ARC Themes
sudo apt-get install gdebi
mkdir ~/temp
cd ~/temp
sudo wget https://github.com/LinxGem33/OSX-Arc-Darker/releases/download/v1.4.3/osx-arc-collection_1.4.3_amd64.deb
sudo gdebi osx-arc-collection_1.4.3_amd64.deb
cd rm -rf ~/temp

# Icons
sudo add-apt-repository ppa:papirus/papirus
sudo apt-get update
sudo apt-get install papirus-icon-theme

##### Dev Env #########################
# Make gnome-terminal default
sudo apt-get install gnome-terminal
sudo sed -i -e 's/OnlyShowIn=GNOME;Unity;/#OnlyShowIn=Gnome;Unity;/g' /usr/share/applications/gnome-terminal.desktop
sudo sed -i -e 's/OnlyShowIn=Unity/#OnlyShowIn=Unity/g' /usr/share/applications/gnome-terminal.desktop
gsettings set org.gnome.desktop.default-applications.terminal exec gnome-terminal
gsettings set org.gnome.desktop.default-applications.terminal exec-arg ''
sudo apt-get purge pantheon-terminal

# install node + npm
sudo apt-get install nodejs
sudo apt-get install npm

# install virtualvbox + vagrant
sudo apt-get install virtualbox
sudo apt-get install vagrant
