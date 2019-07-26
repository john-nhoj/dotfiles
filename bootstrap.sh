#!/usr/bin/env bash

function doIt() {
	for file in `ls -A | egrep -vi '.sh|.git|README|.macos'`
  do
    ln -s $(dirname "${BASH_SOURCE}")${BASEDIR}/${file} ~/${file}
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
