#! /bin/bash

Menu(){
	echo -e "1. install_ansible\n2. install_wordpress\n3. install_zabbix"
	read choice
}
function ansible.sh (){
	playbook="ansible.sh"
}
function wordpress1.sh (){
	playbook="wordpress1.sh"
}
function zab.sh (){
	playbook="zab.sh"
}

clear
echo "Вибір завантаження"
Menu;
case $choice in
	1) ansible.sh; ;;
	2) wordpress1.sh; ;;
	3) zab.sh; ;;
esac
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
cd /home/ubuntu/

read -p "Enter class: " class

Menu(){
	echo -e "1. сайт кулінарії\n2. сайт IT"
	read choice
}
function 1.sh (){
	playbook="1.sh"
}
function 2.sh (){
	playbook="2.sh"
}

clear
echo "Вибір сайту"
Menu;
case $choice in
	1) 1.sh; ;;
	2) 2.sh; ;;
esac
read -p "Enter class: " class1
