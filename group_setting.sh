#!/bin/bash

if [ $# -ne 0 ] ; then
  echo "Wrong argument" >&2
  exit 1
else
  GRPNUM=$(hostname | cut -d. -f2 | sed "s/g\([0-9]\)/\1/g")
  echo "Group number is ${GRPNUM}"
  sed -i "s/node\([0-9]\).g[0-9].23.gsdc.org/node\1.g${GRPNUM}.23.gsdc.org/g" ansible_setup/inventory/condor_hosts  
  sed -i "s/node\([0-9]\).g[0-9].23.gsdc.org/node\1.g${GRPNUM}.23.gsdc.org/g" ansible_setup/vars.yml  
  sed -i "s/node\([0-9]\).g[0-9].23.gsdc.org/node\1.g${GRPNUM}.23.gsdc.org/g" tutorials/chapter4_Advanced/4-1/myinfo.jds
 
  if [[ $(cat ansible_setup/vars.yml | grep nfs | wc -w) -ne 2 ]];
  then
     exit 0
  fi

  if [[ ${GRPNUM} -le 3 ]]; then
    echo "school gateway 1"
    sed -i "s/nfs_server :/nfs_server : \"10.10.10.226\"/g" ansible_setup/vars.yml
  else
    echo "schoole gateway 2"
    sed -i "s/nfs_server :/nfs_server : \"10.10.10.230\"/g" ansible_setup/vars.yml
  fi
fi
