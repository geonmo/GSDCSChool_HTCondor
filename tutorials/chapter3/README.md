# Queue와 조건문 활용

## 목표
1. HTCondor 작업제출 명세파일의 Queue 키워드에 대하여 익힙니다.
2. Requirements 를 이용하여 특정 머신에만 작업이 수행하는 방법을 익힙니다.
3. request_XXX 키워드를 이용하여 자원을 특정하여 제출하는 방법을 익힙니다.

## 실습내용
1. 실제로 작업 제출 명세파일을 작성하여 작업을 제출합니다.
1. 제공해드린 date.sh와 date.jds 파일을 수정하여 성공적으로 작업을 제춯하여 봅시다.
1. condor_q 로 작업 상태 확인해보십시오. 
1. condor_rm 으로 작업을 취소해보십시오.
1. condor_history 명령으로 취소된 작업의 작업코드는 뭐입니까? 
1. 제공해드린 파일들을 이용하여 ```"Hello HTCondor, Hello GSDC", 조원 이름```을 출력하는 프로그램을 작성하고 제출해봅시다.
2. 결과파일의 이름은 반드시 ```hello_GSDC.out``` 이여야 합니다.

주요 명령어
* vim 혹은 nano 등 텍스트 편집기
* condor_q : 작업상태 확인
* condor_rm : 작업 취소
* condor_history : 완료된 작업 목록 확인