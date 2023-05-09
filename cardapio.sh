#!/bin/bash

if test -f ./.dialogrc; then
        mv .dialogrc $HOME
fi

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="UNIVERSIDADE FEDERAL DO PARANÁ - CURITIBA"
TITLE="Cardápio RU's"
MENU="Escolha seu restaurante universitário:"

OPTIONS=(
    1 "RU Central"
    2 "RU Centro Politécnico"
    3 "RU Jardim Botânico"
    4 "RU Agrárias"
)

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                "$HEIGHT" "$WIDTH" "$CHOICE_HEIGHT" \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

scrap() {
    RU="$1"
    FILE=$(lynx --dump "https://pra.ufpr.br/ru/$RU/")
    CARDAPIO=$(echo "$FILE" | sed -n '/Cardápio RU/,$p' | sed '4d;/SENHOR/d' | sed -n '/VOCÊ/q;p')
    echo "$CARDAPIO"
}

case $CHOICE in
    1)
        ADDRESS=$(scrap "ru-central")
        echo -e "\n"
        dialog --clear --title "" --msgbox "$ADDRESS" 0 0
        ;;
    2)
        ADDRESS=$(scrap "ru-centro-politecnico")
        echo -e "\n"
        dialog --clear --title "" --msgbox "$ADDRESS" 0 0
        ;;
    3)
        ADDRESS=$(scrap "cardapio-ru-jardim-botanico")
        echo -e "\n"
        dialog --clear --title "" --msgbox "$ADDRESS" 0 0
        ;;
    4)
        ADDRESS=$(scrap "cardapio-ru-agrarias")
        echo -e "\n"
        dialog --clear --title "" --msgbox "$ADDRESS" 0 0
        ;;
esac

clear
