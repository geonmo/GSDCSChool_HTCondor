# GSDCSChool_HTCondor
GSDC School의 HTCondor 수업을 위한 코드 제공합니다.
1. submit 역할의 서버에 접속하여 구성을 시작합니다.
1. 사전 환경설정
   * git 설치 및 ansible 환경을 구성하기 위한 코드를 다운로드 받습니다.
   ```bash
   sudo yum install -y epel-release
   sudo yum install -y git ansible
   ```
1. 실습코드를 다운로드 받습니다.
   * (본인이 github에 익숙하다면 본인의 저장소에 추가하셔서 적용하셔도 상관 없습니다.)
   ```bash
   git clone https://github.com/geonmo/GSDCSChool_HTCondor.git
   ```
1. 본인의 조별 숫자로 ansible 세팅 작업을 수행합니다. 
   ```bash
   ### 4조일 경우,
   ./group_setting.sh 4
   ``` 
1. 모든 서버에 접속하여 계정을 생성하고 패스워드를 지정합니다.
   ```bash
   ssh nodeY.gX
   useradd -m -G wheel -u [UID] [ACCOUNT]
   passwd [ACCOUNT]
   ```
