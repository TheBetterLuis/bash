#!/bin/bash

program=htop

if  command -v $program
then
  echo "$program is available, let's run it..."
else
  echo "$program is not available, installing it..."
  #make sure you add no confirms or ways of skipping user input since it is a script
  sudo pacman -S $program --noconfirm
fi

$program
