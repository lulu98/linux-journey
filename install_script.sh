#!/usr/bin/env bash
# this install script installs my entire setup
echo 'update and upgrade'
sudo apt-get update
sudo apt-get upgrade

# install curl and wget
echo 'install curl and wget'
sudo apt-get install wget curl

# install silver searcher
echo 'install silversearcher'
sudo apt-get install silversearcher-ag

# install terminator
echo 'install terminator'
sudo apt-get install terminator

# install git
echo 'install git'
sudo apt-get install git

# install latex
echo 'install latex'
sudo apt-get install miktex texlive-full texlive-fonts-extra

# install java
echo 'install java-jdk'
sudo apt-get install openjdk-8-jre

# install python3
echo 'install python3'
sudo apt-get install python3
sudo apt-get install python3-dev cmake

# clone github repo
repo_path=~/Desktop/linux-journey
git clone git@github.com:lulu98/linux-journey.git $repo_path 

# install zsh
echo 'install and setup of zsh'
sudo apt-get install zsh
sudo usermod -s /usr/bin/zsh $(whoami)
sudo apt-get install powerline fonts-powerline
sudo apt-get install zsh-theme-powerlevel9k
sudo apt-get install zsh-syntax-highlighting
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cat ${repo_path}/zshrc > ~/.zshrc
source ~/.zshrc 
#zsh
#sudo apt-get install powerline fonts-powerline
#sudo apt-get install zsh-theme-powerlevel9k
#echo "source /usr/share/powerlevel9k/powerlevel9k.zsh-theme" >> ~/.zshrc
#sudo apt-get install zsh-syntax-highlighting
#echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
#sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
#echo "source /usr/share/powerlevel9k/powerlevel9k.zsh-theme" >> ~/.zshrc
#echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
#source ~/.zshrc 

###########################
## install and setup vim ##
###########################
echo 'install and setup of vim'
sudo apt-get install vim
sudo apt-get install vim-gtk
rm -rf ~/vim
rm -rf ~/.vimrc
cat ${repo_path}/vim/vimrc > ~/.vimrc
## install vim-plug as plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c 'PluginInstall' -c 'qa!'
~/.vim/plugged/YouCompleteMe/install.py --all

################
## install i3 ##
################
echo 'install and setup of i3'
sudo apt-get install i3
## setup
cp -r ${repo_path}/config/i3 ~/.config 

## additional software
### install feh for wallpapers
echo 'install of feh'
sudo apt-get install feh
cp -r ${repo_path}/wallpapers ~/Pictures
echo 'feh --bg-fill ~/Pictures/wallpapers/wallpaper01.jpg' >> ~/.profile

### install xscreensaver
echo 'install of xscreensaver'
sudo apt-get remove gnome-screensaver
sudo apt-get install xscreensaver xscreensaver-data-extra xscreensaver-gl-extra

### install vi file manager (vifm)
echo 'install of vifm'
sudo apt-get install vifm

### install rofi application launcher
echo 'install of rofi'
sudo apt-get install rofi

### install and setup polybar
echo 'install and setup of polybar'
#### install build dependencies
sudo apt-get install build-essential clang-7.0 cmake cmake-data pkg-config python3 python3-sphinx
#### isntall dependencies
sudo apt-get install build-essential git cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev
#### install optional dependencies
sudo apt-get install libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev
#### build polybar
##### install alternatively with GitHub repo according to: https://github.com/polybar/polybar/wiki/Compiling
wget -c https://github.com/polybar/polybar/releases/download/3.4.3/polybar-3.4.3.tar -P /tmp && tar -xvf /tmp/polybar-3.4.3.tar -C ~/Desktop
cd ~/Desktop/polybar 
mkdir build
cd build
cmake ..
make -j4
sudo make install
#### copy config
cp -r ${repo_path}/config/polybar ~/.config 
