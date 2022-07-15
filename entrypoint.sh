#!/bin/bash
mkdir build
cd build
mkdir pacarcarx;string=$(wc -l ../packages.aur); counts=${string%% *};for (( i=1; i<=$counts; i++ )); do echo $i;name=$(awk "NR==$i {print; exit}" ../packages.aur);echo $name;git clone "https://aur.archlinux.org/$name.git" ; cd $name; makepkg -s;cp $name*.pkg* ../pacarcarx ; cd ../ ; done

