#!/bin/bash

function download() {
  return 0;
}


function setup() {
  return 0;
}


function link() {
  echo -e " - \e[94mrofi\e[0m";
  ln -s $(pwd)/rofi/config.rasi $HOME/.config/rofi/ &>/dev/null;
}
