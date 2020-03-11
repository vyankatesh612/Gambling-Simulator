#!/bin/bash -x
echo "WelCome to Gambling Simulation"

#CONSTANT VARIABLES
MYSTAKE=100
BET=1

cash=$MYSTAKE
FIFTYPERCENTSTAKE=$(($MYSTAKE*50/100))
MIN_STAKE=$(($MYSTAKE - $FIFTYPERCENTSTAKE))
MAX_STAKE=$(($MYSTAKE + $FIFTYPERCENTSTAKE))

#CHECK WIN OR LOOSE
function checkWinORLoose()
	{
		while [[ $cash -lt $MAX_STAKE && $cash -gt $MIN_STAKE ]]
		do

			if [[ $((RANDOM%2)) == 1 ]]
			then
				cash=$((cash+BET))
			else
				cash=$((cash-BET))
			fi
		done
		echo "$cash"
	}
checkWinORLoose
