# HTCondor 설치
## 목표
1. HTCondor 설치 방법을 익힙니다.
1. 설치 시 주의해야할 점을 파악합니다.
1. HTCondor의 role 개념과 Pool Password의 의미를 파악합니다.

## Chapter 정보
### 실습내용 
HTCondor를 curl 명령으로 설치하고 condor\_ping, condor\_status로 확인하십시오.


조원별 노드 하나씩 설치를 진행하되 서버가 부족한 경우, 가장 리눅스에 익숙한 사용자가 지원 역할을 수행하여 주십시오.


내용 설명은 [PPT 자료](https://cernbox.cern.ch/index.php/s/cXLUjWOaN5yKgw1)를 참고하십시오.
### 주요 명령어
1. curl : 인터넷으로부터 파일을 다운로드 받습니다.
   ```bash
   sudo curl –fsSL https://get.htcondor.org | /bin/bash –s -- --no-dry-run --[ROLE] $central_manager_name --password $htcondor_password
   ```
   * 위 명령은 아래와 같이 분리하여 확인해볼 수 있습니다.
   ```bash
   curl -L -o get_htcondor.sh https://get.htcondor.org
   sudo bash get_htcondor.sh --no-dry-run --[ROLE] $central_manager_name --password $htcondor_password
   ```
1. condor\_status : 머신의 상태를 확인하는 명령
   ```bash
   (ex) condor_status / condor_status [machine name] / condor_status -l [machine name]
   ```
   * -l 옵션으로 ClassAds 정보 확인이 가능합니다.

1. condor\_ping : 머신간 연결 상태 확인
   ```bash
   condor_ping -pool nodeX.gX.gsdc.org -type [Daemon] -table [Instruction or ALL]
   (ex) condor_ping -pool node1.g1.gsdc.org -type collector –table DAEMON
   ```
