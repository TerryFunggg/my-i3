#!/bin/bash

declare -a rssList=(
'hackerNews - https://hnrss.org/newest'
)

for rss in "$rssList"; do
	name=$(printf '%s\n' "$rss" |awk 'NR==1{print $1}')
	url=$(printf '%s\n' "$rss" |awk '{print $NF}')
	rsstail -u $url -N -Z '-' -n 5 > /tmp/rss/$name 2>/dev/null &
done



#rsstail -u https://hnrss.org/newest -t -n 5
# Wait for 2 seconds
#killall rsstail

