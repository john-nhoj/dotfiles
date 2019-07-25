#!/bin/bash

CASKS=('telegram' 'docker' 'whatsapp' 'android-studio' 'postman' 'slack' 'spotify' 'microsoft-office' 'java' 'postico' )

for CASK in "${CASKS[@]}"
do
  brew install CASK
done
