#!/bin/bash

ramLibre=$(cat /proc/meminfo | grep -i "^memfree" | tr "A-z :" " " |sed -e "s/ *//g")

ramcached=$(cat /proc/meminfo | grep -i "^cached" |tr "A-z :" " "  |sed -e "s/ *//g")

rambuffer=$(cat /proc/meminfo | grep -i "^buffers" |tr "A-z : " " " | sed -e "s/ *//g")

ramtotal=$(cat /proc/meminfo | grep -i "^memtotal" | tr "A-z :" " " | sed -e "s/ *//g")
let "ramLibre=$ramLibre/1024"
echo "ram free $ramLibre" 
let "ramcached=$ramcached/1024"
echo "ram cached $ramcached"
let "rambuffer=$rambuffer/1024"
echo "ram buffer $rambuffer"
let "ramtotal=$ramtotal/1024"
echo "ramtotal $ramtotal"

let "memnonused=($ramLibre + $ramcached + $rambuffer)"
echo "ram not in use" $memnonused

let "memused=$ramtotal-$memnonused"
echo "ram used" $memused
