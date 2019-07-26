#!/usr/bin/env bash

STEP=0
NB_OF_STEPS=4
RED="\033[1;31m"
YELLOW="\033[01;33m"
NOCOLOR="\033[0m"

echo -e "${RED}==> Oh-My-Zsh + iTerm + zsh${NOCOLOR}"

STEP=$(($STEP + 1))
echo -e "${YELLOW}--- Step ${STEP}/${NB_OF_STEPS}: Installing zsh${NOCOLOR}"
brew install zsh
brew install zsh-completions

chsh -s /bin/zsh

STEP=$(($STEP + 1))
echo -e "${YELLOW}--- Step ${STEP}/${NB_OF_STEPS}: Installing oh-my-zsh${NOCOLOR}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -s ${BASEDIR}/.zshrc ~/.zshrc

STEP=$(($STEP + 1))
echo -e "${YELLOW}--- Step ${STEP}/${NB_OF_STEPS}: Installing Powerline${NOCOLOR}"
python -m pip install --user powerline-status

STEP=$(($STEP + 1))
echo -e "${YELLOW}--- Step ${STEP}/${NB_OF_STEPS}: Installing Powerline Fonts${NOCOLOR}"
git clone https://github.com/powerline/fonts tmp/fonts
./tmp/fonts/install.sh

ln -sF ${BASEDIR}/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
