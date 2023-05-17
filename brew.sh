#!/bin/bash

if [ ! "$(brew --version)" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew update
brew upgrade

casks=('google-chrome' 'protonvpn' 'telegram' 'rectangle' 'notion' 'slack' 'docker' 'figma' 'discord' 'stats' '1password')
for cask in "${casks[@]}"; do
  read -p "Do you want to install cask $cask? (y/n) " -n 1
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew install --cask "$cask"
  fi
done

formulaes=('postgresql@14' 'yarn' 'watchman' 'node' 'direnv' 'nvm' 'htop' 'redis' 'stripe' 'virtualenv')
for formula in "${formulaes[@]}"; do
  read -p "Do you want to install formulae $formula? (y/n) " -n 1
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew install "$formula"
  fi
done

FONTS=('font-jetbrains-mono')
for font in "${FONTS[@]}"; do
  read -p "\nDo you want to install font $font? (y/n) " -n 1
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew install --cask "$font"
  fi
done

brew cleanup
