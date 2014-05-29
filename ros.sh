#!/bin/bash

clear
echo "******************************************************************************"
echo -e "\e[1;92mInstalling ROS Hydro for Ubuntu 12.04 (Precise)\e[0m"
echo "******************************************************************************"
sleep 5

echo -e "\e[1;92m*******Installing ROS*******\e[0m"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu precise main" > /etc/apt/sources.list.d/ros-latest.list'
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
sudo apt-get -y update
sudo apt-get -y install ros-hydro-desktop
sudo apt-get -y install ros-hyrdo-rosbridge-suite
sudo rosdep init
rosdep update
sudo apt-get install -y ros-hydro-joy
sudo apt-get install -y python-rosinstall

echo "source /opt/ros/hydro/setup.bash" >> ~/.bashrc
echo "sed -i 's/while [  -lt  ]; do/while [[  -lt  ]]; do/g' ~/catkin_ws/devel/setup.sh" >> .bashrc
echo "sed -i 's/CATKIN_SHELL=bash   > /CATKIN_SHELL=bash   >> /g' ~/catkin_ws/devel/setup.sh" >> .bashrc 
echo "source ~/catkin_ws/install/setup.bash" >> .bashrc
echo "#source ~/catkin_ws/devel/setup.sh" >> .bashrc


sudo sed -i 's/CATKIN_SHELL=$CATKIN_SHELL "$_SETUP_UTIL" $@ > $_SETUP_TMP/CATKIN_SHELL=$CATKIN_SHELL "$_SETUP_UTIL" $@ >> $_SETUP_TMP/g' /opt/ros/hydro/setup.sh

sudo sed -i 's/while [ $_i -lt $_CATKIN_ENVIRONMENT_HOOKS_COUNT ]; do/while [[ $_i -lt $_CATKIN_ENVIRONMENT_HOOKS_COUNT ]]; do/g' /opt/ros/hydro/setup.sh

source /opt/ros/hydro/setup.bash

mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace
cd ~/catkin_ws/
catkin_make

cd $HOME
