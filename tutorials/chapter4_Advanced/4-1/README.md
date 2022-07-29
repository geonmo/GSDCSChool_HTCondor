# UID_DOMAIN과 FILESYSTEM_DOMAIN에 관하여 

## 목표
1. UID_DOMAIN을 이용하여 본인의 계정으로 작업을 수행할 수 있습니다.
1. FILESYSTEM_DOMAIN으로 공유 디렉토리에서 파일을 전송하지 않고 실행할 수 있습니다.

## 실습 4-1
### 사전 준비
1. ```./nfs_setup.sh```을 실행하여 NFS 공유디렉토리 공간을 준비합니다. (/shared) 
1. ```/shared/user/$USER``` 디렉토리에 myinfo 관련 파일들이 잘 전송되었는지 확인합니다.
### 실습
1. 교재를 참고하여 node0~2 서버들에 UID_DOMAIN과 FILESYSTEM_DOMAIN 설정을 지정합니다. (단, node3은 제외합니다.)
1. ```myinfo.jds``` 작업을 제출한 후, 결과 파일을 확인합니다.
1. ```myinfo.jds``` 파일의 ```should_transfer_files```를  **YES** 에서 **IF_NEEDED**로 변경합니다.
1. 작업 다시 제출하고, 작업들이 잘 처리되는지 확인합니다.
1. 작업이 수행되지 않는다면 ```condor_q -better``` 명령으로 문제를 확인해봅니다.
1. ```/shared/user/$USER```디렉토리로 이동한 후 ```should_transfer_files = IF_NEEDED``` 상태로 작업을 제출합니다.
1. Output 파일의 내용이 같은지 확인합니다. 


