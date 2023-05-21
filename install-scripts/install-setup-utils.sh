#!/bin/bash

DEPS_DIR="$(pwd)/deps";

cd deps/;

echo "Setting up shell-menu-select";
echo -n "Checking for shell-menu-select files: ";
if  [ -d "$DEPS_DIR/shell-menu-select" ]; then
    echo "Found";
    if command -v getChoice &> /dev/null; then
        exit;
    fi
else
    echo "Files not found";
    echo "Downloading shell-menu-select";
    git clone https://github.com/the0neWhoKnocks/shell-menu-select.git;
    echo "Installing shell-menu-select script";
    source ./shell-menu-select/get-choice.sh;
    echo "Verifiying install"
    if ! command -v getChoice &> /dev/null; then
        echo "getChoice command could not be found";
        echo "Instalation failed";
        exit;
    fi
    echo "Done";
    echo "shell-menu-select: Installation Complete";
    cd $DEPS_DIR;
fi

cd ../;