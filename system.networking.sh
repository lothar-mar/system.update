#!/bin/bash
clear
# Variable initialization
wired_interface="enp2s0"
wireless_interface="wlp3s0"
wired_driver="r8169"
wireless_driver="iwl3945"

while :
do
	clear
	cat << EOF
	This script will interface the most common networking options. Please Stand-by.
	
	Wired Connections:
		1) List wired interface and up/down states - look for UP or DOWN in the <array>
		2) Set wired interface UP
		3) Set wired interface DOWN
		4) Show IP status of wired interface 
		5) Get an IP adress in DHCP mode.
		6) 
		7) 
		8) 
		9) 
		10) 
	
	Wireless Connections:
		41) List wireless interface and up/down states - look for UP or DOWN in the <array>
		42) Set wireless interface UP
		43) Set wireless interface DOWN
		44) Show IP status of wireless interface
		45) List status of wireless interface connection, including MAC, frequency, signal strenght, SSID, etc.
		46) List available wifi networks
		47) List available netctl profiles
		48) Connect to an open wifi network. Needs ESSID info.
		49) Connect to an WEP wifi network. Needs ESSID and WEP key info.
		50) Connect to an WPA/WPA2 wifi network using WPA_SUPPLICANT. Needs ESSID and WPA key info. Check the following 2 items on this list.
		51) Hash a WPA clear text passphrase.
		52) Edit WPA_SUPLLICANT.
		53) Get an IP ADDRESS in DHCP mode.

	Common Tools:
		60) Ping www.google.com
		61) List all interfaces and up/down states - look for UP or DOWN in the <array>
		62) List IP addresses of all interfaces

	Hardware Status:
		70) List device names (via sysfs) 
		71) List wired cards
		72) List wired card kernel module/driver
		73) Check wired driver/module status
		74) List wireless cards
		75) List wireless card kernel module/driver
		76) Check wireless driver/module status

	EXIT	
		99) exit
EOF

read input_1
case $input_1 in
	1) ip link show dev $wired_interface;;
	2) sudo ip link set $wired_interface up; echo "Done.";;
	3) sudo ip link set $wired_interface down; echo "Done.";;
	4) ip addr show dev $wired_interface;;
	5) sudo dhcpcd $wired_interface; echo "Done.";;


	41) ip link show dev $wireless_interface;;
	42) sudo ip link set $wireless_interface up; echo "Done.";;
	43) sudo ip link set $wireless_interface down; echo "Done.";;
	44) ip addr show dev $wireless_interface;;
	45) iw dev $wireless_interface link;;
	46) iw dev $wireless_interface scan|less;;
	47) netctl list;;
	48) echo "What's your target ESSID?"; read target_essid; sudo iw dev $wireless_interface connect $target_essid;;
	49) echo "What's your target ESSID?"; read target_essid; echo "What's your target authentication key? Insert hexadecimal or ascii format."; read target_WEP_key; sudo iw dev $wireless_interface connect $target_essid key 0:$target_WEP_key;;
	50) echo "Starting connection. Please press Enter."; read simple_enter_input; sudo wpa_supplicant -i $wireless_interface -c /etc/wpa_supplicant/wpa_supplicant_test.conf;;
	51) echo "Initiating password hashing process. What's your target ESSID?"; read target_essid; echo "What's your clear text password?"; read clean_text_wpa_pass; wpa_passphrase $target_essid $clean_text_wpa_pass;;
	52) echo "I'll need to edit a config file with ESSID and PASSWORD. Please press enter to enter edit mode."; read simple_enter_input; sudo vim /etc/wpa_supplicant/wpa_supplicant_test.conf; echo "Finished editing.";;
	53) sudo dhcpcd $wireless_interface; echo "Done.";;


	60) ping www.google.com;;
	61) sudo ip link show;;
	62) ip addr;;

	70) echo "These are the listed interfaces";ls /sys/class/net;echo;echo "And these are the named interfaces in this script:";echo $wired_interface;echo $wireless_interface;echo;echo "If they don't match please edit this script.";;
	71) lspci -nn|grep -i Ethernet;;
	72) dmesg|grep $wired_driver;;
	73) lsmod | grep -i $wired_driver;;
	74) lspci -nn|grep -i wireless;;
	75) lsmod | grep -i $wireless_driver;;
	76) dmesg|grep $wireless_driver;;

	99) exit ;;
	*) wrong insert;;
esac
read foo
done

