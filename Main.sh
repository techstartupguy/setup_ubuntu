#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS Workstation

cd $HOME
clear
echo "******************************************************************************"
echo -e "\e[1;92mUnInstalling Ubuntu nonsense Packages: Empathy, Zeitgeist\e[0m"
echo "******************************************************************************"
sleep 5

sudo apt-get -y purge empathy*
sudo apt-get -y purge zeitgeist
sudo apt-get -y purge zeitgeist-ssh core
sudo apt-get -y purge whoopsie
sudo apt-get -y autoremove

clear
echo "******************************************************************************"
echo -e "\e[1;92mInstalling General Packages: SSH, GIT, CURL, EMACS\e[0m"
echo "******************************************************************************"
sleep 10

echo -e "\e[1;92m*******Installing SSH*******\e[0m"
sudo apt-get install -y openssh-server
echo -e "\e[1;92m*******Installing GIT*******\e[0m"
sudo apt-get install -y git
echo -e "\e[1;92m*******Installing CURL*******\e[0m"
sudo apt-get install -y curl
echo -e "\e[1;92m*******Installing EMACS*******\e[0m"
sudo apt-get install -y emacs
echo -e "\e[1;92m*******Installing NODEJS*******\e[0m"
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get install -y nodejs npm
# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap
# Install ws websocket and jshint to allow checking of JS code within emacs
npm config set registry http://registry.npmjs.org/
npm install ws
sudo npm install -g jshint

echo -e "\e[1;92m*******Installing ImageEditing Pinta*******\e[0m"
sudo apt-get install -y pinta

clear
echo "******************************************************************************"
echo -e "\e[1;92mInstalling Dotfiles screenrc, bash_profile, bashrc, bashrc_custom, emacs.d\e[0m"
echo "******************************************************************************"
sleep 5

#install dotfiles as well
ln -sb ~/setup_workspace/dotfiles/.screenrc ~/.
ln -sb ~/setup_workspace/dotfiles/.bash_profile ~/.
ln -sb ~/setup_workspace/dotfiles/.bashrc ~/.
ln -sb ~/setup_workspace/dotfiles/.bashrc_custom ~/.
ln -sf ~/setup_workspace/dotfiles/.emacs.d ~/.


clear
echo "******************************************************************************"
echo -e "\e[1;92mInstalling Ctrlworks Packages: PYTHON, OPENCV, DJANGO, OPENTOK\e[0m"
echo "******************************************************************************"
sleep 5

echo -e "\e[1;92m*******Installing PYTHON*******\e[0m"
sudo apt-get install -y git python-dev python-pip ntp 
sudo pip install psutil
echo -e "\e[1;92m*******Installing OpenCV*******\e[0m"
sudo apt-get install -y libopencv-dev
echo -e "\e[1;92m*******Installing DJANGO*******\e[0m"
sudo pip install django
echo -e "\e[1;92m*******Installing OPENTOK*******\e[0m"
sudo pip install opentok

bash ~/setup_workspace/ros.sh
#bash ~/setup_workspace/ffmpeg.sh

clear
echo "******************************************************************************"
echo -e "\e[1;92mPulling GIT repositories\e[0m"
echo "******************************************************************************"
sleep 5

### Pull sources
cd $HOME
git clone http://github.com/ctrlworks/pandaboard-middleware
git clone http://github.com/ctrlworks/ros

echo "source ~/pandaboard-middleware/scripts/setup.bash" >> ~/.bashrc
echo "source ~/ros/setup.bash" >> ~/.bashrc
echo "Install Google chrome yourself"
echo "Generate ssh keys and send to Admin to give access to repositories"



