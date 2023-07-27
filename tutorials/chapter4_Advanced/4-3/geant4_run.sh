#!/bin/bash

#export PATH=$PATH:/usr/bin:/bin

echo "0. OS 버전 확인"
cat /etc/redhat-release

echo "1. Geant4 환경변수를 로드합니다."
source /usr/share/geant4/geant4make/geant4make.sh

echo "2. Geant4 실습 문제를 복사합니다."
cp -rf /shared/examples/advanced/brachytherapy/ ./

echo "3. Geant4 Adv 실습 문제 소스코드를 컴파일합니다."
mkdir brachy_build
cd brachy_build
cmake ../brachytherapy
make



echo "4. Geant4 Adv 실습문제를 실행합니다."
## Run IodineSource Macro. (No GUI env.)
./Brachy IodineSourceMacro.mac 

echo "5. 결과파일을 원래 디렉토리로 이동"
mv EnergyDeposition_iodine.out ../
mv brachytherapy.root ../
mv primary.root ../
