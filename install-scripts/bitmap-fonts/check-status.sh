
function checkDeps () {
  if  [ -d "./deps/bitmap-fonts" ]; then
    echo true;
  else 
    echo false;
  fi
}

function checkInstall () {
  if  [ -d "/usr/share/fonts/bitmap" ]; then
    echo true;
  else 
    echo false;
  fi
}