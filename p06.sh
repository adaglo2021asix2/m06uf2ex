#!/bin/bash

comptador()
{
	local compte
	local fitxer
	
	compte=0
	for fitxer in $1/*  
	do
		if [[ -s $fitxer ]] &&  [[ -x $fitxer ]]  
		then           
			(( compte++ ))	
		fi
	done
	echo "Número de fitxers: $compte"
}

clear
echo -n "Indica el camí complet del directori de treball: "
read dir
comptador $dir

exit 1
