#!/usr/bin/env bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RED="\033[1;31m"
NOCOLOR="\033[0m"

echo -e "${RED}==> Linking root configurations${NOCOLOR}"

function doIt() {
	for file in `ls -A | egrep -vi '\b.sh\b|.git|README|.macos|com.googlecode.iterm2.plist|tmp'`
  do
    ln -sF ${BASEDIR}/${file} ~/${file}
  done
  ln -sF ${BASEDIR}/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
  for app in "iTerm2" \
    "Terminal"; do
    killall "${app}" &> /dev/null
  done
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
