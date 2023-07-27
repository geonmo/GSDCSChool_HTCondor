#!/bin/bash

re='^[0-9]$'
if [ $# -ne 1 ] ; then
  echo "Wrong argument" >&2
  exit 1
elif ! [[ $1 =~ $re ]]; then
    echo "Error : $1 is not a number" >&2
    exit 2
else
  echo "Group number is $1"
  sed -i "s/node\([0-9]\).g[0-9].23.gsdc.org/node\1.g$1.23.gsdc.org/g" ansible_setup/inventory/condor_hosts  
  sed -i "s/node\([0-9]\).g[0-9].23.gsdc.org/node\1.g$1.23.gsdc.org/g" ansible_setup/vars.yml  
  sed -i "s/node\([0-9]\).g[0-9].23.gsdc.org/node\1.g$1.23.gsdc.org/g" tutorials/chapter4_Advanced/4-1/myinfo.jds 

  if [[ $1 -le 3 ]]; then
    echo "school gateway 1"
    sed -i "s/nfs_server :/nfs_server : \"10.10.10.226\"/g" ansible_setup/vars.yml
  else
    echo "schoole gateway 2"
    sed -i "s/nfs_server :/nfs_server : \"10.10.10.230\"/g" ansible_setup/vars.yml
  fi
fi
