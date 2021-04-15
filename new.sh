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
sudo cp ./dotfiles/.gitignore_global ~/.
sudo cp ./dotfiles/.zshrc ~/.

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

# Install Google Chrome
echo -e "\033[1;31m Install Google Chrome \033[0m"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt -y install ./google-chrome-stable_current_amd64.deb

# Install Google Drive
echo -e "\033[1;31m Install Google Drive \033[0m"

# Install Tor Browser
echo -e "\033[1;31m Install Tor Browser \033[0m"

# Install Slack
echo -e "\033[1;31m Install Slack \033[0m"

# Install VLC media player
echo -e "\033[1;31m Install VLC media player \033[0m"

# Install Libre Office
echo -e "\033[1;31m Install Libre Office \033[0m"

# Install VNC Viewer
echo -e "\033[1;31m Install VNC Viewer \033[0m"

# Install Sublime text
echo -e "\033[1;31m Install Sublime text \033[0m"

# Install Android Studio
echo -e "\033[1;31m Install Android Studio \033[0m"

# Install VS Code
echo -e "\033[1;31m Install VS Code \033[0m"
which -a code && code --version
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt -y install apt-transport-https
sudo apt -y update
sudo apt -y install code # or code-insiders
which -a code && code --version
code --install-extension ms-python.python
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension visualstudioexptteam.vscodeintellicode
code --install-extension eamodio.gitlens
code --install-extension ms-azuretools.vscode-docker
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension pkief.material-icon-theme
code --install-extension redhat.vscode-yaml
code --install-extension zhuangtongfa.material-theme
code --install-extension editorconfig.editorconfig
code --install-extension dart-code.dart-code
code --install-extension dart-code.flutter
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension naumovs.color-highlight
code --install-extension coenraads.bracket-pair-colorizer-2
code --install-extension msjsdiag.vscode-react-native
code --install-extension mechatroner.rainbow-csv

# Install VirtualBox
echo -e "\033[1;31m Install VirtualBox \033[0m"

#Install Docker
echo -e "\033[1;31m Install Docker \033[0m"
which -a docker && docker --version
which -a docker-compose && docker-compose --version
which -a docker-machine && docker-machine --version


which -a docker && docker --version
which -a docker-compose && docker-compose --version
which -a docker-machine && docker-machine --version

# Install Nano
echo -e "\033[1;31m Install Nano \033[0m"
which -a nano && nano --version

which -a nano && nano --version

# Install JQ
echo -e "\033[1;31m Install JQ \033[0m"
which -a jq && jq --version

which -a jq && jq --version

# Install Java
echo -e "\033[1;31m Install Java \033[0m"

which -a java && java -version

# Install Node
echo -e "\033[1;31m Install Node \033[0m"

# Install Python
echo -e "\033[1;31m Install Python \033[0m"

# Complete
echo -e "\033[1;31m \nTime Elapsed: $((SECONDS / 3600)) Hrs, $(((SECONDS / 60) % 60)) Mins, $((SECONDS % 60)) Sec \033[0m"
echo -e "\033[1;31m \nCompleted \033[0m"