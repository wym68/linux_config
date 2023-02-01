#!/bin/bash

######update system, replace source and language, then reboot
#Dock minimize
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
#Install some needed Packages
sudo apt update
sudo apt install gcc g++ make make-doc synaptic git curl zsh rdesktop clangd zathura ranger vlc neovim
sudo apt -y install wl-clipboard
#Install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install yarn
#Install alacritty
sudo add-apt-repository ppa:aslatter/ppa
sudo apt update 
sudo apt install alacritty
#Install nodejs  
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt update
sudo apt-get install -y nodejs

###manually install baidunetdesk google-chrome zotero liberoffice MotionPro Tweaks miniconda

#after install miniconda, creat py39 and pip install numpy pandas matplotlib autopep8 ipdb neovim

#Install OCR
sudo add-apt-repository ppa:sandromani/gimagereader
sudo apt-get install gimagereader tesseract-ocr tesseract-ocr-eng tesseract-ocr-chi-sim
