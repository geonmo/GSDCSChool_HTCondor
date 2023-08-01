#!/bin/bash

sed -i "s/g[0-9].23.//g" ../../ansible_setup/vars.yml
sed -i "s/g[0-9].23.//g" ../../ansible_setup/inventory/condor_hosts

ansible-playbook -b -u $USER -K sub-vagrant_edit_hosts.yml
ansible-playbook -b -u $USER -K 10-all_setup.yml
ansible-playbook -b -u $USER -K sub-vagrant_interface.yml 

