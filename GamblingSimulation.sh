#!/bin/bash -x
echo "WelCome to Gambling Simulation"

#CONSTANT VARIABLES
STAKE=100
BET=1
#CHECK WIN OR LOOSE
function checkWinORLoose()
	{
		if [[ $((RANDOM%2)) == 1 ]]
		then
			echo "win"
		else
			echo "loose"
		fi
	}
checkWinORLoose

