#!/bin/bash
version='1.0'
author='Psychopovt'
if [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ "$1" == "-H" ];then
	echo -e "\e[1;31m$0 \e[1;32m-u \e[1;37mor \e[1;32m--url \e[1;37mor \e[1;32m-i \e[1;37mwith only nickname without url 
	For Example \e[1;31m$0 -u xbox
				\e[1;37mversion is\e[1;31m $version
					\e[1;32mmake with \e[1;31m<3 \e[1;36mby \e[1;33m$author"
	exit 0
fi
if [ "$1" == "-u" ] || [ "$1" == "--url" ] || [ "$1" == "-i" ];then
curl -s --socks5 127.0.0.1:9050 https://www.instagram.com/$2/ | grep -e '"profile_pic_url_hd":' | tr ',' '\n' | grep -e .jpg | grep 's320x320' | awk 'NR==1' | sed 's,", ,g' | awk '{print $3}' | while read url;do $(wget -O $2.jpg $url 2> /dev/null);done
	echo -e "\e[1;31m[~] \e[1;37mSTARTING DOWNLOAD IMAGE"
	echo -e "\e[1;31m[!] \e[1;37mfinishd \e[1;32m$2.jpg"
else
	echo "ENTER NICKNAME RIGHT"
	exit 0
fi