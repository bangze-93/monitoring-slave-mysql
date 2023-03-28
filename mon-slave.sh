#!/bin/bash                                                                                                        
token="5144242611:AAHOcu412rWtOPDTya9LaDqxig-ANEp0Iag" #create your own
chat_id="-791770686" #create your own
url=https://api.telegram.org/bot$token/sendMessage
msg_title="SLAVE IS NOT RUNNING...!"
spr="======================"
ctr=`mysql -u root -pSeCr3t -e 'show slave status\G' | grep -wP "Slave_IO_Running|Slave_SQL_Running" | grep Yes | wc -l`
msg_content=`mysql -u root -pSeCr3t -e 'show slave status\G' | grep -wP "Slave_IO_Running|Slave_SQL_Running|Last_SQL_Error|Last_IO_Error" | awk '{ sub(/^[ \t]+/, ""); print }'`
if [[ $ctr -lt 2 ]]; then
   curl -s -X POST $url -d chat_id=$chat_id -d text="$msg_title%0A$spr%0A$msg_content"
fi
