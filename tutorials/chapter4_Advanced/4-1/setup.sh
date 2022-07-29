#!/bin/bash
ansible-playbook config_nfs.yml -u root -k
mkdir /shared/user/$USER
chmod 770 /shared/user/$USER
