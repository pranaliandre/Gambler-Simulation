#!/bin/bash -x
echo "welcome to Gambling Simulation"
#constant variable
BET=1
EVERY_DAY_STAKE=100
#variable
RS=$EVERY_DAY_STAKE
#function to check win or loss
function gamblerWinLoss(){
		if [ $((RANDOM%2)) -eq 1 ]
		then
			RS=$((RS+BET))
			echo "win"
		else
			RS=$((RS-BET))
			echo "loss"
		fi			
}
gamblerWinLoss
