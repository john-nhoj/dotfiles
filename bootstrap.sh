#!/usr/bin/env bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RED="\033[1;31m"
NOCOLOR="\033[0m"

echo -e "${RED}==> Linking root configurations${NOCOLOR}"

function doIt() {
	for file in $(ls -A | grep -E -vi '.sh|.git|README|.macos|tmp|.idea')
  do
    ln -s "${BASEDIR}"/"${file}" ~/"${file}"
  done
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -rp "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
