#!/bin/bash -x
echo "WelCome to Gambling Simulation"

declare -a daywisestake

#CONSTANT VARIABLES
MYSTAKE=100
BET=1
TOTAL_AMOUNT=0
TOTAL_DAYS=20
WIN=0
LOST=0
AMOUNTWIN=0
AMOUNTLOST=0
totalamount=0

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

			daywisestake[$day]=$cash
			echo ${daywisestake[$day]}

			if [ $cash -gt $MYSTAKE ]
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

		luckyUnlucky
		if [ $AMOUNTWIN -gt $AMOUNTLOST ]
		then
			read -p "Do You Want to continue for next month(Y/N) : " option
			if [[ $option == "Y" || $option == "y" ]]
			then
				checkWinORLoose
			fi
		fi
					
	}

function luckyUnlucky()
	{
		luckyamount=${daywisestake[1]}
		unluckyamount=${daywisestake[1]}

		for ((i=1;i<${#daywisestake[@]};i++))
		do
			if [ $luckyamount -lt ${daywisestake[$i]} ]
			then
				luckyamount=${daywisestake[$i]}
				luckyday=$i
			fi
			if [ $unluckyamount -gt ${daywisestake[$i]} ]
			then
				unluckyamount=${daywisestake[$i]}
				unluckyday=$i
			fi
		done
	}
checkWinORLoose

