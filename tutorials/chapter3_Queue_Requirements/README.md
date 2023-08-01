# Queue와 조건문 활용

## 목표
1. HTCondor 작업제출 명세파일의 Queue 키워드에 대하여 익힙니다.
1. Requirements 를 이용하여 특정 머신에만 작업이 수행하는 방법 익힙니다.

## 실습 3
### 실습 3-1
1. echo_hostname.sh 파일은 현재 실행 중인 노드의 hostname을 확인하는 스크립트입니다.
1. echo_hostname.jds를 이용하여 16번의 작업을 제출하여 보십시오.
1. Output 파일의 이름은 반드시 ```queue.XX.out  (eg) queue.0.out, queue.1.out``` 이여야 합니다.

### 실습 3-2
1. downloadnovel.sh 를 실행하여 소설 파일들을 복사합니다.
  1. 계정정보에 맞쳐서 다운로드 하도록 bash 스크립트를 수정하시거나 명령으로 수동으로 입력하십시오.
1. count_word.py은 매개변수로 입력된 파일을 읽어드려 단어별로 빈도수를 출력해주는 프로그램입니다.
    * ```./count_word.py [NOVELFILE].txt```
1. 다운로드된 소설들을 기반으로 하여 작업을 제출합니다. (3개 파일 3개의 작업)
1. Output 파일의 이름은 반드시 ```[NOVELFILE].out``` 형태여야 합니다.
   * ```romeo.txt.out 혹은 romeo.out```
      * 로미오와 줄리엣에서 로미오가 많이 나올까요? 줄리엣이 많이 나올까요? 그리고 얼마나 차이가 날까요?
### 실습 3-3
1. echo_hostname_groupnum.sh 은 현재 호스트명과 조 번호를 출력하는 스크립트입니다.
   * 제대로된 조 번호가 출력되도록 숫자를 수정하십시오.
1. echo_hostname_except_node2.jds 파일을 수정하여 node2에서는 수행되지 않도록 하십시오.
1. 작업을 4번 제출하고 제대로 작동하는지 확인합니다. 

## 주요 명령어
* vim 혹은 nano 등 텍스트 편집기
* condor_q : 작업상태 확인
* condor_rm : 작업 취소
* condor_history : 완료된 작업 목록 확인
