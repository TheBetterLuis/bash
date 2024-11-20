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

[[ $repeat_current == "true" ]] && repeat_current="ReCu" || repeat_current=" "
[[ $shuffle == "tracks" ]] && shuffle="S" || shuffle=" "
[[ $repeat == "true" ]] && repeat="R" || repeat=" "
[[ $kontinue == "true" ]] && kontinue="C" || kontinue=" "

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


}

parse_cmus_info

#volumes
#0 decrease 
#1 increase
#2 reset

if [[ $1 -eq 2 ]]; then
  nohup cmus-remote -v  -100% >/dev/null 2>&1 &
  nohup cmus-remote -v  +50% >/dev/null 2>&1 &
  parse_cmus_info
  notify-send "cmus - volume=$vol_left%" "$status - $kontinue$repeat$shuffle $repeat_current\n$title - $artist " -r 1111 -i ~/Pictures/icons/volume-restore-32.png
fi

if [[ $1 -eq 1 ]]; then
  nohup cmus-remote -v  +10% >/dev/null 2>&1 &
  parse_cmus_info
  notify-send "cmus - volume=$vol_left%" "$status - $kontinue$repeat$shuffle $repeat_current\n$title - $artist " -r 1111 -i ~/Pictures/icons/volume-up-green-32.png
fi

if [[ $1 -eq 0 ]]; then
  nohup cmus-remote -v  -10% >/dev/null 2>&1 &
  parse_cmus_info
  notify-send "cmus - volume=$vol_left%" "$status - $kontinue$repeat$shuffle $repeat_current\n$title - $artist " -r 1111 -i ~/Pictures/icons/volume-down-red-32.png
fi


#start/pause/unpause

if [[ $1 -eq 3 ]]; then
  nohup cmus-remote -u >/dev/null 2>&1 &
  parse_cmus_info
  notify-send "cmus - volume=$vol_left%" "$status - $kontinue$repeat$shuffle $repeat_current\n$title - $artist " -t 1500 -r 1111 -i $status_icon
fi

if [[ $1 -eq 4 ]]; then
  nohup cmus-remote -r >/dev/null 2>&1 &
  parse_cmus_info
  notify-send "cmus - volume=$vol_left%" "$status - $kontinue$repeat$shuffle $repeat_current\n$title - $artist " -t 1500 -r 1111 -i ~/Pictures/icons/back-white-32.png
fi


if [[ $1 -eq 5 ]]; then
  nohup cmus-remote -n >/dev/null 2>&1 &
  parse_cmus_info
  notify-send "cmus - volume=$vol_left%" "$status - $kontinue$repeat$shuffle $repeat_current\n$title - $artist " -t 1500 -r 1111 -i ~/Pictures/icons/next-white-32.png
fi

if [[ $1 -eq 6 ]]; then
  nohup killall cmus >/dev/null 2>&1 &
  parse_cmus_info
  notify-send "cmus - volume=$vol_left%" "$status - $kontinue$repeat$shuffle $repeat_current\n$title - $artist " -t 1500 -r 1111 -i ~/Pictures/icons/next-white-32.png
fi


if [[ $1 -eq 7 ]]; then
  parse_cmus_info
  notify-send "cmus - volume=$vol_left%" "$status - $kontinue$repeat$shuffle $repeat_current\n$title - $artist " -t 1500 -r 1111 -i $status_icon
fi



if [[ $1 -eq 8 ]]; then
  nohup cmus-remote -C "toggle repeat_current" >/dev/null 2>&1 &
  parse_cmus_info
  notify-send "cmus - volume=$vol_left%" "$status - $kontinue$repeat$shuffle $repeat_current\n$title - $artist " -t 1500 -r 1111 -i $repeat_icon
fi






