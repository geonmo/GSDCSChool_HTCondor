#!/bin/bash
ansible-playbook config_nfs.yml -u root -k
echo "사용자 디렉토리 생성 : /shared/user/$USER"
mkdir /shared/user/$USER
chmod 770 /shared/user/$USER
cp myinfo* /shared/user/$USER
