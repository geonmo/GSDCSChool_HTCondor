# HTCondor 설치
내용 설명은 [PPT 자료](https://cernbox.cern.ch/index.php/s/cXLUjWOaN5yKgw1)를 참고하십시오.
HTCondor를 curl 명령으로 설치하고 condor_ping, condor_status로 확인하십시오.
## Chapter 정보
주요 명령어
```bash
sudo curl –fsSL https://get.htcondor.org | /bin/bash –s -- --no-dry-run --[ROLE] $central_manager_name --password $htcondor_password
```
