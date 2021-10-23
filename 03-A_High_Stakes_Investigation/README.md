# Homework 03 - High Stakes Investigation

This homework's deliverable requested the files be zipped together. I have extracted them here so they can be easily viewed on github. The contents of each file will also be compiled here.

In hindsight it would have been more complete to include the commands I used to get the output for Roulette_Losses.txt and Notes_Player_Analysis.txt; or maybe a more complete write up of the process as a whole and why I used specific commands. I am intentionally leaving everything in the state in which I submitted the files for grading.

Contents of: [Roulette_Losses](./Player_Dealer_Correlation/Roulette_Losses.txt)

```
0310: 05:00:00 AM	-$82,348	Amirah Schneider,Nola Portillo, Mylie Schmidt,Suhayb Maguire,Millicent Betts,Avi Graves
0310: 08:00:00 AM	-$97,383	Chanelle Tapia, Shelley Dodson , Valentino Smith, Mylie Schmidt
0310: 02:00:00 PM	-$82,348	Jaden Clarkson, Kaidan Sheridan, Mylie Schmidt 
0310: 08:00:00 PM	-$65,348        Mylie Schmidt, Trixie Velasquez, Jerome Klein ,Rahma Buckley
0310: 11:00:00 PM	-$88,383	Mcfadden Wasim, Norman Cooper, Mylie Schmidt
0312: 05:00:00 AM	-$182,300	Montana Kirk, Alysia Goodman, Halima Little, Etienne Brady, Mylie Schmidt
0312: 08:00:00 AM	-$97,383        Rimsha Gardiner,Fern Cleveland, Mylie Schmidt,Kobe Higgins	
0312: 02:00:00 PM	-$82,348        Mae Hail,  Mylie Schmidt,Ayden Beil	
0312: 08:00:00 PM	-$65,792        Tallulah Rawlings,Josie Dawe, Mylie Schmidt,Hakim Stott, Esther Callaghan, Ciaron Villanueva	
0312: 11:00:00 PM	-$88,229        Vlad Hatfield,Kerys Frazier,Mya Butler, Mylie Schmidt,Lex Oakley,Elin Wormald	
0315: 05:00:00 AM	-$82,844        Arjan Guzman,Sommer Mann, Mylie Schmidt	
0315: 08:00:00 AM	-$97,001        Lilianna Devlin,Brendan Lester, Mylie Schmidt,Blade Robertson,Derrick Schroeder	
0315: 02:00:00 PM	-$182,419        Mylie Schmidt, Corey Huffman
```

Contents of: [Notes_Player_Analysis](./Player_Dealer_Correlation/Notes_Player_Analysis.txt)

```
Date: 0310 Time: 05:00:00 AM Mylie Schmidt
Date: 0310 Time: 08:00:00 AM Mylie Schmidt
Date: 0310 Time: 02:00:00 PM Mylie Schmidt
Date: 0310 Time: 08:00:00 PM Mylie Schmidt
Date: 0310 Time: 11:00:00 PM Mylie Schmidt
Date: 0312 Time: 05:00:00 AM Mylie Schmidt
Date: 0312 Time: 08:00:00 AM Mylie Schmidt
Date: 0312 Time: 02:00:00 PM Mylie Schmidt
Date: 0312 Time: 08:00:00 PM Mylie Schmidt
Date: 0312 Time: 11:00:00 PM Mylie Schmidt
Date: 0315 Time: 05:00:00 AM Mylie Schmidt
Date: 0315 Time: 08:00:00 AM Mylie Schmidt
Date: 0315 Time: 02:00:00 PM Mylie Schmidt

Mylie Schmidt was playing during all 13 major losses 
```

Contents of : [roulette_dealer_finer_by_time.sh](./Player_Dealer_Correlation/roulette_dealer_finder_by_time.sh)

