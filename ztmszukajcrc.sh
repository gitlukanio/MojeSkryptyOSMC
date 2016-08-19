#!/bin/bash

function hex2dec() {
    if [[ $1 ]]; then
         echo $((16#$1))
    else
        echo "Convert Hex$((16#$1))adecimal numbers to Decimal"
        echo "Usage: hex2dec [Hexadecimal numbers]"
    fi
}
function dec2bin() {
    if [[ $1 ]]; then
        wynik=$(echo "obase=2 ; $1" | bc)
	wynik="000000000"$wynik
  	wynik=$(echo -n $wynik | tail -c $2)
	echo $wynik
    else
        echo "bład funkcji dec2bin!!!"
    fi
}
function hex2bin() {
 if [[ $1 ]]; then
  wynik=$(echo "obase=2 ; ibase=16 ; $1" | bc)
  wynik="000000000"$wynik
  wynik=$(echo -n $wynik | tail -c 4)
  echo $wynik
 else
  echo "bład funkcji hex2bin!!!"
 fi
}
#=====================================================
#
function hex2bin2() {
  LSEK=$(echo -n $1 | wc -c) #dlugosc sektora
  for (( i=1; i<=$LSEK; i++ ))
  do
    hex=$(echo -n $1 | cut -c $i )
    bin=$bin$(hex2bin $hex)
  done 
  echo $bin
}
function bin2hex() {
    if [[ $1 ]]; then
        echo "obase=16 ; ibase=2 ; $1" | bc
    else
        echo "Convert Binary numbers to Hexadecimal"
        echo "Usage: bin2hex [Binary numbers]"
    fi
}
function replaceByte() {
    echo -ne \\x$2 | sudo dd of=tmp bs=1 seek=$1 count=1 conv=notrunc &> /dev/null
}
function wyjscie() {
   exit
}

function dec2hex() {
    if [[ $1 ]]; then
        echo "obase=16 ; $1" | bc
    else
        echo "Convert Decimal numbers to Hexadecimal"
        echo "Usage: dec2hex [Decimal numbers]"
    fi
}


#======== Koniec deklaracji funkcji ========

echo " "
echo "Szukam CRC dla: $1"
echo " "


#echo "Analiza danych:"

#SEK2X=$1
#SEK2B=$(hex2bin2 $SEK2X)
#liczbasks2=$(echo -n $SEK2B | cut -c 5-16 )
#rokwaz2=$(echo -n $SEK2B | cut -c 17-23 )
#miewaz2=$(echo -n $SEK2B | cut -c 24-27 )
#dziewaz2=$(echo -n $SEK2B | cut -c 28-32 )
#godzwaz2=$(echo -n $SEK2B | cut -c 33-37 )
#minwaz2=$(echo -n $SEK2B | cut -c 38-43 )
#roksks2=$(echo -n $SEK2B | cut -c 44-50 )
#miesks2=$(echo -n $SEK2B | cut -c 51-54 )
#dziesks2=$(echo -n $SEK2B | cut -c 55-59 )
#godzsks2=$(echo -n $SEK2B | cut -c 60-64 )
#minsks2=$(echo -n $SEK2B | cut -c 65-70 )
#linia2=$(echo -n $SEK2B | cut -c 71-84 )
#bryg2=$(echo -n $SEK2B | cut -c 85-94 )
#waznx2=$(echo -n $SEK2X | cut -c 5-8 )
#waznosc2=$(date +"%Y-%m-%d" --date="20$((2#$rokwaz2))-$((2#$miewaz2))-$((2#$dziewaz2))")
#skasowanie2=$(date  +"%Y-%m-%d" --date="20$((2#$roksks2))-$((2#$miesks2))-$((2#$dziesks2))")

#echo " "
#echo "---=== *** *** *** ===---"
#echo " "
#echo "Skasowanie nr: $((2#$liczbasks2)) "
#echo "Wazne do: $waznosc2 $((2#$godzwaz2)):$((2#$minwaz2)) "
#echo "Skasowano: $skasowanie2 $((2#$godzsks2)):$((2#$minsks2)) "
#echo "Linia: $((2#$linia2)) "
#echo "Brygada: $((2#$bryg2)) "
#echo " "
#echo "---=== *** *** *** ===---"
#echo " "

echo "Obliczam CRC $2 za pomoca funkcji cksum: "
echo -ne "" > tmp

  LSEK=$(echo -n $1 | wc -c) #dlugosc sektora
  for (( i=1; i<=$LSEK; i++ ))
  do
    g=$(($i+1))
    h=$(echo -en "$i-$g")
    hex=$(echo -n $1 | cut -c $h )
  #  echo " iteracja $i wartosc hex: $hex "
    echo -ne "\x$hex" >> tmp
    i=$(($i+1))
  done

echo -n "DEC: "
cksum tmp | cut -d' ' -f1
echo -n "HEX: "
wynik=$(cksum tmp | cut -d' ' -f1)
printf '%x\n' $wynik
echo " "
echo "Obliczam CRC $2 za pomoca funkcji crc32: "
crc32 tmp
echo " "





exit








while [ 1==1 ]
do
	#echo "$powtorka "
	echo "[ M E N U ]"
	echo "[1 - Zm waznc] [2 - Zm kontrakt] [3- Zapisz] [4 - Odczyt]"
	echo "[5 - Aktywacja] [6 - Wyjdz]"
	echo -n "Co zrobi�ć?:"
	read cozrobic
	echo " "
	case "$cozrobic" in
	  "1") zmienwaznosc ;;
	  "2") zmienkontrakt t;;
	  "3") zapisz ;;
	  "4") odczytkarty ;;
	  "5") aktywacja ;;
	  "6") wyjscie ;;
	  *) wyjscie
	esac
done
