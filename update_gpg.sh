#!/bin/bash
os=`uname -a`
macOS="Darwin"


VERSION=`(emacs --version | awk -F ' ' 'NR==1 {print $3}' | cat -b 1-4)`
GPG_VERSION=26.3

if [ $(echo "$VERSION < $GPG_VERSION" | bc) -eq 1 ]; then
    if [ [$os =~ $macOS]]; then
    	echo $macOS
	find /System/Applications/Emacs.app/Contents/Resources/etc -name package-keyring.gpg | xargs sudo cp etc/gnu-elpa.gpg-keyring
        echo "update the new GPG file"

    else
	# Linux
	echo $os
        find /usr/share/emacs/ -name package-keyring.gpg | xargs sudo cp etc/gnu-elpa.gpg-keyring
        echo "update the new GPG file"
    fi
fi
