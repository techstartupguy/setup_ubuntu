#!/usr/bin/env bash
cd "$(dirname "$0")" || exit #Cd to project dir
SECONDS=0

# Enter password to continue
echo -e "\033[1;31m Enter password to start \033[0m"
say "Enter password to start"
sudo -v # Take sudo permission to not ask in future
# Set default shell to zsh
sudo chsh -s /bin/zsh #For Root
chsh -s /bin/zsh #For user


# Complete
echo -e "\033[1;31m \nTime Elapsed: $((SECONDS / 3600)) Hrs, $(((SECONDS / 60) % 60)) Mins, $((SECONDS % 60)) Sec \033[0m"
echo -e "\033[1;31m \nCompleted \033[0m"