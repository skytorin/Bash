#!/bin/bash

cd $HOME/My_Projects
for i in $(ls); 
    do 
        echo -e "\033[32m -= Git Pull $i =- \033[0m"
	cd $HOME/My_Projects/$i 
	git pull
	echo -e "\033[0m" 
    done;


