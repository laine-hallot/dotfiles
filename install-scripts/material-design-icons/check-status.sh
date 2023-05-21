
function checkDeps () {
  if  [ -d "./deps/material-design-icons" ]; then
    echo true;
  else 
    echo false;
  fi
}

function checkInstall () {
  if  [ -d "/usr/share/fonts/material-design-icons-fonts" ]; then
    echo true;
  else 
    echo false;
  fi
}