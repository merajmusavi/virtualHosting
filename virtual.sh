#!/bin/bash

while true; do
        read -p "enter your website name" WEBNAME
        if [ -d "/var/www/html/$WEBNAME" ];then
                echo "file already exists"
        else
sudo mkdir /var/www/html/$WEBNAME
break
        fi
done
read -p "enter your name " username

htmlcode="<h1>$username</h1>"

echo $htmlcode > /var/www/html/$WEBNAME/index.html

echo "html file has been created"

read -p "import your ip " ip
sudo ip addr add "${ip/24}" dev wlp3s0 label wlp3s0

code="<VirtualHost $ip:80>
	#ServerName www.example.com

	ServerAdmin $username@localhost
	DocumentRoot /var/www/html/$WEBNAME

	#LogLevel info ssl:warn

	ErrorLog ${APACHE_LOG_DIR}/error-dir1.log
	CustomLog ${APACHE_LOG_DIR}/access-dir1.log combined

	# For most configuration files from conf-available/, which are
	# enabled or disabled at a global level, it is possible to
	# include a line for only one particular virtual host. For example the
	# following line enables the CGI configuration for this host only
	# after it has been globally disabled with "a2disconf".
	#Include conf-available/serve-cgi-bin.conf
</VirtualHost>
"

echo $code > /etc/apache2/sites-available/$WEBNAME.conf
sudo a2ensite $WEBNAME.conf
sudo systemctl reload apache2.service
meraj@meraj-X556UR:~/Desktop/bash$ 
                                                  
