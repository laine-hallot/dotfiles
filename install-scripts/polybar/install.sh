#!/bin/bash

function download() {
  return 0;
}

function setup() {
  if $1 = true; then
    echo -e " - \e[94mpolybar\e[0m: already installed - Skipping"
  else
    if $selectedPlatform = 'Desktop'; then
      cp -f ../polybarConfig/config.desktop ../polybarConfig/config
    else
      cp -f ../polybarConfig/config.laptop ../polybarConfig/config
    fi
  fi
}

function link() {
  echo -e " - \e[94mpolybar\e[0m";
  ln -s $(pwd)/polybarConfig/config $HOME/.config/polybar/ &>/dev/null;
}