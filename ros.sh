#!/bin/bash

clear
echo "******************************************************************************"
echo -e "\e[1;92mInstalling ROS Indigo for Ubuntu 14.04 (Trusty)\e[0m"
echo "******************************************************************************"
sleep 5

echo -e "\e[1;92m*******Installing ROS*******\e[0m"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
sudo apt-get -y update
sudo apt-get install ros-indigo-desktop
sudo apt-get -y install ros-indigo-rosbridge-suite
sudo rosdep init
rosdep update
sudo apt-get install -y ros-indigo-joy
sudo apt-get install -y python-rosinstall
echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc

sudo sed -i 's/CATKIN_SHELL=$CATKIN_SHELL "$_SETUP_UTIL" $@ > $_SETUP_TMP/CATKIN_SHELL=$CATKIN_SHELL "$_SETUP_UTIL" $@ >> $_SETUP_TMP/g' /opt/ros/indigo/setup.sh

sudo sed -i 's/while [ $_i -lt $_CATKIN_ENVIRONMENT_HOOKS_COUNT ]; do/while [[ $_i -lt $_CATKIN_ENVIRONMENT_HOOKS_COUNT ]]; do/g' /opt/ros/indigo/setup.sh

