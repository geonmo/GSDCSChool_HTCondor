#!/bin/bash

ansible -u $USER -K sub-vagrant_edit_hosts.yml

sed -i "s/g1.23//g" ../../ansible_setup/vars.yml

ansible -u $USER -K 10-all_setup.yml 
