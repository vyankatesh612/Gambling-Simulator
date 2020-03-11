#!/bin/bash -x
echo "WelCome to Gambling Simulation"

#CONSTANT VARIABLES
MYSTAKE=100
BET=1
TOTAL_AMOUNT=0
TOTAL_DAYS=20
WIN=0
LOST=0
AMOUNTWIN=0
AMOUNTLOST=0

FIFTYPERCENTSTAKE=$(($MYSTAKE*50/100))
MIN_STAKE=$(($MYSTAKE - $FIFTYPERCENTSTAKE))
MAX_STAKE=$(($MYSTAKE + $FIFTYPERCENTSTAKE))
#CHECK WIN OR LOOSE
function checkWinORLoose()
	{
		for ((day=1;day<=$TOTAL_DAYS;day++))
		do
			cash=$MYSTAKE
			while [[ $cash -lt $MAX_STAKE && $cash -gt $MIN_STAKE ]]
			do

				if [[ $((RANDOM%2)) == 1 ]]
				then
					cash=$((cash+BET))
				else
					cash=$((cash-BET))
				fi
			done
			if [ $cash == $MAX_STAKE ]
			then
				AMOUNTWIN=$(($AMOUNTWIN+$cash-$MYSTAKE))
				((WIN++))
			else
				AMOUNTLOST=$(($AMOUNTLOST+$cash))
				((LOST++))
			fi
		done
		echo "Total no of Wins : "$WIN" by "$AMOUNTWIN
		echo "Total no of lost : "$LOST" by "$AMOUNTLOST		
	}
checkWinORLoose
