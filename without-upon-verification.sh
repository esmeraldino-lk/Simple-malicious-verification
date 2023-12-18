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

#### FINDING COMMON PRIVILLEGE SCALATION

### IN BASH HISTORY

BashHistory=$((BashHistory + sudo find /home -name ".bash_history" 2>/dev/null))

printf "$YELLOW[*]$WHITE Search for common privillege scalation commands in $YELLOWbash history.\n$WHITE"
for i in $BashHistory
do
        printf "$YELLOW"
        cat $i | grep -E 'pwned|crackmapexec|nmap|fscan|rootkit|heroin|trojan|nc -lvnp|nc -lnvp|worm|python|ruby|sudo su -l|whoami|wget|whoami|kit|upon|uponkit|dbus-send|sudo -u#-1 /bin/bash|find / -perm -u=s -type f 2>/dev/null|WafW00f|ssh|hydra|rm|nc' | sort -u
        printf "$WHITE[!] $i $BGREEN CHECKED\n$WHITE"
done


### IN FILES

printf "$YELLOW[*]$WHITE Search for suspect files.\n$YELLOW"

sudo find /bin -name "pwned" -o -name "hacker" -o -name "hacked" -o -name "pkexec" -o -name "ncrack" -o -name "gs-bus" -o -name "socket" -o -name "enum" -o -name "payload" -o -name "trojan" -o -name "exploit" -o -name "shell" -o -name "liferay" -o -name "uponkit" -o -name "upon" -o -name "rootkit" -o -name "linpeas" -o -name "linenum" -o -name "winpeas"

sudo find /usr -name "pwned" -o -name "hacker" -o -name "hacked" -o -name "pkexec" -o -name "ncrack" -o -name "gs-bus" -o -name "socket" -o -name "enum" -o -name "payload" -o -name "trojan" -o -name "exploit" -o -name "shell" -o -name "liferay" -o -name "uponkit" -o -name "upon" -o -name "rootkit" -o -name "linpeas" -o -name "linenum" -o -name "winpeas"

sudo find /sbin -name "pwned" -o -name "hacker" -o -name "hacked" -o -name "pkexec" -o -name "ncrack" -o -name "gs-bus" -o -name "socket" -o -name "enum" -o -name "payload" -o -name "trojan" -o -name "exploit" -o -name "shell" -o -name "liferay" -o -name "uponkit" -o -name "upon" -o -name "rootkit" -o -name "linpeas" -o -name "linenum" -o -name "winpeas"

sudo find /opt -name "pwned" -o -name "hacker" -o -name "hacked" -o -name "pkexec" -o -name "ncrack" -o -name "gs-bus" -o -name "socket" -o -name "enum" -o -name "payload" -o -name "trojan" -o -name "exploit" -o -name "shell" -o -name "liferay" -o -name "uponkit" -o -name "upon" -o -name "rootkit" -o -name "linpeas" -o -name "linenum" -o -name "winpeas"

sudo find /tmp -name "pwned" -o -name "hacker" -o -name "hacked" -o -name "pkexec" -o -name "ncrack" -o -name "gs-bus" -o -name "socket" -o -name "enum" -o -name "payload" -o -name "trojan" -o -name "exploit" -o -name "shell" -o -name "liferay" -o -name "uponkit" -o -name "upon" -o -name "rootkit" -o -name "linpeas" -o -name "linenum" -o -name "winpeas"

sudo find /var -name "pwned" -o -name "hacker" -o -name "hacked" -o -name "pkexec" -o -name "ncrack" -o -name "gs-bus" -o -name "socket" -o -name "enum" -o -name "payload" -o -name "trojan" -o -name "exploit" -o -name "shell" -o -name "liferay" -o -name "uponkit" -o -name "upon" -o -name "rootkit" -o -name "linpeas" -o -name "linenum" -o -name "winpeas"

sudo find /home -name "pwned" -o -name "hacker" -o -name "hacked" -o -name "pkexec" -o -name "ncrack" -o -name "gs-bus" -o -name "socket" -o -name "enum" -o -name "payload" -o -name "trojan" -o -name "exploit" -o -name "shell" -o -name "liferay" -o -name "uponkit" -o -name "upon" -o -name "rootkit" -o -name "linpeas" -o -name "linenum" -o -name "winpeas"

### SEARCH FOR SUSPECT STRING IN FILES


printf "$YELLOW[*]$WHITE Searching for suspect strings.\n$YELLOW"

toSearch="gs-dbus|ncrack|polkit|pwned|hacked|uponkit|linenum.sh|linpeas"
declare -a pathSearch=("/bin" "/sbin" "/root" "/var/log" "/opt" "/tmp" "/usr/bin" "/home")

for a in ${pathSearch[@]}
do
        printf "$YELLOW[*]$WHITE Searching in $a \n$YELLOW"
        fileout=sudo grep -Ril -E "$toSearch" $a 2>/dev/null | grep -v .class | tee -a outputVerify.txt
        printf "$WHITE[!] $a $BGREEN CHECKED\n$WHITE"
done

### LISTENING PORTS

printf "$YELLOW[*]$WHITE Verifying for listening ports.\n$YELLOW"

netstat -t -l -p --numeric-ports

rm ./verify.sh

### VERIFY FOR 777 FILES

printf "$YELLOW[*]$WHITE Verifying for 777 permission files.\n$YELLOW"

find /home -perm 777 -type f
find /usr -perm 777 -type f
find /tmp -perm 777 -type f
find /var -perm 777 -type f

### VERIFY SUDO -L

printf "$YELLOW[*]$WHITE Verifying sudo -l.\n$YELLOW"

sudo -l 

### DONE
printf "$BGREEN[*] Done.\n"
