
function checkDeps () {
  echo true;
}

function checkInstall () {
  if [ $(realpath $HOME/.config/polybar/config) = "$(pwd)/polybarConfig/config" ]; then
    echo true;
  else
    echo false;
  fi
}