#!/bin/bash

# Linux
find /usr/share/emacs -name package-keyring.gpg | xargs sudo cp etc/gnu-elpa.gpg-keyring

# MacOS
# find /System/Applications/Emacs.app/Contents/Resources/etc -name package-keyring.gpg | xargs sudo cp etc/gnu-elpa.gpg-keyring
