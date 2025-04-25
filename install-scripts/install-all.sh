#!/bin/bash

# ('module_name', './module/root/path', 'has_deps_downloaded', 'has_been_installed', 'was_selected_for_installation')
#bitmapFonts=('bitmap-fonts' './install-scripts/bitmap-fonts' false false true);
#fontsStep=('material-design-icons' './install-scripts/material-design-icons' false false true);
#polybar=('polybar' './install-scripts/polybar' false false true);
#polyBarScriptsStep=('polybar-scripts' './install-scripts/polybar-scripts' false false true);
#rofi=('rofi' './install-scripts/rofi' false false true);
#i3=('i3' './install-scripts/i3' false false true);
cursors=('cursors' './install-scripts/cursors' false false true);

#modules=(bitmapFonts fontsStep polybar polyBarScriptsStep rofi i3);
modules=(cursors);

declare -n module;

bold=$(tput bold)
normal=$(tput sgr0)

# check each if the dependecy files used for each step exist, and if the module has already been installed
function checkModuleStatus () {
  for module in "${modules[@]}"; do
    if [ -f "${module[1]}/check-status.sh" ]; then
      source "${module[1]}/check-status.sh";
      module[2]=$(checkDeps);
      module[3]=$(checkInstall);
    fi
  done
}

function installModules () {
  echo "";
  echo "${bold}Installing modules: ${normal}"
  for module in "${modules[@]}"; do
      if [ -f "${module[1]}/install.sh" ]; then
        #this module wasn't selected for install so skip it
        if ${module[4]} = true; then
          source "${module[1]}/install.sh";
          setup ${module[3]};
        fi;
      fi
  done
}

function dowloadModules () {
  echo "${bold}Downloading modules: ${normal}"
  for module in "${modules[@]}"; do
      if [ -f "${module[1]}/install.sh" ]; then
        #this module wasn't selected for install so skip downloading it
        if ${module[4]} = true; then
          source "${module[1]}/install.sh";
          download ${module[2]};
        fi;
      fi
  done
}

function createSymLinks () {
  echo "";
  echo "${bold}Linking config files: ${normal}"
  for module in "${modules[@]}"; do
      if [ -f "${module[1]}/install.sh" ]; then
        #this module wasn't selected for install so skip downloading it
        if ${module[4]} = true; then
          source "${module[1]}/install.sh";
          link;
        fi;
      fi
  done
}


mkdir -p dist/ deps/;

./install-scripts/install-setup-utils.sh;
source ./deps/shell-menu-select/get-choice.sh;

platformChoices=('Desktop', 'Laptop');

getChoice -q "What type of machine are you setting up?" -o platformChoices -i 0 -v selectedPlatform;

# start the other install scripts in a sub-shell so they have access to the getChoice command we just sourced;

checkModuleStatus;
dowloadModules;
installModules;
createSymLinks;

