#! /bin/bash
clear

#*******start menu
echo "Hello there! 
It automatic install zabbix, apache2 and MariaSQL on ubuntu-server 22.04
if you run this tham you accept our and other conditions!"
read -p "Press [Enter] key to start ..."
sleep 1
echo "Note: please correct input data else you broke your machine" 
echo "enter your user for DB in MariaSQL and PHP" 
read username
echo "enter password " 
read password
echo "and also enter name DB for zabbix DB "
read db
read -p "Press [Enter] key to start ..."
#*****
sudo apt update && sudo apt upgrade -y
#apt install -y apache2
#systemctl enable apache2
#apt install -y mysql-server
#systemctl enable mysql
#apt install -y php libapache2-mod-php php-mysql

#***** gets componetss

#wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-3+ubuntu$(lsb_release -rs)_all.deb
wget https://repo.zabbix.com/zabbix/6.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.2-4%2Bubuntu22.04_all.deb

#sudo dpkg -i zabbix-release_6.0-3+ubuntu$(lsb_release -rs)_all.deb
sudo dpkg -i zabbix-release_6.2-4+ubuntu22.04_all.deb

sudo apt update
sudo apt -y install zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-sql-scripts zabbix-agent
sudo apt install software-properties-common -y
curl -LsS -O https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
sudo bash mariadb_repo_setup --mariadb-server-version=10.6
sudo apt update
sudo apt -y install mariadb-common mariadb-server-10.6 mariadb-client-10.6
sudo systemctl start mariadb
sudo systemctl enable mariadb
#*********************************


#************SQL setting
mysql -u root -p -e "CREATE USER '$username'@'localhost' IDENTIFIED BY '$password';"
mysql -u root -p -e "GRANT ALL PRIVILEGES ON *.* TO '$username'@'localhost';"
mysql -u root -p -e "CREATE DATABASE $db;"
mysql -u root -p -e "FLUSH PRIVILEGES;"
mysql -u root -p -e "set global log_bin_trust_function_creators = 1;"
#*****************************************


#***** for coffe
echo "Import database shema for Zabbix server (could last up to 5 minutes):"
echo "*********************************************************************"
zcat /usr/share/zabbix-sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8 -u$username  -p$password  $db
mysql -u root -p -e "set global log_bin_trust_function_creators = 0;"
#***************

#*****zabbix conf


sed -i "s/DBName=.*/DBName=${db}/" /etc/zabbix/zabbix_server.conf
sed -i "s/DBUser=.*/DBUser=${username}/" /etc/zabbix/zabbix_server.conf
sed -i "s/#\s*DBPassword=.*/DBPassword=${password}/" /etc/zabbix/zabbix_server.conf
#********************

#**** firewall
sudo ufw enable
sudo ufw allow 10050/tcp
sudo ufw allow 10051/tcp
sudo ufw allow 161/tcp
sudo ufw allow 80/tcp
sudo ufw reload
#*****************

#*****and this
sudo systemctl restart zabbix-server zabbix-agent 
sudo systemctl enable zabbix-server zabbix-agent
#****************

#*****apache conf

#search="# php_value date.timezone Europe/Riga"
#replace="php_value date.timezone Europe/Kiev"
#sed -i "s/#\s*DBPassword=.*/DBPassword=${password}/" /etc/zabbix/zabbix_server.conf
# /etc/zabbix/apache.conf

sudo systemctl restart apache2
sudo systemctl enable apache2
#****



#*****************finish
echo "install done
for continue setting try in your brouser
http://your_server_adresess/zabbix
"
echo "Note: For registration use your data: username" $username "  password: " $password " DBname:   " $db "  lodin to your zabbix with Login 'Admin' and passwoed 'zabbix'"
