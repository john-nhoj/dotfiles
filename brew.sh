#!/usr/bin/env bash

STEP=0
NB_OF_STEPS=6
RED="\033[1;31m"
YELLOW="\033[01;33m"
NOCOLOR="\033[0m"

echo -e "${YELLOW}==> Brew${NOCOLOR}"

STEP=$(($STEP + 1))
echo -e "${YELLOW}--- Step ${STEP}/${NB_OF_STEPS}: Installing brew${NOCOLOR}"
if [ ! $(brew --version) ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

STEP=$(($STEP + 1))
echo -e "${YELLOW}--- Step ${STEP}/${NB_OF_STEPS}: Updating brew${NOCOLOR}"
brew update
brew upgrade

STEP=$(($STEP + 1))
echo -e "${YELLOW}--- Step ${STEP}/${NB_OF_STEPS}: Saving Homebrew’s installed location${NOCOLOR}"
BREW_PREFIX=$(brew --prefix)

CASKS=(
#  '1password'
#  'android-platform-tools'
#  'android-sdk'
#  'android-studio'
#  'docker'
#  'firefox'
#  'genymotion'
#  'google-chrome'
  'iterm2'
#  'java'
#  'microsoft-office'
#  'nextcloud'
#  'postico'
#  'protonvpn'
#  'react-native-debugger'
#  'slack'
#  'spectacle'
#  'spotify'
#  'telegram'
#  'tunnelblick'
#  'whatsapp'
)

DEPENDENCIES=(
#  'awscli'
#  'heroku/brew/heroku'
  'python'
#  'postgres'
#  'yarn'
)

STEP=$(($STEP + 1))
echo -e "${YELLOW}--- Step ${STEP}/${NB_OF_STEPS}: Installing softwares (cask)${NOCOLOR}"
for CASK in "${CASKS[@]}"
do
  brew cask install ${CASK}
done

STEP=$(($STEP + 1))
echo -e "${YELLOW}--- Step ${STEP}/${NB_OF_STEPS}: Installing Homebrew dependencies${NOCOLOR}"
for DEPENDENCY in "${DEPENDENCIES[@]}"
do
  brew install ${DEPENDENCY}
done

brew cleanup
