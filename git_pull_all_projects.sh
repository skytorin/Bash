#!/bin/bash

cd $HOME/My_Projects
for i in $(ls); 
    do 
        echo "Git Pull $i:"; 
	cd $HOME/My_Projects/$i 
	git pull
    done;


