#!/bin/bash

declare -a rssList=(
'grainydays - https://www.youtube.com/feeds/videos.xml?channel_id=UCx4MHIcTdwdcmJ5accSDlPA'
'overthink - https://www.youtube.com/feeds/videos.xml?channel_id=UCMYhvss0LFHG6DjDtX_gs-A'
'MKBHD - https://www.youtube.com/feeds/videos.xml?channel_id=UCBJycsmduvYEL83R_U4JriQ'
'LinusTechTips - https://www.youtube.com/feeds/videos.xml?channel_id=UCXuqSBlHAE6Xw-yeJA0Tunw'
)

rsstail -u https://hnrss.org/newest -n 3 -N -Z '-' >| /tmp/rss/hackerNews 2>/dev/null &

for rss in "${rssList[@]}"; do
	name=$(printf '%s\n' "$rss" |awk '{print $1}')
	url=$(printf '%s\n' "$rss" |awk '{print $NF}')
	rsstail -u $url -n 1 -N -Z "$name - " >| /tmp/rss/$name 2>/dev/null &
done



#rsstail -u https://hnrss.org/newest -t -n 5
# Wait for 2 seconds
#killall rsstail
