#!/bin/bash
sed 's/:00:00//;s/ //' $2_Dealer_schedule > Dealer_schedule.tmp
VAR=$3
grep $1 Dealer_schedule.tmp | awk '{ if($VAR=="Blackjack") {print $1, $2, $3;} else { if($VAR=="Roulette") {print $1, $4, $5;} else { if($VAR=="Texas_Hold_Em") {print $1, $6, $7}}}}'
