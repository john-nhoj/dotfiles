#!/usr/bin/env bash

STEP=1
NB_OF_STEPS=1

echo "--- Step ${STEP}/${NB_OF_STEPS}: Installing brew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "--- Step ${STEP}/${NB_OF_STEPS}: Updating brew"
brew update
brew upgrade

echo "--- Step ${STEP}/${NB_OF_STEPS}: Saving Homebrew’s installed location"
BREW_PREFIX=$(brew --prefix)

CASKS=(
  '1password'
  'android-platform-tools'
  'android-sdk'
  'android-studio'
  'docker'
  'firefox'
  'genymotion'
  'google-chrome'
  'iterm2'
  'java'
  'microsoft-office'
  'nextcloud'
  'postico'
  'protonvpn'
  'react-native-debugger'
  'slack'
  'spectacle'
  'spotify'
  'telegram'
  'tunnelblick'
  'whatsapp'
)

DEPENDENCIES=(
  'awscli'
  'heroku/brew/heroku'
  'python'
  'postgres'
  'yarn'
  'zsh'
  'zsh-completions'
)

echo "--- Step ${STEP}/${NB_OF_STEPS}: Installing Homebrew dependencies"
for CASK in "${CASKS[@]}"
do
  brew cask install ${CASK}
done

echo "--- Step ${STEP}/${NB_OF_STEPS}: Installing softwares (cask)"
for DEPENDENCY in "${DEPENDENCIES[@]}"
do
  brew install ${DEPENDENCY}
done

chsh -s /bin/zsh

ln -s ${BASEDIR}/config/.zshrc ~/.zshrc
