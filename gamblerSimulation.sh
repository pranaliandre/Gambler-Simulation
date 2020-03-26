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
declare -A betsOfSum
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

function monthlyGambling() {
	for ((day=1;day<=TOTAL_DAYS;day++))
	do
		#storing Each Day amount in Dictionary means betsOfSum
		betsOfSum[Day$day]=$((${betsOfSum[Day$((day-1))]} + $(gamblerWinLoss) ))
	done

	#luckiest and unluckiest day by calling luckyUnluckyDictionary function
	echo "Luckiest Day is : $( luckyUnluckyDictionary | head -1 ) "
	echo "Unluckiest Day is : $( luckyUnluckyDictionary | tail -1 ) "
}

#function to sort all values of betsOfSum
function luckyUnluckyDictionary(){
	for day in ${!betsOfSum[@]}
	do
		echo "$day : ${betsOfSum[$day]}"
	done | sort -k3 -rn
}

#Starting game
monthlyGambling
function playNextMonthOrNot(){
	monthlyGambling
	#function of check player playing or not
	while [ ${betsOfSum[Day20]} -gt 0 ]
	do
		#echo -e " \e[1;34m Last month amount =${betsOfSum[Day20]} \e[0m \n "
		read -p " You won .do u want to play for the next month or next time if yes press 'y' otherwise press any key: " playAgain
		if [ $playAgain == "y" ]
		then
			monthlyGambling
		else
			exit
		fi
	done
	echo -e "\e[1:35m last month amount= ${betsOfSum[Day20]} \e[0m \n Not Playing next month"
}
playNextMonthOrNot
