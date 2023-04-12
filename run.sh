#! /bin/bash

Menu(){
	echo -e "1. install_ansible\n2. install_wordpress\n3. install_zabbix"
	read choice
}
function (){
	playbook="ansible.sh"
}
function (){
	playbook="wordpress1.sh"
}
function (){
	playbook="zab.sh"
}

clear
echo "hello"
Menu;
case $choice in
	1) ansible.sh; ;;
	2) wordpress1.sh; ;;
	3) zab.sh; ;;
esac
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

read -p "Enter class: " class
echo $playbook




