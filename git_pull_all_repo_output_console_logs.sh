#!/bin/bash

PULL_DATA=$(date '+%H:%M:%S %d.%m.%Y') 
REPO_DIR=$HOME/My_Projects
LOG=$REPO_DIR/Bash/git_pull_all_repo_output_console_logs.log
j=0

#if [ ! -f "$LOG" ]; then
#    touch $LOG
#    chmod u=rw,g=rw,o=rw $LOG
#fi

echo =========================================================== | tee -a $LOG
echo $PULL_DATA | tee -a $LOG                    
echo =========================================================== | tee -a $LOG

cd $HOME/My_Projects
for i in $(ls); 
    do 
        j=$(($j+1))	    
	cd $REPO_DIR/$i 
        echo -e "\033[31m[$j] \033[32m -= Git pull from $i =- \033[0m"
        echo Git pull from $i >> $LOG
	git pull | tee -a $LOG
	echo -e "\033[0m" 
    done;
