# UID_DOMAIN과 FILESYSTEM_DOMAIN에 관하여 

## 목표
1. UID_DOMAIN을 이용하여 본인의 계정으로 작업을 수행할 수 있습니다.
1. FILESYSTEM_DOMAIN으로 공유 디렉토리에서 파일을 전송하지 않고 실행할 수 있습니다.

## 실습 4-1
### 사전 준비
1. ```./nfs_setup.sh```을 실행하여 NFS 공유디렉토리 공간을 준비합니다. (/shared) 
1. ```/shared/user/$USER``` 디렉토리에 myinfo 관련 파일들이 잘 복사되었는지 확인합니다.
### 실습
1. 교재를 참고하여 submit, execute 서버(1개 WN는 제외)에 UID_DOMAIN과 FILESYSTEM_DOMAIN 내용을 설정합니다.
   * /etc/condor/config.d/02-domain.config
      ```bash
      UID_DOMAIN=gsdc.org
      TRUST_UID_DOMAIN=true
      SOFT_UID_DOMAIN=true
      FILESYSTEM_DOMAIN=gsdc.org
      ``` 
   * 설정한 노드들에서 ```systemctl restart condor``` 로 서비스를 재시작 합니다.
   * ```systemctl status condor```로 재시작이 되었는지 확인합니다.
1. ```/shared/user/$USER```디렉토리로 이동합니다.
1. ```myinfo.jds``` 파일의 node 정보를 확인한 후, 작업을 제출하여 결과 파일을 확인합니다. 
   * 설정이 변경되지 않은 노드와 다른 execute에서 실행된 표준출력 결과물의 내용이 동일합니까?
1. ```myinfo.jds``` 파일의 ```should_transfer_files```를  **YES** 에서 **IF_NEEDED**로 변경합니다.
1. 작업 다시 제출하고, 작업들이 잘 처리되는지 확인합니다.
1. 표준출력 결과물 내용을 확인해봅시다. 
### 토의
* 왜 **IF_NEEDED**가 기본값일까요? 어떤 컴퓨팅 환경일 때, ```should_transfer_files=IF_NEEDED```가 유리한지 논의해봅시다. 

