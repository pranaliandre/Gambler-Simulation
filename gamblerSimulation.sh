#!/bin/bash -x
echo "welcome to Gambling Simulation"
#constant variable
BET=1
EVERY_DAY_STAKE=100
#variable
RS=$EVERY_DAY_STAKE

PERCENTAGE_LOWER=$(($EVERY_DAY_STAKE-$(($EVERY_DAY_STAKE*50/100)) ))
PERCENTAGE_UPPER=$(($EVERY_DAY_STAKE+$(($EVERY_DAY_STAKE*50/100)) ))

#function to check win or loss
function gamblerWinLoss(){
	while [ $RS -gt $PERCENTAGE_LOWER ] && [ $RS -lt $PERCENTAGE_UPPER ]
	do
		if [ $((RANDOM%2)) -eq 1 ]
		then
			RS=$((RS+BET))
			echo "win"
		else
			RS=$((RS-BET))
			echo "loss"
		fi			
	done
}
gamblerWinLoss
