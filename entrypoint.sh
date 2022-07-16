#!/bin/bash
sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd ../
rm -rf paru
paru -Pc| grep AUR| sed 's/ .*//' > packages.aur
mkdir build
cd build
mkdir pacarcarx;string=$(wc -l ../packages.aur); counts=${string%% *};for (( i=1; i<=$counts; i++ )); do echo $i;name=$(awk "NR==$i {print; exit}" ../packages.aur);echo $name;git clone "https://aur.archlinux.org/$name.git" ; cd $name; paru -U --noconfirm;cp $name*.pkg* ../pacarcarx ; cd ../ ; rm -rf $name;paru --clean --noconfirm; done

