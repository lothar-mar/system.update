#!/bin/bash
clear
echo "This script will do a full system update, including the AUR, using pacman. Please Stand-by."
echo
echo "Please do aurget -Syu --deps if needed or cower -f -c -t ~/local.repository/aur -d -u."
echo "please remark that:"
echo "	  i) aurget is being deprecated. use cower as much as possible."
echo "	 ii) i've setup a cower alias @bashrc, so just use -d and -u options."
echo "	iii) after enter the folders at local.repository/aur and do makepkg -s, followed by sudo pacman -U *.tar.xz."
echo "One last thought, remember that after an update it might be necessary to update all software that uses it as dependency."

while :
do
	clear
	cat << EOF
	This script will do a full system update, including the AUR, using pacman. Please Stand-by.
	Please do aurget -Syu --deps if needed or cower -f -c -t ~/local.repository/aur -d -u.
	Please remark that:
	i)		aurget is being deprecated. use cower as much as possible.
	ii)		i've setup a cower alias @bashrc, so just use -d and -u options.
	iii)		after enter the folders at local.repository/aur and do makepkg -s, followed by sudo pacman -U *.tar.xz.
	One last thought, remember that after an update it might be necessary to update all software that uses it as dependency.

	LocalMachine:
		1) Show how many packages are installed
		2) Run pacgraph
		3) Show disk usage
		4) Update mirror list with reflector
		5) Full system update
		6) Check for available AUR updates with cower
		7) Update local.repository/aur with cower
		8) Run pacdiff
		9) List all explicitly installed packages
		10) List all packages no longer required as dependencies (orphans) 
		21) Remove a package and all its orphan dependencies (sudo pacman -Rs package)
		30) Clear pacman cache
	
	Pippin (seedbox)
		60) ssh this box

	Merriadoc (IRC and IM)
		70) ssh this box

	Samwise (netbook)
		80) ssh this box
		
		99) exit
EOF

read input_1
case $input_1 in
	1) echo "This system has"; sudo pacman -Q|wc -l; echo "packages installed.";;
	2) pacgraph; feh pacgraph.png;;
	3) df;;
	4) echo "Please wait while we download mirrorlist, scan and sort mirrors."; sudo reflector -l 12 --sort rate --save /etc/pacman.d/mirrorlist; echo "Mirror selection complete.";;
	5) sudo pacman -Syy; sudo pacman -S linux-headers --needed && sudo pacman -Syu; echo "Update complete.";;
	6) cower -u;; 
	7) cower -u -d -c -f -t ~/local.repository/aur; echo "Local Repository updated. Please use makepkg -s to build these packages.";;
	8) sudo pacdiff -l -f ~/pacgraph ; echo "Done.";;
	9) sudo pacman -Qie|less;;
	10) sudo pacman -Qdt|less;;
	21) echo "Unimplemented.";;
	30) sudo pacman -Scc;;
	60) echo "Unimplemented.";;
	70) echo "Unimplemented.";;
	80) echo "Unimplemented.";;
	99) exit ;;
	*) wrong insert;;
esac
read foo
done

