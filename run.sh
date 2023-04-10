#! /bin/bash

Menu(){
	echo -e "1. install_ansible\n2. install_wordpress\n3. install_zabbix"
	read choice
}
function install_ansible.yml(){
	playbook="ansible.sh"
}
function poweroff.yml(){
	playbook="wordpress.sh"
}
function remove_users.yml(){
	playbook="myzabbix.sh"
}

clear
echo "hello"
Menu;
case $choice in
	1) ansible.sh; ;;
	2) wordpress.sh; ;;
	3) myzabbix.sh; ;;
esac
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

read -p "Enter class: " class
echo $playbook




