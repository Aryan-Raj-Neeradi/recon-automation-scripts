#!/bin/bash

# Define colors
NC='\033[0m'
RED='\033[1;38;5;196m'
BLUE='\033[1;38;5;012m'
ORANGE='\033[1;38;5;202m'
BLUE2='\033[1;38;5;032m'
GREEN='\033[1;38;5;040m'
CPO='\033[1;38;5;205m'

# Banner display
echo -e "${RED}#########################################################"
echo -e "${CPO}#  ____    _    ____    ____  _____ ____ ___  _   _     #"
echo -e "${CPO}# / ___|  / \\  |  _ \\  |  _ \\| ____/ ___/ _ \\| \\ | |    #"
echo -e "${CPO}# \\___ \\ / _ \\ | |_) | | |_) |  _|| |  | | | |  \\| |    #"
echo -e "${CPO}#  ___) / ___ \\|  _ <  |  _ <| |__| |__| |_| | |\\  |    #"
echo -e "${CPO}# |____/_/   \\_\\_| \\_\\ |_| \\_\\_____\\____\\___/|_| \\_|    #"
echo -e "${CPO}#                Automate your Recon                    #"
echo -e "${BLUE}#                                                        #"
echo -e "${ORANGE}#                                                       #"
echo -e "${GREEN}#                                                       #"
echo -e "${RED}#########################################################"
sleep 2

# Date and input setup
d=$(date +"%b-%d-%y %H:%M")
echo -n -e "${ORANGE}Enter domain (e.g., evil.com): "
read domain
mkdir -p /root/recon/$domain

echo -e "${BLUE}\n[+] Recon Started On $d\n"

# Subdomain finding
figlet "FINDING SUBDOMAINS"
subfinder -d $domain -silent -o /root/recon/$domain/subdomain.txt
sleep 1

# Service discovery
figlet "FINDING SERVICES OF SUBDOMAINS"
httpx -l /root/recon/$domain/subdomain.txt -ip -sc -ct -td -probe -o /root/recon/$domain/httpx.txt
sleep 1

# Filtering working domains
echo -e "${BLUE2}\n[+] Working Domains"
figlet "WORKING DOMAINS"
grep -E "200|301|302" /root/recon/$domain/httpx.txt | awk '{print $1}' | tee /root/recon/$domain/200ok.txt
sleep 1

# Filtering failed domains
echo -e "${RED}\n[+] Failed Domains"
figlet "FAILED DOMAINS"
grep -E "FAILED|401|402|403|404|502|503" /root/recon/$domain/httpx.txt | awk '{print $1}' | tee /root/recon/$domain/500fail.txt
sleep 1

# Fetching IP addresses
echo -e "${CPO}\n[+] Fetching IP Address"
figlet "FETCHING IP ADDRESS"
awk '{print $5}' /root/recon/$domain/httpx.txt | tee /root/recon/$domain/ip.txt
sleep 1

# Screenshotting working domains
echo -e "${GREEN}\n[+] Capturing Working Domains"
figlet "CAPTURING WORKING DOMAINS"
cat /root/recon/$domain/200ok.txt | aquatone -out /root/recon/$domain/
mv /root/recon/$domain/screenshots /root/recon/$domain/200ok && rm /root/recon/$domain/aquatone_*
sleep 1

# Screenshotting failed domains
echo -e "${RED}\n[+] Capturing Non-Working Domains"
figlet "CAPTURING NON-WORKING DOMAINS"
cat /root/recon/$domain/500fail.txt | aquatone -out /root/recon/$domain/
mv /root/recon/$domain/screenshots /root/recon/$domain/500fail && rm /root/recon/$domain/aquatone_*
sleep 1

# Spidering domains
echo -e "${BLUE2}\n[+] Spidering Domains"
figlet "SPIDERING DOMAINS"
gospider -S /root/recon/$domain/200ok.txt | grep "$domain" | tee /root/recon/$domain/spider.txt

# Completion message
echo -e "${ORANGE}\nRecon Completed"
