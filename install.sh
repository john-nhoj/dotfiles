#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CASKS=('telegram' 'docker' 'whatsapp' 'android-studio' 'postman' 'slack' 'spotify' 'microsoft-office' 'java' 'postico' )
DEPENDENCIES=('python' 'postgres' 'awscli'  'yarn' 'heroku/brew/heroku')

echo "-- Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "-- Installing Homebrew dependencies"
for CASK in "${CASKS[@]}"
do
  brew install CASK
done

echo "-- Installing softwares (cask)"
for DEPENDENCY in "${DEPENDENCIES[@]}"
do
  brew install DEPENDENCY
done

ln -s ${BASEDIR}/config/.zshrc ~/.zshrc
