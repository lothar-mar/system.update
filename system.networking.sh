#!/bin/bash
clear
while :
do
	clear
	cat << EOF
	This script will interface the most common networking options. Please Stand-by.
	
	Wired Connections:
		1) List wired interfaces
		2)  
		3) 
		4) 
		5) 
		6) 
		7) 
		8) 
		9) 
		10) 
	
	Wireless Connections:
		40) List wireless interfaces 

	Common Tools:
		60) Ping www.google.comi
		61) List all interfaces and up/down states - look for UP or DOWN in the <array>
		62) List IP addresses of all interfaces

	Hardware Status:
		70) List wired cards
		71) List wired card driver
		72) List wireless cards
		73) List wireless card drivers

	EXIT	
		99) exit
EOF

read input_1
case $input_1 in
	1) echo "This system has"; sudo pacman -Q|wc -l; echo "packages installed.";;
	2) ;;
	
	
	60) ping www.google.com;;
	61) sudo ip link show;;
	62) ip addr;;

	71) echo "Unimplemented.";;
	99) exit ;;
	*) wrong insert;;
esac
read foo
done

