#!/bin/bash                                                                                                        
token="51442xxxxx:AAHOcu412rWtOPDTyaLaDqxig-xxxxxxxx" change to yours
chat_id="-79177xxxx" change to yours
url=https://api.telegram.org/bot$token/sendMessage
msg_title="SLAVE IS NOT RUNNING...!"
spr="======================"
ctr=$(mysql -u user -pSeCr3t -e 'show slave status\G' | grep -wP "Slave_IO_Running|Slave_SQL_Running" | grep Yes | wc -l)
msg_content=$(mysql -u user -pSeCr3t -e 'show slave status\G' | grep -wP "Slave_IO_Running|Slave_SQL_Running|Last_SQL_Error|Last_IO_Error" | awk '{ sub(/^[ \t]+/, ""); print }')
if [[ $ctr -lt 2 ]]; then
   curl -sX POST $url -d chat_id=$chat_id -d text="$msg_title%0A$spr%0A$msg_content"
fi
