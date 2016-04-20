#!/bin/bash

##########################################################################
# Backup-Fortigate
# Filename: fortigate-backup.sh
# Revision: 1.0
# Date: 19/04/2016
# Author: Diego Maia - diegosmaia@yahoo.com.br Telegram - @diegosmaia
# Executar: 
# ./fortigate-backup.sh 192.168.0.1:443 fortigate-empresa 
##########################################################################

###################
#Dados fornecidos pelo usuário
###################
IP=$1
FILENAME=$2

######################
# Usuario do Fortigate
######################
username='dmaia'
password='dmaiasenha'

###################################
# Logando no site e fazendo backup
###################################
curl -k -s -c /tmp/fortigate-backup.cookie -b /tmp/fortigate-backup.cookie -d "ajax=1&username=${username}&secretkey=${password}" "https://${IP}/logincheck" 
CSRF_TOKEN=$(curl -k -s -c /tmp/fortigate-backup.cookie -b /tmp/fortigate-backup.cookie "https://${IP}/system/maintenance/backup" 2>&1 | grep -o -E "([a-z|A-Z|0-9]{33}|[a-z|A-Z|0-9]{32}|[a-z|A-Z|0-9]{31}|[a-z|A-Z|0-9]{30}|[a-z|A-Z|0-9]{29}|[a-z|A-Z|0-9]{28}|[a-z|A-Z|0-9]{27})")
curl -k -s -c /tmp/fortigate-backup.cookie -b /tmp/fortigate-backup.cookie -d "backup_to=0&fname_back_usb=&backup=1&CSRF_TOKEN=${CSRF_TOKEN}" "https://${IP}/system/maintenance/backup"  -o "$FILENAME-$(date "+%d-%m-%Y").conf"

#################
# DEBUG
##################
#curl -k -s -c /tmp/fortigate-backup.cookie -b /tmp/fortigate-backup.cookie "https://${IP}/system/maintenance/backup" 
#curl -k -c /tmp/fortigate-backup.cookie -b /tmp/fortigate-backup.cookie    "https://${IP}/index" --insecure
#echo $CSRF_TOKEN
#echo "backup_to=0&fname_back_usb=&backup=1&CSRF_TOKEN=${CSRF_TOKEN}"
#echo "$FILENAME-$(date "+%d-%m-%Y").conf"




