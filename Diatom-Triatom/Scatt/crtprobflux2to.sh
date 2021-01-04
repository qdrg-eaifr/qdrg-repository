#!/bin/bash

##Declaring variables
##-------------------
declare -i rl j jt jmax
jmax=35

##Copying the various probabilities into the appropriate folders
##--------------------------------------------------------------
cd CompFromFluxto

mkdir transitionrot-000-0
for ((rl=0; rl<=0; rl++)); do
for ((jt=0; jt<=$jmax; jt++)); do
cp transitionrot$rl/omflux_rot$rl--$jt transitionrot-000-0/omflux_rot000-1-$jt
done
done
###mkdir transitionrot-101-0
###for ((rl=1; rl<=3; rl++)); do
###j=$rl-0
###for ((jt=0; jt<=$jmax; jt++)); do
###cp transitionrot$rl/omflux_rot$rl--$jt transitionrot-101-0/omflux_rot101-$j-$jt
###done
###done
mkdir transitionrot-111-0
for ((rl=4; rl<=6; rl++)); do
j=$rl-3
for ((jt=0; jt<=$jmax; jt++)); do
cp transitionrot$rl/omflux_rot$rl--$jt transitionrot-111-0/omflux_rot111-$j-$jt
done
done
###mkdir transitionrot-110-0
###for ((rl=7; rl<=9; rl++)); do
###j=$rl-6
###for ((jt=0; jt<=$jmax; jt++)); do
###cp transitionrot$rl/omflux_rot$rl--$jt transitionrot-110-0/omflux_rot110-$j-$jt
###done
###done
mkdir transitionrot-202-0
for ((rl=10; rl<=14; rl++)); do
j=$rl-9
for ((jt=0; jt<=$jmax; jt++)); do
cp transitionrot$rl/omflux_rot$rl--$jt transitionrot-202-0/omflux_rot202-$j-$jt
done
done
###mkdir transitionrot-212-0
###for ((rl=15; rl<=19; rl++)); do
###j=$rl-14
###for ((jt=0; jt<=$jmax; jt++)); do
###cp transitionrot$rl/omflux_rot$rl--$jt transitionrot-212-0/omflux_rot212-$j-$jt
###done
###done
mkdir transitionrot-211-0
for ((rl=20; rl<=24; rl++)); do
j=$rl-19
for ((jt=0; jt<=$jmax; jt++)); do
cp transitionrot$rl/omflux_rot$rl--$jt transitionrot-211-0/omflux_rot211-$j-$jt
done
done
###mkdir transitionrot-221-0
###for ((rl=25; rl<=29; rl++)); do
###j=$rl-24
###for ((jt=0; jt<=$jmax; jt++)); do
###cp transitionrot$rl/omflux_rot$rl--$jt transitionrot-221-0/omflux_rot221-$j-$jt
###done
###done
###mkdir transitionrot-220-0
###for ((rl=30; rl<=34; rl++)); do
###j=$rl-29
###for ((jt=0; jt<=$jmax; jt++)); do
###cp transitionrot$rl/omflux_rot$rl--$jt transitionrot-220-0/omflux_rot220-$j-$jt
###done
###done
###mkdir transitionrot-303-0
###for ((rl=35; rl<=41; rl++)); do
###j=$rl-34
###for ((jt=0; jt<=$jmax; jt++)); do
###cp transitionrot$rl/omflux_rot$rl--$jt transitionrot-303-0/omflux_rot303-$j-$jt
###done
###done
###mkdir transitionrot-313-0
###for ((rl=42; rl<=48; rl++)); do
###j=$rl-41
###for ((jt=0; jt<=$jmax; jt++)); do
###cp transitionrot$rl/omflux_rot$rl--$jt transitionrot-313-0/omflux_rot313-$j-$jt
###done
###done
###mkdir transitionrot-312-0
###for ((rl=49; rl<=55; rl++)); do
###j=$rl-48
###for ((jt=0; jt<=$jmax; jt++)); do
###cp transitionrot$rl/omflux_rot$rl--$jt transitionrot-312-0/omflux_rot312-$j-$jt
###done
###done
###mkdir transitionrot-322-0
###for ((rl=56; rl<=62; rl++)); do
###j=$rl-55
###for ((jt=0; jt<=$jmax; jt++)); do
###cp transitionrot$rl/omflux_rot$rl--$jt transitionrot-322-0/omflux_rot322-$j-$jt
###done
###done

cd ..

