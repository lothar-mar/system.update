
#!/bin/bash
clear
echo "This script will do a full system update, including the AUR, using pacman. Please Stand-by."
sleep 3

# choosing mirrors for update
echo "Please wait while we download mirrorlist, scan and sort mirrors."
sudo reflector -l 12 --sort rate --save /etc/pacman.d/mirrorlist
echo "Mirror selection complete."
echo
#choose if you want to use pacman ou yaourt 
sudo pacman -Syy
sleep 3
echo "Updating system. Please Stand-by."
echo
sudo pacman -Syu
echo
echo "Update complete."
echo
aurcheck
echo
echo "Please do aurget -Syu if needed."
echo "Eitherway, have a nice day."
exit
