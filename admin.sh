#!/bin/bash
NC='\033[0m'
RED='\033[1;38;5;196m'
GREEN='\033[1;38;5;040m'
ORANGE='\033[1;38;5;202m'
BLUE='\033[1;38;5;012m'
BLUE2='\033[1;38;5;032m'
PINK='\033[1;38;5;013m'
GRAY='\033[1;38;5;004m'
NEW='\033[1;38;5;154m'
YELLOW='\033[1;38;5;214m'
CG='\033[1;38;5;087m'
CP='\033[1;38;5;221m'
CPO='\033[1;38;5;205m'
CN='\033[1;38;5;247m'
CNC='\033[1;38;5;051m'

function banner(){
echo -e ${RED}"##############################################################################"
echo -e ${CP}"      __  _       _           _             _____ _           _         __    #"                   
echo -e ${CP}"     / / / \   __| |_ __ ___ (_)_ __       |  ___/ |_ __   __| | ___ _ _\ \   #"        
echo -e ${CP}"    | | / _ \ / _  |  _   _ \| | '_ \ _____| |_  | | '_ \ / _  |/ _ \ '__| |  #"     
echo -e ${CP}"   < < / ___ \ (_| | | | | | | | | | |_____|  _| | | | | | (_| |  __/ |   > > #"
echo -e ${CP}"    | /_/   \_\__,_|_| |_| |_|_|_| |_|     |_|   |_|_| |_|\__,_|\___|_|  | |  #"
echo -e ${CP}"     \_\                                                                /_/   #"
echo -e  ${PINK}"              A Tool To Find Admin Panel Of The Website                       #"
echo -e ${BLUE}"                      https://facebook.com/unknownclay                        #"
echo -e ${YELLOW}"                      Coded By: Machine404                                    #"
echo -e ${CP}"                      https://github.com/machine1337                          #"
echo -e ${RED}"###############################################################################"

}
sleep 1
echo -e ${CP}"[+] Checking Internet Connectivity"
if [[ "$(ping -c 1 8.8.8.8 | grep '100% packet loss' )" != "" ]]; then
  echo "No Internet Connection"
  exit 1
  else
  echo "Internet is present"
  
fi

function admin_find(){
clear
banner
echo -e -n ${BLUE}"\n[+] Enter domain name (e.g https://target.com/) : "
read domain
echo -e -n ${BLUE}"\n[+] Enter path of wordlist list:  "
read wordlist
sleep 1
echo -e ${CNC}"\n[+] Searching For Admin Panel :)"
for i in $(cat $wordlist); do
file=$(curl -s -o /dev/null -w "%{http_code}" $domain/$i)
echo "$file" >> output.txt
 if [ "$file" = "301" ] || [ "$file" = "302" ] || [ "$file" = "201" ] || [ "$file" = "200" ]
  then
  echo -n -e ${RED}"\n[ ✔ ] $domain/$i ${CP}"[Directory: $i]" ${RED}[FOUND]\n"

  rm output.txt
  exit 1
  else
  echo -n -e ${GREEN}"\nURL: $domain  [Not Found]\n" >/dev/null 2>&1
 fi
 done
 if [ -s output.txt ]; then
echo -n -e ${YELLOW}"\n[ X ] Not Found admin Panel : "
rm output.txt
exit 1
fi
}
trap ctrl_c INT
ctrl_c() {
clear
echo -e ${RED}"[*] (Ctrl + C ) Detected, Trying To Exit... "
echo -e ${RED}"[*] Stopping Services... "
sleep 1
echo ""
echo -e ${YELLOW}"[*] Thanks For Using Admin Finder  :)"
exit
}

banner
admin_find
#coded by Machine404 Don't copy this code without giving me credit.
