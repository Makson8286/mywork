#! /bin/bash
clear

echo "Hello there! 
It automatic install wordpress and LAMP on ubuntu
if you run this that you accept our and other conditions!"
sleep 1 
#echo "Note: please correct input data else you broke your machine" 
#echo "enter your user for DB in MySQL and PHP" 
#read username
#echo "enter password " 
#read password
#echo "and also enter name DB for Wordpress "
#read wp

username="wp"
password="wp"
wp="wp"

apt -y update



apt install -y apache2
systemctl enable apache2
apt install -y mysql-server
systemctl enable mysql
apt install -y php libapache2-mod-php php-mysql


cd /var/www/html/

rm -rf /var/www/html/index.html

echo "<?php" >> /var/www/html/info.php  
echo "phpinfo();" >> /var/www/html/info.php

apt update -y

apt install -y phpmyadmin php-mbstring php-zip php-gd php-json php-curl

systemctl restart apache2


#mysql_secure_installation

mysql -u root -p -e "CREATE USER '$username'@'localhost' IDENTIFIED BY '$password';"
mysql -u root -p -e "GRANT ALL PRIVILEGES ON *.* TO '$username'@'localhost';"
mysql -u root -p -e "CREATE DATABASE $wp;"
mysql -u root -p -e "FLUSH PRIVILEGES;"

#echo "http://your_IPaddress/phpmyadmin/"
#echo "Create MySql User"
#echo "CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';"
#echo "GRANT ALL PRIVILEGES ON *.* TO 'username'@'localhost';"
#echo "CREATE DATABASE wp;"
#echo "FLUSH PRIVILEGES;"

#mysql -u root -p

#install wordpress 

#cd $HOME_DIR
sudo curl -O https://wordpress.org/latest.tar.gz $HOME_DIR
tar xzvf latest.tar.gz $HOME_DIR
#cd wordpress/
cp wordpress/* -R /var/www/html/
#cd /var/www/html/
chown -R www-data:www-data /var/www/html/



if [ -f /var/www/html/wp-config.php ]; then
  echo "WordPress успішно встановлено"
  # видалення bash скрипту
	echo "install done
	for continue setting try in your brouser
	http://your_server_adresess
	"
	echo "Note: For registration use your data " $username $password $wp
  rm ins.sh $HOME_DIR
  #rm "$0"
else
  echo "Помилка: WordPress не встановлено"
fi



