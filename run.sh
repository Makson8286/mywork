#! /bin/bash

Menu(){
        echo -e "1. install_ansible\n2. install_wordpress\n3. install_zabbix"
        read choice
        case $choice in
                1) bash="ansible.sh"; ;;
                2) bash="wordpress1.sh"; ;;
                3) bash="zab.sh"; ;;
        esac
}
function ansible_sh(){
        bash="ansible.sh"
}
function wordpress1_sh(){
        bash="wordpress1.sh"
}
function zab_sh(){
        bash="zab.sh"
}

clear
echo "Вибір завантаження"
Menu;
bash /home/test/mywork/$bash
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Menu1(){
        echo -e "1. сайт кулінарії\n2. сайт IT"
        read choice1
        case $choice1 in
                1) bash="1.sh"; ;;
                2) bash="2.sh"; ;;
        esac
}
function 1_sh(){
        bash1="1.sh"
}
function 2_sh(){
        bash1="2.sh"
}

clear
echo "Вибір сайту"
Menu1;

read -p "Enter class: " room

bash /home/test/mywork/$bash1
