#!/bin/bash

DEPS_DIR="$(pwd)/deps";

function download () {
  if $1 = true; then
      echo -e " - \e[94mbitmap-fonts\e[0m: already downloaded. Skipping"
  else
    cd deps/;
    echo -e " - \e[94mbitmap-fonts\e[0m";
    git clone https://github.com/Tecate/bitmap-fonts.git;
    cd ../;
  fi;
}

function setup() {
  cd deps/;
  if  $1 = true; then
      echo -e " - \e[94mbitmap-fonts\e[0m: already installed. Skipping";
  else
      echo -e " - \e[94mbitmap-fonts\e[0m";
      git clone https://github.com/Tecate/bitmap-fonts.git;
      cd bitmap-fonts;
      sudo cp -avr bitmap/ /usr/share/fonts;
      cd /usr/share/fonts/bitmap;
      sudo mkfontscale;
      sudo mkfontdir;
      xset fp+ /usr/share/fonts/bitmap;
      cd $DEPS_DIR;
  fi;
  cd ../;
}

function link() {
  return 0;
}