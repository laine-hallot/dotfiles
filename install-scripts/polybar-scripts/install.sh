#!/bin/bash

function download() {
  if $1 = true; then
    echo -e " - \e[94mpolybar-scripts\e[0m: already downloaded. Skipping"
  else
    cd deps/;
    echo -e " - \e[94mpolybar-scripts\e[0m:";
    git clone https://github.com/polybar/polybar-scripts.git;
    cd ../;
  fi
}


function setup() {
  if  $1 = true; then
    echo -e " - \e[94mpolybar-scripts\e[0m: already installed. Skipping";
  else
    echo -en " - \e[94mpolybar-scripts\e[0m: ";
    cd deps/;
    echo "Generating Bluetooth script";
    sed -i 's/#1//g' polybar-scripts/polybar-scripts/system-bluetooth-bluetoothctl/system-bluetooth-bluetoothctl.sh;
    sed -i 's/#2//g' polybar-scripts/polybar-scripts/system-bluetooth-bluetoothctl/system-bluetooth-bluetoothctl.sh;
    cp polybar-scripts/polybar-scripts/system-bluetooth-bluetoothctl/system-bluetooth-bluetoothctl.sh ../dist;
    chmod +x ../dist/system-bluetooth-bluetoothctl.sh;
    cd ../;
  fi;
}


function link() {
  cd deps/;
  #echo "Setting up scripts directory in ~/.config/polybar";
  mkdir -p ~/.config/polybar/polybar-scripts/;

  cd ../dist/;
  #echo "Linking scipts to ~/.config/polybar/polybar scripts:"

  # Bluetooth
  echo -en " - \e[94mpolybar-scripts\e[0m: system-bluetooth-bluetoothctl. ";
  if ln -s $(pwd)/system-bluetooth-bluetoothctl.sh $HOME/.config/polybar/polybar-scripts/ >/dev/null 2>&1; then
      echo "Ok"
  else
      echo "Failed"
  fi
  cd ../;
}