```bash
#!/bin/bash

# The read command is used to get input from the user and assign a variable
read -p "Date (MMDD): " date
read -p "Hour (XX): " hour
read -p "Am or Pm : " ap

# Using the variables given by the user search for $hour in the file that matches the $date
# Find the whole word matching $ap regardless of capitalization
# awk print "Date: " then the $date variable
# then print "|| Time:" with fields $1,$2 (xx:xx:xx A/PM)
# finally print "|| Dealer:" with fields $5,$6 (dealer first/last name)

grep "$hour" ./"$date"_Dealer_schedule | grep -iw "$ap" | awk '{print "Date: '${date}'","|| Time:",$1,$2,"|| Dealer:",$5,$6}'

# I wanted to have the output of this script be more human readable instead of looking like raw data output so I added "||" as field separators 
# This is used as the base for a more advanced script
```

Contents of: [Dealers_working_during_losses.txt](./Player_Dealer_Correlation/Dealers_working_during_losses.txt)

```
Date: 310 || Time: 05:00:00 AM || Dealer: Billy Jones
Date: 310 || Time: 08:00:00 AM || Dealer: Billy Jones
Date: 310 || Time: 02:00:00 PM || Dealer: Billy Jones
Date: 310 || Time: 08:00:00 PM || Dealer: Billy Jones
Date: 310 || Time: 11:00:00 PM || Dealer: Billy Jones
Date: 312 || Time: 05:00:00 AM || Dealer: Billy Jones
Date: 312 || Time: 08:00:00 AM || Dealer: Billy Jones
Date: 312 || Time: 02:00:00 PM || Dealer: Billy Jones
Date: 312 || Time: 08:00:00 PM || Dealer: Billy Jones
Date: 312 || Time: 11:00:00 PM || Dealer: Billy Jones
Date: 315 || Time: 05:00:00 AM || Dealer: Billy Jones
Date: 315 || Time: 08:00:00 AM || Dealer: Billy Jones
Date: 315 || Time: 02:00:00 PM || Dealer: Billy Jones

(I developed this format because I felt it was more human readable and appropriate for a report as opposed to the raw data format found in the logs)
```

Contents of: [Notes_Dealer_Analysis](./Player_Dealer_Correlation/Notes_Dealer_Analysis.txt)

```
Date: 310 || Time: 05:00:00 AM || Dealer: Billy Jones
Date: 310 || Time: 08:00:00 AM || Dealer: Billy Jones
Date: 310 || Time: 02:00:00 PM || Dealer: Billy Jones
Date: 310 || Time: 08:00:00 PM || Dealer: Billy Jones
Date: 310 || Time: 11:00:00 PM || Dealer: Billy Jones
Date: 312 || Time: 05:00:00 AM || Dealer: Billy Jones
Date: 312 || Time: 08:00:00 AM || Dealer: Billy Jones
Date: 312 || Time: 02:00:00 PM || Dealer: Billy Jones
Date: 312 || Time: 08:00:00 PM || Dealer: Billy Jones
Date: 312 || Time: 11:00:00 PM || Dealer: Billy Jones
Date: 315 || Time: 05:00:00 AM || Dealer: Billy Jones
Date: 315 || Time: 08:00:00 AM || Dealer: Billy Jones
Date: 315 || Time: 02:00:00 PM || Dealer: Billy Jones

Billy Jones was the roulette dealer during all 13 major losses

(I wrote my script before making the "Dealers_working_during_losses which is why the files are essentially the same)
```

Contents of: [Notes_Player_Dealer_Correlation](./Player_Dealer_Correlation/Notes_Player_Dealer_Correlation.txt)

```
According to my findings, the player Mylie Schmidt was working with the dealer Billy Jones to cheat the casino.

Both were involved in all 13 of the cassino's major losses at the same dates and times.

For more detailed information see attached Notes_Dealer_Analysis and Notes_Player_Analysis
```

Contents of: [roulette_dealer_finder_by_time_and_game](./Player_Dealer_Correlation/roulette_dealer_finder_by_time_and_game.sh)

```bash
#!/bin/bash

# This is essentially an extension for the other script I wrote so many of the notes apply here as well

DealerInfo(){

# This section is essentially the same except for the addition of a game variable to search

	read -p "Date (MMDD): " date
	read -p "Hour (XX): " hour
	read -p "AM or PM : " ap
	read -p "Game (1 = Blackjack, 2 = Roulette, 3 = Texas Hold Em) : " game

# This part is quite fragile because I did not put in any checks on user input
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
```

