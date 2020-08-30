#!/usr/bin/env bash
# this install script installs my entire setup
sudo apt-get update
sudo apt-get upgrade

# install curl and wget
sudo apt-get install wget curl
# install terminator
sudo apt-get install terminator

# install git
sudo apt-get install git

# clone github repo
repo_path=~/Desktop/linux-journey
git clone git@github.com:lulu98/linux-journey.git $repo_path 

# install zsh
sudo apt-get install zsh
chsh -s /usr/bin/zsh root
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
sudo apt-get install powerline fonts-powerline
sudo apt-get install zsh-theme-powerlevel9k
sudo apt-get install zsh-syntax-highlighting
cat ${repo_path}/zshrc > ~/.zshrc
source ~/.zshrc 
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install latex
sudo apt-get install miktex
sudo apt-get install texlive-full
sudo apt-get install texlive-fonts-extra

# install java
sudo apt-get install openjdk-8-jre

# install python3
sudo apt-get install python3
sudo apt-get install python3-dev cmake

# install riot
sudo apt-get install -y lsb-release apt-transport-https
sudo wget -O /usr/share/keyrings/riot-im-archive-keyring.gpg https://packages.riot.im/debian/riot-im-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/riot-im-archive-keyring.gpg] https://packages.riot.im/debian/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/riot-im.list
sudo apt-get update
sudo apt-get install riot-web

###########################
## install and setup vim ##
###########################
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
sudo apt-get install i3
## setup
cp -r ${repo_path}/config/i3 ~/.config 

## additional software
### install feh for wallpapers
sudo apt-get install feh
cp -r ${repo_path}/wallpapers ~/Pictures
echo 'feh --bg-fill ~/Pictures/wallpapers/wallpaper01.jpg' >> ~/.profile

### install xscreensaver
sudo apt-get remove gnome-screensaver
sudo apt-get install xscreensaver xscreensaver-data-extra xscreensaver-gl-extra

### install vi file manager (vifm)
sudo apt-get install vifm

### install rofi application launcher
sudo apt-get install rofi

### install and setup polybar
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
#i3-msg restart
