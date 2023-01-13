#!/bin/bash

mv .dialogrc $HOME

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="UNIVERSIDADE FEDERAL DO PARANÁ - CURITIBA"
TITLE="Cardápio RU's"
MENU="Escolha seu restaurante universitário:"

OPTIONS=(1 "RU Central"
         2 "RU Centro Politécnico"
         3 "RU Jardim Botânico"
 	 4 "RU Agrárias")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

case $CHOICE in
        1)
            FILE=$(lynx --dump https://pra.ufpr.br/ru/ru-central/)

	    echo -e " "

	    CARDAPIO=$(echo "$FILE" | sed -n '/Cardápio RU/,$p' | sed -n '/SENHOR/q;p')
	    dialog  --clear\
 		    --title "" \
 		    --msgbox "$CARDAPIO" \
 		    0 0
            ;;
        2)
            FILE=$(lynx --dump https://pra.ufpr.br/ru/ru-centro-politecnico/)

            echo -e " "

	    CARDAPIO=$(echo "$FILE" | sed -n '/Cardápio RU/,$p' | sed -n '/SENHOR/q;p')
            dialog --clear \
	    	   --title "" \
                   --msgbox "$CARDAPIO" \
                   0 0
            ;;
        3)
            FILE=$(lynx --dump https://pra.ufpr.br/ru/cardapio-ru-jardim-botanico/)
            echo -e " "

	    CARDAPIO=$(echo "$FILE" | sed -n '/Cardápio RU/,$p' | sed -n '/SENHOR/q;p')
            dialog --clear \
 		   --title "" \
 		   --msgbox "$CARDAPIO" \
                   0 0
            ;;
 	4)
            FILE=$(lynx --dump https://pra.ufpr.br/ru/cardapio-ru-agrarias/)

            echo -e " "

	    CARDAPIO=$(echo "$FILE" | sed -n '/Cardápio RU/,$p' | sed -n '/SENHOR/q;p')
            dialog --clear \
 		   --title "" \
 		   --msgbox "$CARDAPIO" \
		   0 0
	    ;;
esac
clear
