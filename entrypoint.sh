#!/bin/bash
mkdir build
cd build
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ../
rm -rf paru
mkdir pacarcarx;string=$(wc -l ../packages.aur); counts=${string%% *};for (( i=1; i<=$counts; i++ )); do echo $i;name=$(awk "NR==$i {print; exit}" ../packages.aur);echo $name;git clone "https://aur.archlinux.org/$name.git" ; cd $name; paru -U --noconfirm;cp $name*.pkg* ../pacarcarx ; cd ../ ; rm -rf $name;paru --clean; done

