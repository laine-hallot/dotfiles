#!/bin/bash

DEPS_DIR="$(pwd)/deps";

function download () {
    cd deps/;
    if $1 = true; then
      echo -e " - \e[94mmaterial-design-icons\e[0m already downloaded - Skipping";
    else
      echo -e " - \e[94mmaterial-design-icons\e[0m";
      git clone https://github.com/google/material-design-icons.git;
    fi
    cd ../;
}


function setup() {
  cd deps/;

  if  $1 = true; then
    echo -e " - \e[94mmaterial-design-icons\e[0m already installed - Skipping";
  else
    echo -e " - \e[94mmaterial-design-icons\e[0m: ";
    cd material-design-icons/;
    echo -n "Creating dir in /usr/share/fonts/ ";
    sudo mkdir -p /usr/share/fonts/material-design-icons-fonts/;
    echo -n "Copying files to /usr/share/fonts/material-design-icons-fonts/ ";
    sudo cp -avr font/*.ttf /usr/share/fonts/material-design-icons-fonts/ >/dev/null 2>&1;
    sudo cp -avr font/*.otf /usr/share/fonts/material-design-icons-fonts/ >/dev/null 2>&1;
    echo -n "Creating font config ";
    cd /usr/share/fonts/material-design-icons-fonts;
    sudo mkfontscale;
    sudo mkfontdir;
    echo -e "Installing \e[94mmaterial-design-icons\e[0m font files ";
    xset fp+ /usr/share/fonts/material-design-icons-fonts;
    cd $DEPS_DIR;
  fi

  cd ../;
}

function link() {
  return 0;
}