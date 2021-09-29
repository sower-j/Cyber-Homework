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
