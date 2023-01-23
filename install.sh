#!/bin/bash

# Custom Fonts
git clone https://github.com/tuanpham-dev/code-server-font-patch.git
cd code-server-font-patch
sudo ./patch.sh

# Install zsh and oh-my-zsh
sudo apt update -y
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

USER=${USER:-$(id -u -n)}
zsh=$(command -v zsh)
sudo chsh -s "$zsh" "$USER"
export SHELL="$zsh"

# Copy all files to home directory
cd ~/.config/coderv2/dotfiles
cp -r .gitconfig ~/.gitconfig
cp -r .zshrc ~/.zshrc
cp -r .profile ~/.profile
cp -r scripts ~/.scripts

# Copy code-server config
touch ~/.local/share/code-server/User/settings.json
cp -r settings.json ~/.local/share/code-server/User/settings.json

# Install Extensions
code-server --install-extension golang.go
code-server --install-extension ms-python.python
code-server --install-extension gulajavaministudio.mayukaithemevsc
code-server --install-extension pkief.material-icon-theme

wget https://files.mcaq.me/5x2r7.vsix
code-server --install-extension 5x2r7.vsix

# Prepare Armada Repos
mkdir -p ~/projects
cd ~/projects

git clone https://github.com/armadaproject/armada.git
git clone https://github.com/armadaproject/armada-operator.git