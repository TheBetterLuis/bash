#!/bin/bash

mynum=200
#-eq for equal to 
#-ne for not equal to
#can also reverse it with !
#gt greater than

if [  $mynum -eq 200 ]
then
  echo "The condition is true."
else
  echo "The variable does not equal 200"
fi

#check for file using -f
if [ -f ./myfile ]
then
  echo "./myfile file exists"
else
  echo "./myfile file doesn't exist"
fi
