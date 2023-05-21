function checkDeps () {
  echo true;
}

function checkInstall () {
  if [ $(realpath $HOME/.config/i3/config) = "$(pwd)/config" ]; then
    echo true;
  else
    echo false;
  fi
}