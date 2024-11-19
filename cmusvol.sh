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
}

parse_cmus_info

#volumes
#0 decrease 
#1 increase
#2 reset

if [[ $1 -eq 2 ]]; then
  cmus-remote -v  -100%
  cmus-remote -v  +50%
  parse_cmus_info
  notify-send "cmus - volume=$vol_left%" "$status - $kontinue$repeat$shuffle $repeat_current\n$title - $artist " -r 1111 -i ~/Pictures/icons/volume-restore-32.png
fi

if [[ $1 -eq 1 ]]; then
  cmus-remote -v  +10%
  parse_cmus_info
  notify-send "cmus - volume=$vol_left%" "$status - $kontinue$repeat$shuffle $repeat_current\n$title - $artist " -r 1111 -i ~/Pictures/icons/volume-up-green-32.png
fi

if [[ $1 -eq 0 ]]; then
  cmus-remote -v  -10%
  parse_cmus_info
  notify-send "cmus - volume=$vol_left%" "$status - $kontinue$repeat$shuffle $repeat_current\n$title - $artist " -r 1111 -i ~/Pictures/icons/volume-down-red-32.png
fi


#start/pause/unpause

if [[ $1 -eq 3 ]]; then
  cmus-remote -u || cmus
  parse_cmus_info
  notify-send "cmus - volume=$vol_left%" "$status - $kontinue$repeat$shuffle $repeat_current\n$title - $artist " -t 1500 -r 1111 -i ~/Pictures/icons/play-pause-white-32.png
fi

if [[ $1 -eq 4 ]]; then
  cmus-remote -r 
  parse_cmus_info
  notify-send "cmus - volume=$vol_left%" "$status - $kontinue$repeat$shuffle $repeat_current\n$title - $artist " -t 1500 -r 1111 -i ~/Pictures/icons/back-white-32.png
fi


if [[ $1 -eq 5 ]]; then
  cmus-remote -n 
  parse_cmus_info
  notify-send "cmus - volume=$vol_left%" "$status - $kontinue$repeat$shuffle $repeat_current\n$title - $artist " -t 1500 -r 1111 -i ~/Pictures/icons/next-white-32.png
fi

if [[ $1 -eq 6 ]]; then
  killall cmus
  parse_cmus_info
  notify-send "cmus - volume=$vol_left%" "$status - $kontinue$repeat$shuffle $repeat_current\n$title - $artist " -t 1500 -r 1111 -i ~/Pictures/icons/next-white-32.png
fi


if [[ $1 -eq 7 ]]; then
  parse_cmus_info
  notify-send "cmus - volume=$vol_left%" "$status - $kontinue$repeat$shuffle $repeat_current\n$title - $artist " -t 1500 -r 1111 -i ~/Pictures/icons/next-white-32.png
fi

if [[ $1 -eq 8 ]]; then
  cmus-remote -C "toggle repeat_current"
  parse_cmus_info
  notify-send "cmus - volume=$vol_left%" "$status - $kontinue$repeat$shuffle $repeat_current\n$title - $artist " -t 1500 -r 1111 -i ~/Pictures/icons/next-white-32.png
fi






