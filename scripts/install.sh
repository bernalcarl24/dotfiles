#!/bin/bash

# check if system is ubuntu based
if [[ ! "$(cat /etc/issue)" =~ "Ubuntu" ]]; then
    echo "Install script only works on ubuntu based systems."
    echo "Aborting..."
    exit 1
fi

# install essential packages
echo "Installing essential packages..."
sudo apt update
xargs -a ~/Dotfiles/scripts/packages.txt sudo apt install

# install oh-my-zsh and plugins
echo "Installing oh-my-zsh and plugins..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# pip
echo "Installing pip packages..."
pip3 install -r ~/Dotfiles/scripts/requirements.txt

# node
echo "Installing nvm and node..."
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | zsh
nvm install --lts
xargs -a ~/Dotfiles/scripts/node.txt npm install -g

# fzf
echo "Installing fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# vscode
echo "Installing vscode..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install code
~/Dotfiles/scripts/install-vscode-ext.sh

# snap packages
echo "Installing snap packages..."
xargs -a ~/Dotfiles/scripts/snap.txt sudo snap install

# podman
echo "Installing podman..."
. /etc/os-release
echo "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/ /" | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/Release.key | sudo apt-key add -
sudo apt-get update
sudo apt-get -y upgrade 
sudo apt-get -y install podman

# setup dotfiles
echo "Setting up dotfiles..."
stow ~/Dotfiles/home ~/Dotfiles/vscode ~/Dotfiles/nvim

# laptop config
echo "Setting up laptop configs..."

sudo apt update
sudo apt install \
tlp tlp-rdw \
powertop \
ufw

sudo tlp start
sudo ufw enable
systemctl disable bluetooth.service

echo "Done!"