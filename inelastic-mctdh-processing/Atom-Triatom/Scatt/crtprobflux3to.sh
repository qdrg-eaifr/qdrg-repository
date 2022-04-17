#!/bin/bash:q

##Declaring variables
##-------------------
declare -i rl j jt jmax
jmax=40

##Copying the various probabilities into the appropriate folders
##--------------------------------------------------------------
cd CompFromFluxto

mkdir transitionrot-000
###cp ../Prop111-J000a/Probability/transtorot-a-000/mflux_rot0--0 transitionrot-000/mflux_rot000-1-0
cp ../Prop111-J000a/Probability/transtorot-a-000/omflux_rot0--0 transitionrot-000/omflux_rot000-1-0
for ((rl=0; rl<=0; rl++)); do
for ((jt=1; jt<=$jmax; jt++)); do
###cp transitionrot$rl/mflux_rot$rl--$jt transitionrot-000/mflux_rot000-1-$jt
cp transitionrot$rl/omflux_rot$rl--$jt transitionrot-000/omflux_rot000-1-$jt
done
done
mkdir transitionrot-101
###cp ../Prop111-J000a/Probability/transtorot-a-001/mflux_rot1--0 transitionrot-101/mflux_rot101-1-0
cp ../Prop111-J000a/Probability/transtorot-a-001/omflux_rot1--0 transitionrot-101/omflux_rot101-1-0
for ((rl=1; rl<=3; rl++)); do
j=$rl-0
for ((jt=1; jt<=$jmax; jt++)); do
###cp transitionrot$rl/mflux_rot$rl--$jt transitionrot-101/mflux_rot101-$j-$jt
cp transitionrot$rl/omflux_rot$rl--$jt transitionrot-101/omflux_rot101-$j-$jt
done
done
mkdir transitionrot-111
###cp ../Prop111-J000a/Probability/transtorot-a-002/mflux_rot2--0 transitionrot-111/mflux_rot111-1-0
cp ../Prop111-J000a/Probability/transtorot-a-002/omflux_rot2--0 transitionrot-111/omflux_rot111-1-0
for ((rl=4; rl<=6; rl++)); do
j=$rl-3
for ((jt=1; jt<=$jmax; jt++)); do
###cp transitionrot$rl/mflux_rot$rl--$jt transitionrot-111/mflux_rot111-$j-$jt
cp transitionrot$rl/omflux_rot$rl--$jt transitionrot-111/omflux_rot111-$j-$jt
done
done
mkdir transitionrot-110
###cp ../Prop111-J000a/Probability/transtorot-a-003/mflux_rot3--0 transitionrot-110/mflux_rot110-1-0
cp ../Prop111-J000a/Probability/transtorot-a-003/omflux_rot3--0 transitionrot-110/omflux_rot110-1-0
for ((rl=7; rl<=9; rl++)); do
j=$rl-6
for ((jt=1; jt<=$jmax; jt++)); do
###cp transitionrot$rl/mflux_rot$rl--$jt transitionrot-110/mflux_rot110-$j-$jt
cp transitionrot$rl/omflux_rot$rl--$jt transitionrot-110/omflux_rot110-$j-$jt
done
done
mkdir transitionrot-202
###cp ../Prop111-J000a/Probability/transtorot-a-004/mflux_rot4--0 transitionrot-202/mflux_rot202-1-0
cp ../Prop111-J000a/Probability/transtorot-a-004/omflux_rot4--0 transitionrot-202/omflux_rot202-1-0
for ((rl=10; rl<=14; rl++)); do
j=$rl-9
for ((jt=1; jt<=$jmax; jt++)); do
###cp transitionrot$rl/mflux_rot$rl--$jt transitionrot-202/mflux_rot202-$j-$jt
cp transitionrot$rl/omflux_rot$rl--$jt transitionrot-202/omflux_rot202-$j-$jt
done
done
mkdir transitionrot-212
###cp ../Prop111-J000a/Probability/transtorot-a-005/mflux_rot5--0 transitionrot-212/mflux_rot212-1-0
cp ../Prop111-J000a/Probability/transtorot-a-005/omflux_rot5--0 transitionrot-212/omflux_rot212-1-0
for ((rl=15; rl<=19; rl++)); do
j=$rl-14
for ((jt=1; jt<=$jmax; jt++)); do
###cp transitionrot$rl/mflux_rot$rl--$jt transitionrot-212/mflux_rot212-$j-$jt
cp transitionrot$rl/omflux_rot$rl--$jt transitionrot-212/omflux_rot212-$j-$jt
done
done
mkdir transitionrot-211
###cp ../Prop111-J000a/Probability/transtorot-a-006/mflux_rot6--0 transitionrot-211/mflux_rot211-1-0
cp ../Prop111-J000a/Probability/transtorot-a-006/omflux_rot6--0 transitionrot-211/omflux_rot211-1-0
for ((rl=20; rl<=24; rl++)); do
j=$rl-19
for ((jt=1; jt<=$jmax; jt++)); do
###cp transitionrot$rl/mflux_rot$rl--$jt transitionrot-211/mflux_rot211-$j-$jt
cp transitionrot$rl/omflux_rot$rl--$jt transitionrot-211/omflux_rot211-$j-$jt
done
done
mkdir transitionrot-303
###cp ../Prop111-J000a/Probability/transtorot-a-007/mflux_rot7--0 transitionrot-303/mflux_rot303-1-0
cp ../Prop111-J000a/Probability/transtorot-a-007/omflux_rot7--0 transitionrot-303/omflux_rot303-1-0
for ((rl=25; rl<=31; rl++)); do
j=$rl-24
for ((jt=1; jt<=$jmax; jt++)); do
###cp transitionrot$rl/mflux_rot$rl--$jt transitionrot-303/mflux_rot303-$j-$jt
cp transitionrot$rl/omflux_rot$rl--$jt transitionrot-303/omflux_rot303-$j-$jt
done
done
mkdir transitionrot-313
###cp ../Prop111-J000a/Probability/transtorot-a-008/mflux_rot8--0 transitionrot-313/mflux_rot313-1-0
cp ../Prop111-J000a/Probability/transtorot-a-008/omflux_rot8--0 transitionrot-313/omflux_rot313-1-0
for ((rl=32; rl<=38; rl++)); do
j=$rl-31
for ((jt=1; jt<=$jmax; jt++)); do
###cp transitionrot$rl/mflux_rot$rl--$jt transitionrot-313/mflux_rot313-$j-$jt
cp transitionrot$rl/omflux_rot$rl--$jt transitionrot-313/omflux_rot313-$j-$jt
done
done
mkdir transitionrot-312
###cp ../Prop111-J000a/Probability/transtorot-a-009/mflux_rot9--0 transitionrot-312/mflux_rot312-1-0
cp ../Prop111-J000a/Probability/transtorot-a-009/omflux_rot9--0 transitionrot-312/omflux_rot312-1-0
for ((rl=39; rl<=45; rl++)); do
j=$rl-38
for ((jt=1; jt<=$jmax; jt++)); do
###cp transitionrot$rl/mflux_rot$rl--$jt transitionrot-312/mflux_rot312-$j-$jt
cp transitionrot$rl/omflux_rot$rl--$jt transitionrot-312/omflux_rot312-$j-$jt
done
done
mkdir transitionrot-221
###cp ../Prop111-J000a/Probability/transtorot-a-010/mflux_rot10--0 transitionrot-221/mflux_rot221-1-0
cp ../Prop111-J000a/Probability/transtorot-a-010/omflux_rot10--0 transitionrot-221/omflux_rot221-1-0
for ((rl=46; rl<=50; rl++)); do
j=$rl-45
for ((jt=1; jt<=$jmax; jt++)); do
###cp transitionrot$rl/mflux_rot$rl--$jt transitionrot-221/mflux_rot221-$j-$jt
cp transitionrot$rl/omflux_rot$rl--$jt transitionrot-221/omflux_rot221-$j-$jt
done
done
mkdir transitionrot-220
###cp ../Prop111-J000a/Probability/transtorot-a-011/mflux_rot11--0 transitionrot-220/mflux_rot220-1-0
cp ../Prop111-J000a/Probability/transtorot-a-011/omflux_rot11--0 transitionrot-220/omflux_rot220-1-0
for ((rl=51; rl<=55; rl++)); do
j=$rl-50
for ((jt=1; jt<=$jmax; jt++)); do
###cp transitionrot$rl/mflux_rot$rl--$jt transitionrot-220/mflux_rot220-$j-$jt
cp transitionrot$rl/omflux_rot$rl--$jt transitionrot-220/omflux_rot220-$j-$jt
done
done
mkdir transitionrot-322
###cp ../Prop111-J000a/Probability/transtorot-a-012/mflux_rot12--0 transitionrot-322/mflux_rot322-1-0
cp ../Prop111-J000a/Probability/transtorot-a-012/omflux_rot12--0 transitionrot-322/omflux_rot322-1-0
for ((rl=56; rl<=62; rl++)); do
j=$rl-55
for ((jt=1; jt<=$jmax; jt++)); do
###cp transitionrot$rl/mflux_rot$rl--$jt transitionrot-322/mflux_rot322-$j-$jt
cp transitionrot$rl/omflux_rot$rl--$jt transitionrot-322/omflux_rot322-$j-$jt
done
done
mkdir transitionrot-321
###cp ../Prop111-J000a/Probability/transtorot-a-013/mflux_rot13--0 transitionrot-321/mflux_rot321-1-0
cp ../Prop111-J000a/Probability/transtorot-a-013/omflux_rot13--0 transitionrot-321/omflux_rot321-1-0
for ((rl=63; rl<=69; rl++)); do
j=$rl-62
for ((jt=1; jt<=$jmax; jt++)); do
###cp transitionrot$rl/mflux_rot$rl--$jt transitionrot-321/mflux_rot321-$j-$jt
cp transitionrot$rl/omflux_rot$rl--$jt transitionrot-321/omflux_rot321-$j-$jt
done
done



#mkdir transitionrot-331
#cp ../Prop111-J000a/Probability/transtorot-a-016/mflux_rot16--0 transitionrot-331/mflux_rot331-1-0
#for ((rl=70; rl<=76; rl++)); do
#j=$rl-69
#for ((jt=1; jt<=$jmax; jt++)); do
#cp transitionrot$rl/mflux_rot$rl--$jt transitionrot-331/mflux_rot331-$j-$jt
#done
#done
#mkdir transitionrot-330
#cp ../Prop111-J000a/Probability/transtorot-a-017/mflux_rot17--0 transitionrot-330/mflux_rot330-1-0
#for ((rl=77; rl<=83; rl++)); do
#j=$rl-76
#for ((jt=1; jt<=$jmax; jt++)); do
#cp transitionrot$rl/mflux_rot$rl--$jt transitionrot-330/mflux_rot330-$j-$jt
#done
#done

cd ..

