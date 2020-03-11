#!/bin/bash -x
echo "WelCome to Gambling Simulation"

#CONSTANT VARIABLES
MYSTAKE=100
BET=1
TOTAL_AMOUNT=0
TOTAL_DAYS=20

cash=$MYSTAKE
FIFTYPERCENTSTAKE=$(($MYSTAKE*50/100))
MIN_STAKE=$(($MYSTAKE - $FIFTYPERCENTSTAKE))
MAX_STAKE=$(($MYSTAKE + $FIFTYPERCENTSTAKE))
#CHECK WIN OR LOOSE
function checkWinORLoose()
	{
		for ((day=1;day<$TOTAL_DAYS;day++))
		do

			while [[ $cash -lt $MAX_STAKE && $cash -gt $MIN_STAKE ]]
			do

				if [[ $((RANDOM%2)) == 1 ]]
				then
					cash=$((cash+BET))
				else
					cash=$((cash-BET))
				fi
			done
			TOTAL_AMOUNT=$(($TOTAL_AMOUNT+$cash-$MYSTAKE))
		done
		
		if [[ $TOTAL_AMOUNT -gt 0 ]]
		then
			echo "Total Amount win :" $TOTAL_AMOUNT
		else
			echo "Total Amount Loose :" $TOTAL_AMOUNT
		fi
	}
checkWinORLoose
