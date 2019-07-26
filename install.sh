#!/usr/bin/env bash

mkdir tmp

./brew.sh
./zsh.sh
source bootstrap.sh
./.macos

rm-rf tmp
