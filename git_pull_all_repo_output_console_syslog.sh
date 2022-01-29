#!/bin/bash

PULL_DATA=$(date '+%H:%M:%S %d.%m.%Y') 
REPO_DIR=$HOME/My_Projects
LOG=$REPO_DIR/Bash/git_pull_temp.log

echo ===========================================================
echo $PULL_DATA                     
echo ===========================================================

cd $HOME/My_Projects
for i in $(ls); 
    do 
	cd $REPO_DIR/$i 
        echo -e "\033[32m -= Git pull from $i =- \033[0m"
        echo Git pull from $i >> $LOG
	git pull | tee -a $LOG
	echo -e "\033[0m" 
    done;
logger -f $LOG
rm $LOG
