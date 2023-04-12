#! /bin/bash

Menu(){
	echo -e "1. install_ansible\n2. install_wordpress\n3. install_zabbix"
	read choice
}
function ansible.sh(){
	bash="ansible.sh"
}
function wordpress1.sh(){
	bash="wordpress1.sh"
}
function zab.sh(){
	bash="zab.sh"
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
cd /home/ubuntu/pasta/

read -p "Enter class: " class
echo $bash
bash $class /home/ubuntu/pasta/$bash

Menu1(){
	echo -e "1. сайт кулінарії\n2. сайт IT"
	read choice1
}
function 1.sh(){
	bash="1.sh"
}
function 2.sh(){
	bash="2.sh"
}

clear
echo "Вибір сайту"
Menu1;
case $choice1 in
	1) 1.sh; ;;
	2) 2.sh; ;;
esac
cd /home/ubuntu/pasta/
read -p "Enter class: " room

echo $bash
bash $room /home/ubuntu/pasta/$bash
