#!/bin/bash
# By Lucas Esmeraldino

###COLORS
BLACK='\033[0;30m'        # Black
RED='\033[0;31m'          # Red
GREEN='\033[0;32m'        # Green
YELLOW='\033[0;33m'       # Yellow
BLUE='\033[0;34m'         # Blue
PURPLE='\033[0;35m'       # Purple
CYAN='\033[0;36m'         # Cyan
WHITE='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRED='\033[1;31m'         # Red
BGREEN='\033[1;32m'       # Green
BYELLOW='\033[1;33m'      # Yellow
BBLUE='\033[1;34m'        # Blue
BPURPLE='\033[1;35m'      # Purple
BCYAN='\033[1;36m'        # Cyan
BWHITE='\033[1;37m'       # White

#MAIN VARIABLES
#BashHistory=$(sudo find / -name ".bash_history" 2>/dev/null)



#FINDING UPONKIT PRIVILLEGE SCALATION
findSTR=$(sudo find / -name "accountsservice" 2>/dev/null)
findSTR1=$(sudo find / -name "gnome-control-center" 2>/dev/null)

#BOOLEANS
accBool=false
controlBool=false

### FINDING FOR UPONKIT CONDITIONS

#CHECK FOR ACCOUNTS SERVICE
if [ "${#findSTR}" != 0 ]
then
        printf "[!] Accountsservice exist.\n"
        accBool="true"
else
        printf "[*] Accountsservice doesn't exist.\n"
fi

#CHECK FOR GNOME CONTROL CENTER 
if [ "${#findSTR1}" != 0 ]
then
        printf "[!] Gnome-control-center exist.\n"
        controlBool="true"
else
        printf "[*] Gnome-control-center doesn't exist.\n"
fi

#UPON KIT CHECK
if [ "$accBool" != "false" ] && [ "$controlBool" != "false" ];
then
        printf "$BRED[!] Can do UponKit.$WHITE"
else
        printf "$BGREEN[*] Can't do UponKit.$WHITE"
fi

#### FINDING TRIES TO UPONKIT

BashHistory=$(sudo find / -name ".bash_history" 2>/dev/null)

printf "\n$YELLOW[*]$WHITE Finding UponKit tries\n"

for i in $BashHistory
do
        printf "$YELLOW"
        cat $BashHistory | grep -E 'time dbus-send'
        printf "$WHITE[!]$i $BGREEN CHECKED\n$WHITE"
done

#### FINDING COMMON PRIVILLEGE SCALATION

### IN BASH HISTORY

BashHistory=$(sudo find / -name ".bash_history" 2>/dev/null)

printf "$YELLOW[*]$WHITE Search for common privillege scalation commands in $YELLOWbash history.\n$WHITE"
for i in $BashHistory
do
        printf "$YELLOW"
        cat $i | grep -E 'pwned|crackmapexec|nmap|fscan|rootkit|heroin|trojan|nc -lvnp|nc -lnvp|worm|python|ruby|sudo su -l|whoami|wget|whoami|kit|upon|uponkit|dbus-send|sudo -u#-1 /bin/bash|find / -perm -u=s -type f 2>/dev/null|WafW00f|ssh|hydra|rm|nc' | sort -u
        printf "$WHITE[!] $i $BGREEN CHECKED\n$WHITE"
done


### IN FILES

printf "$YELLOW[*]$WHITE Search for suspect files.\n$YELLOW"

sudo find / -name "linpeas" -o -name "linenum" -o -name "winpeas"
sudo find / -name "uponkit" -o -name "upon" -o -name "rootkit"
sudo find / -name "pwned" -o -name "hacker" -o -name "hacked" -o -name "pkexec" -o -name "ncrack" -o -name "gs-bus" -o -name "socket"
sudo find / -name "enum" -o -name "payload" -o -name "trojan" -o -name "exploit" -o -name "shell" -o -name "liferay"


### SEARCH FOR SUSPECT STRING IN FILES


printf "$YELLOW[*]$WHITE Searching for suspect strings.\n$YELLOW"

toSearch="gs-bus|ncrack|polkit|pwned|hacked|uponkit|linenum.sh|linpeas"
declare -a pathSearch=("/bin" "/sbin" "/root" "/var/log" "/opt" "/tmp" "/usr/bin")

for a in ${pathSearch[@]}
do
        printf "$YELLOW[*]$WHITE Searching in $a \n$YELLOW"
        sudo grep -Ril -E "$toSearch" $a 2>/dev/null | grep -v .class
        printf "$WHITE[!] $a $BGREEN CHECKED\n$WHITE"
done

### LISTENING PORTS

printf "$YELLOW[*]$WHITE Verifying for listening ports.\n$YELLOW"

netstat -tulpn | grep LISTEN

rm ./verify.sh

printf "$BGREEN[*] Done.\n"
