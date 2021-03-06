#!/usr/bin/env bash

STEP=0
NB_OF_STEPS=7
RED="\033[1;31m"
YELLOW="\033[01;33m"
NOCOLOR="\033[0m"

echo -e "${YELLOW}==> Brew${NOCOLOR}"

STEP=$(($STEP + 1))
echo -e "${YELLOW}--- Step ${STEP}/${NB_OF_STEPS}: Installing brew${NOCOLOR}"
echo -e "${YELLOW}DISCLAIMER: You will have to enter your pasword 8 times in a row to install Homebrew${NOCOLOR}"
if [ ! $(brew --version) ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

STEP=$(($STEP + 1))
echo -e "${YELLOW}--- Step ${STEP}/${NB_OF_STEPS}: Updating brew${NOCOLOR}"
brew update
brew upgrade

STEP=$(($STEP + 1))
echo -e "${YELLOW}--- Step ${STEP}/${NB_OF_STEPS}: Saving Homebrew’s installed location${NOCOLOR}"

CASKS=(
  '1password'
  'docker'
  'google-chrome'
  'iterm2'
  'microsoft-office'
  'protonvpn'
  'slack'
  'spotify'
  'telegram'
  'tunnelblick'
  'dozer'
  'alfred'
  'corretto'
  'intellij-idea'
  'visual-studio-code'
  'figma'
  'rectangle'
)

DEPENDENCIES=(
  'awscli'
  'python'
  'postgresql'
  'yarn'
  'watchman'
  'node'
  'direnv'
  'openjdk'
)

FONTS=(
  'font-fira-code'
)

STEP=$(($STEP + 1))
echo -e "${YELLOW}--- Step ${STEP}/${NB_OF_STEPS}: Installing softwares (cask)${NOCOLOR}"
for CASK in "${CASKS[@]}"
do
  brew install --cask ${CASK}
done

STEP=$(($STEP + 1))
echo -e "${YELLOW}--- Step ${STEP}/${NB_OF_STEPS}: Installing Homebrew dependencies${NOCOLOR}"
for DEPENDENCY in "${DEPENDENCIES[@]}"
do
  brew install ${DEPENDENCY}
done

STEP=$(($STEP + 1))
echo -e "${YELLOW}--- Step ${STEP}/${NB_OF_STEPS}: Installing fonts${NOCOLOR}"
brew tap homebrew/cask-fonts
for FONT in "${FONTS[@]}"
do
  brew install --cask ${FONT}
done

STEP=$(($STEP + 1))
echo -e "${YELLOW}--- Step ${STEP}/${NB_OF_STEPS}: Starting services${NOCOLOR}"
brew services start yabai skhd

brew cleanup
