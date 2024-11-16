#!/bin/bash

package=htop

sudo pacman -S $package --noconfirm >> package_install_results.log

if [ $? -eq 0 ]
then
  echo "the installation of $package was successful"
  echo "the new command is available here"
  which $package
else
  echo "$package failed to install" >> package_install_failure.log
  
fi
