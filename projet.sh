if [ "$1" == "-g" ]; then
    zenity --question --title="Question." --ok-label="oui" --cancel-label="non" --text="Lancer l'application ?"

first=$(zenity --forms \
    --title="bienvenue a notre projet realisé par Hcini Heni et firas mechmech" \
   --width=700 --height=200 \
    --text="Quel est votre nom et prénom" \
    --add-entry="Nom de l'utilisateur" \
    --add-entry="prenom de l'utilisateur" ) 

zenity --info --title="bienvenue " --text="monsieur/madame :$first" 
while true; do
ask=`zenity --list --title="choisir les options" --width=700 --height=500 --column="choisir une option" "1-lancer la commande top" "2-lancer la commande ps-aux" "3-afficher les processus lances par l'utilisateur root" "4-pour afficher les processus les plus gourmandes en terme cpu" "5-demande de help"   "Quitter"  --hide-header`

if [ "$ask" == "1-lancer la commande top" ]; then
top -c >repert
FILE=`dirname $0`/repert
#zenity --question  --list --width=700 --height=500 --column=commande <repert 
zenity \
--text-info\
--title="commande top"\
--filename=$FILE\
--width=700 \
--height=500
fi

if [ "$ask" == "2-lancer la commande ps-aux" ]; then
     ps -aux >repert
zenity --list --width=700 --height=500 --column=commande <repert
fi

if [ "$ask" == "3-afficher les processus lances par l'utilisateur root" ]; then
    ps -u root >repert
zenity --list --width=700 --height=500  --column=commande <repert 

fi

if [ "$ask" == "4-pour afficher les processus les plus gourmandes en terme cpu" ]; then
ps -eo pmem,pcpu,pid,args | tail -n +2 | sort -rnk 2 | head -5 >repert
zenity --list --width=700 --height=500 --column=commande <repert
fi

if [ "$ask" == "5-demande de help" ]; then
help >repert
zenity --list --width=700 --height=500 --column=commande <repert
fi

if [ "$ask" == "Quitter" ]; then
exit 
fi
done
fi
if [ "$1" == "-t" ]; then
    
while true
do
echo "vous devez choisir une alternative" 
echo " tapez 1 pour lancer la commande top "
echo " tapez 2 pour lancer la commande ps-aux "
echo " tapez 3 pour afficher les processus lances par l'utilisateur root "
echo "tapez 4 pour afficher les processus les plus gourmandes en terme cpu "
echo " tapez 5  pour afficher le help "
echo "tapez quitter pour quitter "
echo " donner votre choix  " 
read choix 


case $choix in 
   1)
     top
     ;;
   2)
     ps -aux
     ;;
   3)
         ps -u root
     ;;
   4)
ps -eo pmem,pcpu,pid,args | tail -n +2 | sort -rnk 2 | head -5

     ;;

    5)
     help   
 ;;
quitter) 
exit 
;;
   *)
echo " choix incorrect " 
;;
esac
done 
fi
if [ "$1" == "-ltop" ]; then
    top 
fi

if [ "$1" == "-lps" ]; then
     ps -aux
fi
if [ "$1" == "-root" ]; then
         ps -u root
fi
if [ "$1" == "-mcpu" ]; then
    ps -eo pmem,pcpu,pid,args | tail -n +2 | sort -rnk 2 | head -5 
fi
if [ "$1" == "-help" ]; then
    help
fi
