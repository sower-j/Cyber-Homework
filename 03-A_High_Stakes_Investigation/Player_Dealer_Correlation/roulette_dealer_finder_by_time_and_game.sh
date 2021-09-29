#!/bin/bash

# This is essentially an extension for the other script I wrote so many of the notes apply here as well

DealerInfo(){

# This section is essentially the same except for the addition of a game variable to search

	read -p "Date (MMDD): " date
	read -p "Hour (XX): " hour
	read -p "AM or PM : " ap
	read -p "Game (1 = Blackjack, 2 = Roulette, 3 = Texas Hold Em) : " game

# This part is quite fragile becasue I did not put in any checks on user input
# For example, if the user  inputs military time (13:00:00) this script will not work and will simply not find anything

	case "$game" in
		"1") grep "$hour" ./"$date"_Dealer_schedule | grep -iw "$ap" | awk '{print "Date: '${date}'","|| Time:",$1,$2,"|| Blackjack Dealer:",$3,$4}';;
		"2") grep "$hour" ./"$date"_Dealer_schedule | grep -iw "$ap" | awk '{print "Date: '${date}'","|| Time:",$1,$2,"|| Roulette Dealer:",$5,$6}';;
		"3") grep "$hour" ./"$date"_Dealer_schedule | grep -iw "$ap" | awk '{print "Date: '${date}'","|| Time:",$1,$2,"|| Texas Hold Em Dealer:",$7,$8}';;
	esac
}

# This function simply asks the user if they want to write the output of DealerInfo to a file
# The "tee" command allows for simultaneous standard output and writing to a fle (appending with the -a option)
# I have this function write to a test file so I wouldn't mess up my homework answers

WriteToFile(){
	read -r -p "Output to Test_File? (Y/N): " response
	case "$response" in
		[yY][eE][sS]|[yY]) DealerInfo | tee -a Test_File ;;
		[nN][oO]|[nN]) DealerInfo ;;
	esac
}

# This loop asks the user if they want to find dealer information
# As long as the user says yes it will continue
# Once the user says no it will say "All Done" so the user knows the script is done running
while true
do
	read -r -p "Find Dealer Info? (Y/N): " run
	case "$run" in
		[yY][eE][sS]|[yY]) WriteToFile ;;
		[nN][oO]|[nN]) echo "All done"
		break ;;
	esac
done

# This script would be best tuned to read from the log files standard location instead of the relative location I used for this homework
# Doing so would ensure that log files are not moved or edited for initial investigations
