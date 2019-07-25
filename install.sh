#!/bin/bash

if [ ! $(brew --version) ]; then
  echo "No brew installed"
else
  echo "There is brew"
fi
