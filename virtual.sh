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
~                                                         
