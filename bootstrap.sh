#!/usr/bin/env bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function doIt() {
	for file in `ls -A | egrep -vi '.sh|.git|README|.macos|com.googlecode.iterm2.plist|tmp'`
  do
    ln -s ${BASEDIR}/${file} ~/${file}
    source ~/.zshrc
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
unset doIt;
