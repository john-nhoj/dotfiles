#!/usr/bin/env bash

STEP=0
NB_OF_STEPS=2
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
