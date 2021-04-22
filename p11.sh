#!/bin/bash
clear
REGEX='^(ht|f)tp(s?)\:\/\/[0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*(:(0-9)*)*(\/?)( [a-zA-Z0-9\-\.\?\,\’\/\\\+&amp;%\$#_]*)?$'
echo -n "Indica l'adreça URL de la pàgina web que vols obrir: "
read url
nslookup $url
if [[ $url == s ]]
then
	clear
	REGEX='^(ht|f)tp(s?)\:\/\/[0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*(:(0-9)*)*(\/?)( [a-zA-Z0-9\-\.\?\,\’\/\\\+&amp;%\$#_]*)?$'
	echo -n "Indica l'adreça URL de la pàgina web que vols obrir: "
	read url
	nslookup $url
else
	exit 1
fi
exit 0
