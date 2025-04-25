#!/bin/bash

DEPS_DIR="$(pwd)/deps";

function download () {
    cd deps/;
    if $1 = true; then
      echo -e " - \e[94mMcMojave Hyprcursor\e[0m already downloaded - Skipping";
    else
      echo -e " - \e[94mMcMojave Hyprcursor\e[0m";
      git clone https://github.com/OtaK/McMojave-hyprcursor.git
      echo -e " - \e[94mMcMojave cursors\e[0m";
      git clone https://github.com/vinceliuice/McMojave-cursors.git
    fi
    cd ../;
}


function setup() {
  cd deps/;

  if  $1 = true; then
    echo -e " - \e[94m\e[0m already installed - Skipping";
  else
    echo -e " - \e[94mMcMojave Hyprcursor\e[0m: ";
    cd McMojave-hyprcursor/;
    echo -n "Creating dir in ~/.local/share/icons/";
    mkdir ~/.local/share/icons/McMojave
    echo -n "Copying files to ~/.local/share/icons/McMojave";
    cp -R dist/* ~/.local/share/icons/McMojave
    cd $DEPS_DIR;
    echo -e " - \e[94mMcMojave Hyprcursor\e[0m: ";
    cd McMojave-cursors/
    ./install.sh
    cd $DEPS_DIR
  fi

  cd ../;
}

function link() {
  return 0;
}
