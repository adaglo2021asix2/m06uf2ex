#!/bin/bash
clear
#######COMPROVANT SI L'ARXIU DE GUIÓ L'EXECUTA L'USUARI ROOT###################
if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 4 
fi

echo "PROGRAMA DE CAMBIO DE CONTRASEÑAS A LOS USUARIS"
echo
echo -n "Dóna el nombre d'usuaris que es vol crear (MÍN=1 MÀX=30): "
read n_usr
if (( $n_usr < 1 )) || (( $n_usr > 30 ))
then
	echo "Nombre incorrecte d'usuaris"
	exit 1
fi
echo -n "Dóna un nom base pels usuaris: "
read nom_base

echo "LLISTA D'USUARIS" > /root/$nom_base
if (( $? != 0 ))
	then
		echo "Problema creant el fitxer d'usuaris i contrasenyes"
		exit 3
	fi
echo "Format de la llista: Nom d'usuari  Contrasenya" >> /root/$nom_base  

for (( num=1; num<=$n_usr; num++ )) 
do
	ctsnya=$(pwgen 10 1)
	nom_usr=$nom_base$num.clot
	echo "$nom_usr  $ctsnya" >> /root/$nom_base
	useradd $nom_base$num.clot -g users -d /home/$nom_base$num.clot -m -s /bin/bash -p $(mkpasswd $ctsnya)
	if (( $? != 0 ))
	then
		echo "Problema creant els usuaris"
		exit 2
	fi
	cat /etc/passwd
done 
exit 0
