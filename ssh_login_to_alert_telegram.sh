CHATID="-5555555555"
TOKEN="7777777777777777777777777777777"
TIMEOUT="10"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"
DATE_EXEC="$(date "+%d.%m.%Y %H:%M")"
if [ -n "$SSH_CLIENT" ]; then
        IP=$(awk '{print $1}' <<< $SSH_CLIENT)
        PORT=$(awk '{print $3}' <<< $SSH_CLIENT)
        HOSTNAME=$(hostname -f)
        IPADDR=$(hostname -I | awk '{print $1}')
        TEXT="
Вход по SSH:  
    TIMESTAMP: $DATE_EXEC
    USER: ${USER} 
    DST_HOST: $HOSTNAME 
    DST_IP: $IPADDR 
    SRC_IP: $IP
    SRC_PORT: $PORT"
        curl -s --max-time $TIMEOUT -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null
fi
