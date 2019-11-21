#!/bin/bash

VERSION=`(emacs --version | awk -F ' ' 'NR==1 {print $3}' )`
MINOR_VERSION=`(echo $VERSION | awk -F '.' 'NR==1 {print $1$2}')`
GPG_VERSION=263

if [ $(echo "$MINOR_VERSION < $GPG_VERSION" | bc) -eq 1 ]; then
    # Linux
    echo "update the new GPG file"
    find /usr/share/emacs/$VERSION -name package-keyring.gpg | xargs sudo cp etc/gnu-elpa.gpg-keyring

    # MacOS
    # find /System/Applications/Emacs.app/Contents/Resources/etc -name package-keyring.gpg | xargs sudo cp etc/gnu-elpa.gpg-keyring

fi
