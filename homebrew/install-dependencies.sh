#!/bin/bash

DEPENDENCIES=('python' 'postgres' 'awscli'  'yarn' 'heroku/brew/heroku')

for DEPENDENCY in "${DEPENDENCIES[@]}"
do
  brew install DEPENDENCY
done
