#!/bin/bash

parse_cmus_info(){
~/cmus_info/infoParser.sh

status=$(cat ~/cmus_info/status.txt)
file=$(cat ~/cmus_info/file.txt)
artist=$(cat ~/cmus_info/artist.txt)
title=$(cat ~/cmus_info/title.txt)
album=$(cat ~/cmus_info/album.txt)
vol_left=$(cat ~/cmus_info/vol_left.txt)
vol_right=$(cat ~/cmus_info/vol_right.txt)
repeat_current=$(cat ~/cmus_info/repeat_current.txt)
shuffle=$(cat ~/cmus_info/shuffle.txt)
repeat=$(cat ~/cmus_info/repeat.txt)
kontinue=$(cat ~/cmus_info/continue.txt)

[[ $repeat_current == "true" ]] && repeat_current="|ReCu" || repeat_current=""
[[ $shuffle == "tracks" ]] && shuffle="S" || shuffle=""
[[ $repeat == "true" ]] && repeat="R" || repeat=""
[[ $kontinue == "true" ]] && kontinue="C" || kontinue=""

if [[ $repeat_current == "ReCu" ]]; then 
  repeat_icon=~/Pictures/icons/repeat-one-white-32.png 
else 
  repeat_icon=~/Pictures/icons/repeat-white-32.png 
fi 

if [[ $status == "playing" ]]; then 
  status_icon=~/Pictures/icons/play-white-32.png 
else 
  status_icon=~/Pictures/icons/pause-white-32.png 

fi 

if [[ $status == "" ]]; then 
returnValue=" "
else 
returnValue="$vol_left% ${title:0:20}|$kontinue$repeat$shuffle|${status:0:3}$repeat_current"
fi 

echo "$returnValue" 
}

parse_cmus_info

