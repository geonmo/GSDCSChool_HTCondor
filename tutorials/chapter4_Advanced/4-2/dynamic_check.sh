#!/bin/bash

hostname
cat $_CONDOR_MACHINE_AD | egrep "TotalSlotCpus"
cat $_CONDOR_MACHINE_AD | egrep "TotalSlotMemory"
cat $_CONDOR_MACHINE_AD | egrep "TopalSlotDisk"



