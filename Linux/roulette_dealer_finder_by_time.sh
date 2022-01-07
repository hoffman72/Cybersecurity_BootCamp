#!/bin/bash
sed 's/:00:00//;s/ //' $1_Dealer_schedule > Dealer_schedule.tmp
grep $2 Dealer_schedule.tmp | awk '{print $1, $4, $5}'

