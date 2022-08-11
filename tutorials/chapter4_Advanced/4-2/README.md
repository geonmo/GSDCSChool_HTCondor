# 동적 슬롯에 관하여 

## 목표
1. 동적 슬롯 사용으로 필요한 CPU와 메모리를 요청하는 방법을 익힙니다.

## 실습 4-2
### 실습
1. 교재를 참고하여 node2 서버에 동적슬롯을 설정합니다. (단, node3은 제외합니다.)
   * /etc/condor/config.d/03-dynamic.config
       * ```bash
         NUM_SLOTS = 1
         NUM_SLOTS_TYPE_1 = 1
         SLOT_TYPE_1 = 100%
         SLOT_TYPE_1_PARTITIONABLE = TRUE
         CONSUMPTION_POLICY = true
         ```
   * condor 서비스 재시작    
       * ```systemctl restart condor```
1. ```condor_status```를 하였을 때, node2와 node3의 슬롯 개수의 차이가 납니까?
1. **dynamic_check.jds** 을 제출하여 슬롯에 할당된 자원을 확인합니다.



