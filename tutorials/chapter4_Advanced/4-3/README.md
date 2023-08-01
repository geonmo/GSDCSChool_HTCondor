# Apptainer 컨테이너 활용에 대해서,  

## 목표
1. Apptainer를 이용하여 특정 APP의 환경을 구축하고 실행해봅니다.

## 실습 4-3
### 실습
1. Submit node와 Worker nodes들에 ```yum install -y apptainer apptainer-suid```로 Apptainer(기존 Singularity) 프로그램을 설치합니다.
1. 해당 서버들에 ```/etc/condor/config.d/04-singularity.config``` 설정을 합니다.
   ```bash
   SINGULARITY_JOB = !isUndefined(TARGET.SingularityImage)
   SINGULARITY_IMAGE_EXPR = TARGET.SingularityImage
   SINGULARITY_TARGET_DIR = /srv
   MOUNT_UNDER_SCRATCH = /tmp, /var/tmp
   SINGULARITY_BIND_EXPR=ifThenElse( isUndefined(TARGET.SingularityBind),"/home",TARGET.SingularityBind)
   SINGULARITY_EXTRA_ARGUMENTS=ifThenElse( isUndefined(TARGET.SingularityExtraArgs),"",TARGET.SingularityExtraArgs)
   ```
1. 설치 후, HTCondor 서비스를 재시작 합니다. ```systemctl restart condor```
1. Submit node에서 제공된 **geant4_run.jds**와 **geant4_run.sh** 파일을 이용하여 작업을 제출합니다.
   * geant4_run.jds 에 빠진 내용을 채워봅시다.
      * Geant4 컨테이너 이미지 파일의 위치 : ```/shared/geant4_latest.sif```
      * 컨테이너 환경에서 연결한 디렉토리 : ```/shared```
      * transfer_output_files 목록은 아래 transfer_output_remaps 설정을 참고하여 작성합시다.
1. 실행 후, brachytherapy_X.root 파일과 primary_X.root 파일이 생성되었는지를 확인합니다.
1. ROOT 프레임워크를 설치합니다. ```yum install -y root```
1. ```hadd brachytherapy.root brachytherapy_*.root```, ```hadd primary.root primary_*.root```로 데이터 파일들을 합칩니다.
1.  생성된 파일의 내용을 확인합니다. (X-Windows 환경 필수) ```root -l plot_primary.C```, ```root -l plot_brachytherapy.C```

### 추가실습
1. 아래의 내용으로 수정 후, 실행을 해봅시다.
1. 실행할 Macro : ```FlexiSourceMacro.mac```
1. 결과파일 : ```EnergyDeposition_Flexi.out, brachytherapy.root, primary.root```
1. primary.root 파일을 비교해보고, 위의 [I-125](https://en.wikipedia.org/wiki/Iodine-125)와 [Ir-192](https://www.researchgate.net/figure/Iridium-192-gamma-spectrum_tbl1_228604512)의 에너지 스펙트럼이 알려진 것과 같은지 비교해보세요.

## 토의
1. 실행 중 컴파일 과정을 되풀이하지 않도록 하려면 어떻게 구성해야 할까요?
