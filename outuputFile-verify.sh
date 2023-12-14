#!/bin/bash
#By Lucas Esmeraldino

###COLORS
BLACK='\033[0;30m'        # Black
RED='\033[0;31m'          # Red
GREEN='\033[0;32m'        # Green
YELLOW='\033[0;33m'       # Yellow
BLUE='\033[0;34m'         # Blue
PURPLE='\033[0;35m'       # Purple
CYAN='\033[0;36m'         # Cyan
WHITE='\033[0;37m'        # White


while IFS= read -r line
do
        printf "\n$RED=>$line$CYAN\n" | tee -a logFile.txt
        cat $line | grep -E -E "gs-bus|ncrack|polkit|pwned|hacked|uponkit|linenum.sh|linpeas" | tee -a logFile.txt
        sleep 2
done < outputVerify.txt
