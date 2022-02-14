#!/bin/bash

### 1. Cоздать исполняемый скрипт на wsl2:
/sbin/ip addr add 192.168.77.77/24 broadcast 192.168.77.255 dev eth0 label eth0:1
/mnt/c/Windows/System32/netsh.exe interface ipv4 add address "vEthernet (WSL)" 192.168.77.177 255.255.255.0

### 2. Отредактировать crontab и добавить скрипт:
#@reboot /path/to/the/script

###3. Добавить в /etc/sudoers:
#%sudo ALL=NOPASSWD: /etc/init.d/cron *

### 4. На стороне Windows создать скрипт vbs:
#Set oShell = CreateObject ("Wscript.Shell")
#Dim strArgs
#strArgs = "C:\Windows\System32\wsl.exe -d Ubuntu-20.04 sudo /etc/init.d/cron start"
#oShell.Run strArgs, 0, false

### 5. Поставить этот скрипт в автозагрузку Windows.
