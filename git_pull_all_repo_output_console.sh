#!/bin/bash

j=0

cd $HOME/My_Projects
for i in $(ls);
    do
	 j=$(($j+1))
	echo -e "\033[31m[$j] \033[32m -= Git pull from $i =- \033[0m"
	cd $HOME/My_Projects/$i
	git pull 
	echo -e "\033[0m"
    done;
