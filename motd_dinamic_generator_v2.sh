#!/bin/bash
#
# Проверка формата скриптов:
# run-parts /etc/update-motd.d/ > /dev/null
#
#
# Text Color Variables http://misc.flogisoft.com/bash/tip_colors_and_formatting
tcLtG="\033[00;37m"    # LIGHT GRAY
tcDkG="\033[01;30m"    # DARK GRAY
tcLtR="\033[01;31m"    # LIGHT RED
tcLtGRN="\033[01;32m"  # LIGHT GREEN
tcLtBL="\033[01;34m"   # LIGHT BLUE
tcLtP="\033[01;35m"    # LIGHT PURPLE
tcLtC="\033[01;36m"    # LIGHT CYAN
tcT="\033[01;96m"      # TURQUOISE
tcY="\033[01;93m"      # YELLOW
tcRESET="\033[0m"
tcORANGE="\033[38;5;209m"
#
# Time of day
HOUR=$(date +"%H")
if [ $HOUR -lt 12  -a $HOUR -ge 0 ]; then TIME="morning"
elif [ $HOUR -lt 17 -a $HOUR -ge 12 ]; then TIME="afternoon"
else TIME="evening"
fi
#
# System uptime
uptime=`cat /proc/uptime | cut -f1 -d.`
upDays=$((uptime/60/60/24))
upHours=$((uptime/60/60%24))
upMins=$((uptime/60%60))
#
# System + Memory
SYS_LOADS=`cat /proc/loadavg | awk '{print $1}'`
#CPU=`cat /proc/cpuinfo | grep 'model name' | uniq | awk '{$1=$2=$3=""; print $0}'`
CPU=`cat /proc/cpuinfo | grep 'model name' | uniq | awk -F: '{print $2}'`
#
#MEMORY_USED=`free -b | grep Mem | awk '{print $3/$2 * 100.0}'`
MEMORY_USED=`free --mega | grep Mem | awk '{printf "%.2f\n",$3/1024}'`
MEMORY_FREE=`free --mega | grep Mem | awk '{printf "%.2f\n",$4/1024}'`
MEMORY_SIZE=`free --mega | grep Mem | awk '{printf "%.2f\n",$2/1024}'`
#
#SWAP_USED=`free -b | grep Swap | awk '{print $3/$2 * 100.0}'`
SWAP_USED=`free --mega | grep Swap | awk  '{printf "%.2f\n",$3/1024}'`
SWAP_FREE=`free --mega | grep Swap | awk  '{printf "%.2f\n",$4/1024}'`
SWAP_SIZE=`free --mega | grep Swap | awk  '{printf "%.2f\n",$2/1024}'`
#
#DISK_USAGE=`df -h / | awk '{print $3 " / " $4 " / " $2}' | grep -v "Size"` 
DISK_USED=`df -h / | awk '{print $3}' | grep -v "Used"`
DISK_AVAIL=`df -h / | awk '{print $4}' | grep -v "Avail"`
DISK_SIZE=`df -h / | awk '{print $2}' | grep -v "Size"`
#
NUM_PROCS=`ps aux | wc -l`
#IPADDRESS=`hostname -i`
IPADDRESS=`hostname -I`
#
echo -e "$tcDkG ===================================================================================="
echo -e $tcLtG " $tcORANGE Good $TIME !                                                             "
echo -e $tcDkG "===================================================================================="
echo -e $tcLtG " - Hostname                  :$tcT `hostname -f`"
echo -e $tcLtG " - IP Address                :$tcT $IPADDRESS"
echo -e $tcLtG " - Release                   :$tcT $(lsb_release -s -d)"
echo -e $tcLtG " - Kernel                    : `uname -a | awk '{print $1" "$3" "$12}'`"
echo -e $tcLtG " - Users                     : Currently `users | wc -w` user(s) logged on"
echo -e $tcLtG " - Server Time               : `date "+%d.%m.%Y %H:%M:%S"`"
echo -e $tcLtG " - System load               : $SYS_LOADS / $NUM_PROCS processes running"
echo -e $tcLtG " - CPU                       :$CPU" 
echo -e $tcLtG " - Memory ($tcLtR"used"/$tcY"free"/$tcLtGRN"size")   $tcLtG":" $tcLtR$MEMORY_USED"G" / $tcY$MEMORY_FREE"G" / $tcLtGRN$MEMORY_SIZE"G""
echo -e $tcLtG " - Swap ($tcLtR"used"/$tcY"free"/$tcLtGRN"size")     $tcLtG":" $tcLtR$SWAP_USED"G" / $tcY$SWAP_FREE"G" / $tcLtGRN$SWAP_SIZE"G""
echo -e $tcLtG " - Disk ($tcLtR"used"/$tcY"avail"/$tcLtGRN"size")    $tcLtG":" $tcLtR$DISK_USED / $tcY$DISK_AVAIL / $tcLtGRN$DISK_SIZE"  
echo -e $tcLtG " - System uptime             : $upDays days $upHours hours $upMins minutes"
echo -e $tcDkG "===================================================================================="
echo -e $tcRESET ""
