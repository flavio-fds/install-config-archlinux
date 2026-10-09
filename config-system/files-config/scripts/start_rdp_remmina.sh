#!/bin/sh

while [ true ]; do
    FILE=$(ls -t ~/Downloads | grep launch | grep rdp | head -n 1 | cut -d':' -f3)
    sleep 2
    if [ $FILE ] && [ -e ~/Downloads/$FILE ]; then
        CONFIG_REMINNA=~/script/configRDP.remmina
        TOKEN=$(cat ~/Downloads/$FILE | grep gatewayaccesstoken | cut -d':' -f3)
        IP_M=$(cat ~/Downloads/$FILE | grep "full address:" | sed 's/.*://')
        find ~/Downloads -iname "launch*.rdp" -type f -delete

        echo "[remmina]" > $CONFIG_REMINNA
        echo "ignore-tls-errors=1" >> $CONFIG_REMINNA
        echo "protocol=RDP" >> $CONFIG_REMINNA
        echo "gateway_usage=2" >> $CONFIG_REMINNA
        echo "name=........" >> $CONFIG_REMINNA
        echo "server=$IP_M" >> $CONFIG_REMINNA
       # echo "server=........" >> $CONFIG_REMINNA
        echo "gatewayaccesstoken=$TOKEN" >> $CONFIG_REMINNA
        echo "gateway_server=........" >> $CONFIG_REMINNA
        echo "username=........" >> $CONFIG_REMINNA
        echo "password=........" >> $CONFIG_REMINNA
        echo "sound=remote" >> $CONFIG_REMINNA
        #echo "sys:pulse,format:1,quality:high"
        #echo "sys:alsa,format:1,quality:high"
        echo "drive=........" >> $CONFIG_REMINNA
        echo "reconnect=false" >> $CONFIG_REMINNA
        #echo "redirect=1" >> $CONFIG_REMINNA
        #echo "local_port=9000" >> $CONFIG_REMINNA
        #echo "shareparallel=1" >> $CONFIG_REMINNA
        #echo "shareserial=1" >> $CONFIG_REMINNA
        #echo "serialpermissive=1" >> $CONFIG_REMINNA
        #echo "redirection_name=Redirection" >> $CONFIG_REMINNA
        #echo "redirection_port=9000" >> $CONFIG_REMINNA
        
        sleep 1
        remmina -c $CONFIG_REMINNA & 
    fi
done
exit 1
