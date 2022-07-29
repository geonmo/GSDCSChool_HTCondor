#!/bin/bash
ansible-playbook config_nfs.yml -u root -k
mkdir /shared/user/$USER
echo "사용자 디렉토리 생성 : /shared/user/$USER"
chmod 770 /shared/user/$USER
