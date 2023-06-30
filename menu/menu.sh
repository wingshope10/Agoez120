#!/bin/bash
 # ========================================= 
 vlx=$(grep -c -E "^#& " "/etc/xray/config.json") 
 let vla=$vlx/2 
 vmc=$(grep -c -E "^### " "/etc/xray/config.json") 
 let vma=$vmc/2 
 ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)" 
  
 trx=$(grep -c -E "^#! " "/etc/xray/config.json") 
 let tra=$trx/2 
 ssx=$(grep -c -E "^## " "/etc/xray/config.json") 
 let ssa=$ssx/2
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

BURIQ () {
    curl -sS https://raw.githubusercontent.com/wingshope10/permission/main/ip > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/wingshope10/permission/main/ip | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/wingshope10/permission/main/ip | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}


x="ok"


PERMISSION

if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
rm -f /home/needupdate > /dev/null 2>&1
else
Exp=$(curl -sS https://raw.githubusercontent.com/wingshope10/permission/main/ip | grep $MYIP | awk '{print $3}')
fi

# // Clear
clear
clear && clear && clear
clear;clear;clear
cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
ssh=$(service ssh status | grep active | cut -d ' ' $stat)
if [ "$ssh" = "active" ]; then
ressh="${green}ON${NC}"
else
ressh="${red}OFF${NC}"
fi
sshstunel=$(service stunnel5 status | grep active | cut -d ' ' $stat)
if [ "$sshstunel" = "active" ]; then
resst="${green}ON${NC}"
else
resst="${red}OFF${NC}"
fi
sshws=$(service ws-stunnel status | grep active | cut -d ' ' $stat)
if [ "$sshws" = "active" ]; then
ressshws="${green}ON${NC}"
else
ressshws="${red}OFF${NC}"
fi
ngx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ngx" = "active" ]; then
resngx="${green}ON${NC}"
else
resngx="${red}OFF${NC}"
fi
dbr=$(service dropbear status | grep active | cut -d ' ' $stat)
if [ "$dbr" = "active" ]; then
resdbr="${green}ON${NC}"
else
resdbr="${red}OFF${NC}"
fi
v2r=$(service xray status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
resv2r="${green}ON${NC}"
else
resv2r="${red}OFF${NC}"
fi

IPVPS=$(curl -s ipinfo.io/ip )
ISPVPS=$( curl -s ipinfo.io/org )
UDPX="https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2"
clear
echo -e "${BIRed} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "${BIRed} │  ${BIPurple}Use Core       : ${BIRed}Wings Tunneling ${NC}" 
echo -e " ${BIRed}│  ${BIPurple}OS VPS         : "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-` $NC
echo -e " ${BIRed}│  ${BIPurple}Current Domain : ${BIRed}$(cat /etc/xray/domain)${NC}"
echo -e " ${BIRed}│  ${BIPurple}SLOWDNS Domain : ${BIRed}$(cat /root/nsdomain)${NC}"
echo -e " ${BIRed}│  ${BIPurple}IP-VPS         : ${BIRed}$IPVPS${NC}"
echo -e " ${BIRed}│  ${BIPurple}ISP-Name       : ${BIRed}$ISPVPS${NC}"
echo -e " ${BIRed}│  ${BIPurple}DATE&TIME      : $( date -d "0 days" +"%d-%m-%Y | %X" ) ${NC}"
echo -e " ${BIRed}└─────────────────────────────────────────────────────┘${NC}"
echo -e "${GREEN}  ┌──────────────────────────────────────────────────┐${NC}" 
echo -e "${PURPLE} │  \033[0m ${BOLD}${PURPLE}SSH     VMESS       VLESS      TROJAN $NC" 
echo -e "${PURPLE} │  \033[0m ${Blue} $ssh1        $vma           $vla          $tra $NC" 
echo -e "${PURPLE} └──────────────────────────────────────────────────┘${NC}" 

echo -e "     ${BIRed}   SSH ${NC}: $ressh"" ${BICyan} NGINX ${NC}: $resngx"" ${BICyan}  XRAY ${NC}: $resv2r"" ${BICyan} TROJAN ${NC}: $resv2r"
echo -e "     ${BIRed}           DROPBEAR ${NC}: $resdbr" "${BICyan} SSH-WS ${NC}: $ressshws"
echo -e "${BIRed}  ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "     ${BIRed} [${BIGreen}1${BIPurple}]${RED} SSH/UDP/SlowDNS ${NC}" 
echo -e "     ${BIRed} [${BIGreen}2${BIPurple}]${RED} VMESS ${NC}"    
echo -e "     ${BIRed} [${BIGreen}3${BIPurple}]${RED} VLESS ${NC}"    
echo -e "     ${BIRed} [${BIGreen}4${BIPurple}]${RED} TROJAN ${NC}" 
echo -e "     ${BIRed} [${BIGreen}5${BIPurple}]${RED} SHADOWSOCKS ${NC}"    
echo -e "     ${BIRed} [${BIGreen}6${BIPurple}]${RED} BACKUP/RESTORE ${NC}"    
echo -e "     ${BIRed} [${BIGreen}7${BIPurple}]${RED} SETTINGS ${NC}"    
echo -e "     ${BIRed} [${BIGreen}8${BIPurple}]${RED} INFO SCRIPT ${NC}"  
echo -e "     ${BIRed} [${BIGreen}9${BIPurple}]${RED} INFO SERVER ${NC}"    
echo -e "     ${BIRed} [${BIGreen}10${BIPurple}]${RED}INSTAL UDP ${NC}" 
echo -e "     ${BIRed} [${BIGreen}x${BIPurple}]${RED} EXIT ${NC}"  
echo -e "${BIRed}  └─────────────────────────────────────────────────────┘${NC}"
DATE=$(date +'%d %B %Y')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e " ${BIPurple}│$NC  Expiry In     : $(( (d1 - d2) / 86400 )) Days $NC"
}
mai="datediff "$Exp" "$DATE""
echo -e " ${BIRed} ┌─────────────────────────────────────┐${NC}"
echo -e " ${BIRed} │  Version       : $(cat /opt/.ver) Last Update ${NC}"
echo -e " ${BIRed} │  User          :\033[1;36m $Name \e[0m"
if [ $exp \< 1000 ];
then
echo -e "  ${BIRed}│$NC License     :${PURPLE}$sisa_hari$NC Sisa Nyawa $NC"
else
    datediff "$Exp" "$DATE"
fi;
echo -e " ${BIRed} └─────────────────────────────────────┘${NC}"
echo
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; menu-ssh ;;
2) clear ; menu-vmess ;;
3) clear ; menu-vless ;;
4) clear ; menu-trojan ;;
5) clear ; menu-ss ;;
6) clear ; menu-backup ;;
7) clear ; menu-set ;;
8) clear ; info ;;
9) clear ; infoserv ;;
10) clear ; clear ; wget --load-cookies /tmp/cookies.txt ${UDPX} -O install-udp && rm -rf /tmp/cookies.txt && chmod +x install-udp && ./install-udp ;;
99) clear ; update ;;
0) clear ; menu ;;
x) exit ;;
*) echo -e "" ; echo "Press any key to back exit" ; sleep 1 ; exit ;;
esac
