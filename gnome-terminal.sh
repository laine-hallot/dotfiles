#!/usr/bin/env bash
palette="['#12205b','#070618','#243c90','#405db7','#7187fe','#94c2f5','#2c74f0','#544562','#90688b','#a6a0c6','#ddaea8','#ce7756','#ffd77f','#ef9330','#8b3d3b','#28412f']"
default=$(dconf read /org/gnome/terminal/legacy/profiles:/default | sed -e "s/'//g")
dconf write /org/gnome/terminal/legacy/profiles:/:$default/palette "$palette"
