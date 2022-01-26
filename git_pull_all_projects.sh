#!/bin/bash

cd $HOME/My_Projects
for i in $(ls); 
    do 
        echo -e "\033[32m Git Pull $i:"; 
	cd $HOME/My_Projects/$i 
	git pull
    done;


