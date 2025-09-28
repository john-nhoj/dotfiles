#!/bin/bash

# This script installs necessary dependencies and sets up the environment for a Linux system.

# Software dependencies
DEPENDENCIES=(
)

SNAP_DEPENDENCIES=(
  "brave"           # Brave browser via snap
  "chromium"        # Chromium browser via snap
  "code-insiders --classic"  # Visual Studio code via snap
  "dbeaver-ce"       # DBeaver Community Edition via snap
  "docker"         # Docker via snap
  "discord"       # Discord via snap
  "libreoffice"   # LibreOffice via snap
  "slack"         # Slack via snap
  "spotify"       # Spotify via snap
  "telegram-desktop" # Telegram via snap
  "steam"         # Steam via snap
  "aws-cli --classic" # AWS CLI via snap
)

# Update package lists and upgrade existing packages
echo "Updating package lists..."
sudo apt update && sudo apt upgrade -y

# Install dependencies
echo "Installing dependencies..."
for package in "${DEPENDENCIES[@]}"; do
  if ! dpkg -l | grep -q "$package"; then
    echo "Installing $package..."
    sudo apt install -y "$package"
  else
    echo "$package is already installed."
  fi
done

# Install snap dependencies
echo "Installing snap dependencies..."
for snap_package in "${SNAP_DEPENDENCIES[@]}"; do
  if ! snap list | grep -q "$(echo $snap_package | awk '{print $1}')" ; then
    echo "Installing $snap_package..."
    sudo snap install $snap_package
  else
    echo "$snap_package is already installed."
  fi
done

# Install Proton VPN
echo "Installing Proton VPN..."
wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb
sudo dpkg -i protonvpn-stable-release_1.0.8_all.deb
sudo apt update
sudo apt install -y proton-vpn-gnome-desktop
echo "Proton VPN installed. Installing tray icon support..."
sudo apt install libayatana-appindicator3-1 gir1.2-ayatanaappindicator3-0.1 gnome-shell-extension-appindicator

echo "Installing OBS Studio..."
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update
sudo apt install -y obs-studio

# Install oh-my-bash
if [ ! -d "$HOME/.oh-my-bash" ]; then
  echo "Installing oh-my-bash..."
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
else
  echo "oh-my-bash is already installed."
fi

# Setting up Docker rootless mode
echo "Setting up Docker rootless mode..."
dockerd-rootless-setuptool.sh install

# Symlinks if user says yes
echo "Creating symlinks..."
ln -sf mnt/shared/Repos/Private/dotfiles/.bashrc ~/.bashrc
ln -sf mnt/shared/Repos/Private/dotfiles/.editorconfig ~/.editorconfig
ln -sf mnt/shared/Repos/Private/dotfiles/.gitconfig ~/.gitconfig
ln -sf mnt/shared/Repos/Private/dotfiles/.hushlogin ~/.hushlogin
ln -sf mnt/shared/Repos/Private/dotfiles/config/nvim ~/.config/nvim

# Clean up
echo "Cleaning up..."
sudo apt autoremove -y
sudo apt Clean

# Final message
echo "Installation complete! Please restart your terminal or source your profile to apply changes."
echo "To install Digidoc4, refer to the instructions at: https://www.id.ee/en/article/ubuntu-id-software-installation-updating-and-removal/"
echo "To install Synology Drive Client, refer to: https://www.synology.com/en-global/dsm/feature/drive"

