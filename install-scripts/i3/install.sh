#!/bin/bash

function download() {
  return 0;
}


function setup() {
  return 0;
}


function link() {
  echo -e " - \e[94mi3\e[0m";
  ln -s $(pwd)/config $HOME/.config/i3/ &>/dev/null;
}
