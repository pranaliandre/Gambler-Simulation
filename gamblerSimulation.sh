#!/bin/bash -x
echo "welcome to Gambling Simulation"
#constant variable
BET=1
EVERY_DAY_STAKE=100
TOTAL_DAYS=20
#variable
RS=$EVERY_DAY_STAKE
TotalRS=0

#Initializing the dictionary
declare -A storeAmount
PERCENTAGE_LOWER=$(($EVERY_DAY_STAKE-$(($EVERY_DAY_STAKE*50/100)) ))
PERCENTAGE_UPPER=$(($EVERY_DAY_STAKE+$(($EVERY_DAY_STAKE*50/100)) ))

#function to check win or loss
function gamblerWinLoss(){
	while [ $RS -gt $PERCENTAGE_LOWER ] && [ $RS -lt $PERCENTAGE_UPPER ]
	do
		if [ $((RANDOM%2)) -eq 1 ]
		then
			RS=$((RS+BET))
		else
			RS=$((RS-BET))
		fi			
	done
	gainRS=$((RS-EVERY_DAY_STAKE))
	echo $gainRS
}


#function for Monthly bets
function monthlyGambling(){
	for ((day=1;day<=TOTAL_DAYS;day++))
	do
		#storing Each Day amount in Dictionary
		storeAmount[Day$day]=$(gamblerWinLoss)
		TotalRS=$((TotalRS + ${storeAmount[Day$day]} ))
		echo "Day $day = ${storeAmount[Day$day]}"
	done
	
	#checking for win or loss
	if [ $TotalRS -gt 0 ]
	then
		echo "Total Amount won in 20 Days $TotalRS"
	else
		echo "Total Amount loss in 20 Days $TotalRS"
	fi
}
#starting game
monthlyGambling
