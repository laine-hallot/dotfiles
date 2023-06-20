# dotfiles

Dotfiles for making things look nice

Plus a serries of scripts to make setting up new machines easier.

## Usage:

```
./install-scripts/install-all.sh
```

## Todo:

[] Make polybar configs extend one master config to avoid duplicate code
[] Set up systemd service to run `util-scripts/update-timezone.sh` every 5 or so minutes
[] Update `.vimrc`
[] Fix polybar color scheme
[] Add env file and/or params to install-all.sh so that the user can specify what wallpaper and xrandr command to use in the i3 config
[] Script to install basic packages like `i3`, `polybar`, `feh`, ect.
[] Either figure out how to use [linux_notification_center](https://github.com/phuhl/linux_notification_center) or implement something similar using polybar and dunst
