
function checkDeps () {
  echo true;
}

function checkInstall () {
  if ! [ -f ./polybarConfig/config]; then
    echo false;
    return;
  fi;

  if [ $(realpath $HOME/.config/polybar/config) = "$(pwd)/polybarConfig/config" ]; then
    echo true;
  else
    echo false;
  fi
}