#!/usr/bin/env bash
cd "$(dirname "$0")" || exit #Cd to project dir
SECONDS=0

# Enter password to continue
echo -e "\033[1;31m Enter password to start \033[0m"
sudo -v # Take sudo permission to not ask in future
# Set default shell to zsh
sudo chsh -s /bin/zsh #For Root
chsh -s /bin/zsh #For user
sudo apt -y update
sudo apt -y upgrade

# Install dotfiles
echo -e "\033[1;31m Install dotfiles \033[0m"

# Install Defaults
echo -e "\033[1;31m Install Defaults \033[0m"
# Setup git
git config --global core.editor "nano"
git config --global user.name "$(whoami)"
git config --global user.email "$(whoami)@no-reply.com"
git config --global core.excludesfile ~/.gitignore_global

# Install Oh My Zsh
echo -e "\033[1;31m Install Oh My Zsh \033[0m"
sudo apt -y install zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Complete
echo -e "\033[1;31m \nTime Elapsed: $((SECONDS / 3600)) Hrs, $(((SECONDS / 60) % 60)) Mins, $((SECONDS % 60)) Sec \033[0m"
echo -e "\033[1;31m \nCompleted \033[0m"