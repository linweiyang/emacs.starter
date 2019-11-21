#!/bin/bash
os=`uname -a`
macOS="Darwin"

VERSION=`(emacs --version | awk -F ' ' 'NR==1 {print $3}' | cut -b 1-4)`
echo $VERSION

GPG_VERSION=26.3

if [ $(echo "$VERSION < $GPG_VERSION" | bc) -eq 0 ]; then
    exit
fi

if [[ $os =~ $macOS ]]; then
    echo $macOS
    find /System/Applications/Emacs.app/Contents/Resources/etc -name package-keyring.gpg | xargs sudo cp etc/gnu-elpa.gpg-keyring
    echo "update the new GPG file"

else
    # Linux
    echo $os
    find /usr/share/emacs/ -name package-keyring.gpg | xargs sudo cp etc/gnu-elpa.gpg-keyring
    echo "update the new GPG file"
fi
