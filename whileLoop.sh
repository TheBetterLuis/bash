#!/bin/bash

myvar=1

while [ $myvar -le 10 ]
do
  echo $myvar
  myvar=$(( $myvar + 1))
  sleep 0.5
done


while [ -f ~/testfile ]
do
  echo "As of $(date), The test file exists."
  sleep 5
done

echo "As of $(date) The file has gone missing."
