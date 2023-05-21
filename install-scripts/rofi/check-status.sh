function checkDeps () {
  echo true;
}

function checkInstall () {
  if [ $(realpath $HOME/.config/rofi/config.rasi) = "$(pwd)/rofi/config.rasi" ]; then
    echo true;
  else
    echo false;
  fi
}