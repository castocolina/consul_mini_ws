#!/bin/bash

echo "START PROGRAM!!!!!"

source tmp/exercise2/config.properties


for (( ; ; ))
do
   current_date=$(date)
   printf "${current_date} ${myapp_gretting}\n"
   sleep ${myapp_delay}
done
