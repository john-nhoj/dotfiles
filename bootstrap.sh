#!/usr/bin/env bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RED="\033[1;31m"
YELLOW="\033[01;33m"
NOCOLOR="\033[0m"

echo -e "${RED}==> Linking root configurations${NOCOLOR}"

function doIt() {
	for file in `ls -A | egrep -vi '.sh|.git|README|.macos|com.googlecode.iterm2.plist|tmp'`
  do
    ln -sF ${BASEDIR}/${file} ~/${file}
    source ~/.zshrc
  done
  ln -sF ${BASEDIR}/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "${RED}This may overwrite existing files in your home directory. Are you sure? (y/n) ${NOCOLOR}" -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
