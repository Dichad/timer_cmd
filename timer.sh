#!/bin/bash

function pomodoroTimer {

function Help {

 echo "Simple timer in terminal"
 echo "    "
 echo "Syntax: ./timer [-h|-m|-s] 
       options:
       -h   set the hour
       -m   set the minutes
       -s   set the seconds
       
       Note: The sequences of the arguments must be correct
       
       Example: ./timer.sh -h1 -m1 -s1  
       "
}



 while getopts :gh:m:s: aflag; do
	 case $aflag in
		 g) Help 
	 	    exit;;
		 h) hour=$OPTARG;;
		 m) min=$OPTARG;;
		 s) sec=$OPTARG;;
		 \?) echo "Unexpected option or options"
		     exit;;
	 esac
 done


 
 if [ $hour -le 60 ] && [ $hour -ge 0 ] && [ $min -le 60 ] && [ $min -ge 0 ] && [ $sec -le 60 ] && [ $sec -ge 0 ]
 then
     until [ $hour -eq 0 ] && [ $min -eq 0 ] && [ $sec -eq 0 ]
     do
	 sec=$(( $sec - 1 ))
	 clear
	 time=$hour:$min:$sec
 	 figlet -c -f mono9.tlf $time
	 
	 sleep 1

	 if [ $sec -eq 0 ] && [ $min -ne 0 ]
	 then
		 sec=60
		 min=$(( $min - 1 )) 
	 elif [ $sec -eq 0 ] && [ $min -eq 0 ] && [ $hour -ne 0 ]
	 then
		 sec=60
		 min=59
		 hour=$(( $hour - 1 ))
	 elif [ $sec -eq 0 ] && [ $min -ne 0 ] && [ $hour -ne 0 ]
	 then
		 min=$(( $sec - 1 ))
		 sec=60
	 elif [ $sec -eq 0 ] && [ $min -ne 0 ] && [ $hour -eq 0 ]
	 then
		 min=$(( $min - 1 ))
		 sec=60
	 fi

      done
 else
	 echo "Wrong numbers or incorrect input"
 fi
 
 
}



pomodoroTimer $1 $2 $3

 










