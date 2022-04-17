#!/bin/bash:q

##Declaring variables
##-------------------
declare -i rl j jt jmax
jmax=50

##Copying the various probabilities into the appropriate folders
##--------------------------------------------------------------
cd CompFromTaweto

mkdir transitiontawe-000
cp ../Prop000-J000d/Probability/transtotawe-d-000/mprobfile0--0 transitiontawe-000/mprobfile000-1-0
for ((rl=0; rl<=0; rl++)); do
for ((jt=1; jt<=$jmax; jt++)); do
cp transitiontawe$rl/mprobfile$rl--$jt transitiontawe-000/mprobfile000-1-$jt
done
done
mkdir transitiontawe-101
cp ../Prop000-J000d/Probability/transtotawe-d-001/mprobfile1--0 transitiontawe-101/mprobfile101-1-0
for ((rl=1; rl<=3; rl++)); do
j=$rl-0
for ((jt=1; jt<=$jmax; jt++)); do
cp transitiontawe$rl/mprobfile$rl--$jt transitiontawe-101/mprobfile101-$j-$jt
done
done
mkdir transitiontawe-111
cp ../Prop000-J000d/Probability/transtotawe-d-002/mprobfile2--0 transitiontawe-111/mprobfile111-1-0
for ((rl=4; rl<=6; rl++)); do
j=$rl-3
for ((jt=1; jt<=$jmax; jt++)); do
cp transitiontawe$rl/mprobfile$rl--$jt transitiontawe-111/mprobfile111-$j-$jt
done
done
mkdir transitiontawe-110
cp ../Prop000-J000d/Probability/transtotawe-d-003/mprobfile3--0 transitiontawe-110/mprobfile110-1-0
for ((rl=7; rl<=9; rl++)); do
j=$rl-6
for ((jt=1; jt<=$jmax; jt++)); do
cp transitiontawe$rl/mprobfile$rl--$jt transitiontawe-110/mprobfile110-$j-$jt
done
done
mkdir transitiontawe-202
cp ../Prop000-J000d/Probability/transtotawe-d-004/mprobfile4--0 transitiontawe-202/mprobfile202-1-0
for ((rl=10; rl<=14; rl++)); do
j=$rl-9
for ((jt=1; jt<=$jmax; jt++)); do
cp transitiontawe$rl/mprobfile$rl--$jt transitiontawe-202/mprobfile202-$j-$jt
done
done
mkdir transitiontawe-212
cp ../Prop000-J000d/Probability/transtotawe-d-005/mprobfile5--0 transitiontawe-212/mprobfile212-1-0
for ((rl=15; rl<=19; rl++)); do
j=$rl-14
for ((jt=1; jt<=$jmax; jt++)); do
cp transitiontawe$rl/mprobfile$rl--$jt transitiontawe-212/mprobfile212-$j-$jt
done
done
mkdir transitiontawe-211
cp ../Prop000-J000d/Probability/transtotawe-d-006/mprobfile6--0 transitiontawe-211/mprobfile211-1-0
for ((rl=20; rl<=24; rl++)); do
j=$rl-19
for ((jt=1; jt<=$jmax; jt++)); do
cp transitiontawe$rl/mprobfile$rl--$jt transitiontawe-211/mprobfile211-$j-$jt
done
done
#mkdir transitiontawe-221
#cp ../Prop000-J000d/Probability/transtotawe-d-007/mprobfile7--0 transitiontawe-221/mprobfile221-1-0
#for ((rl=25; rl<=29; rl++)); do
#j=$rl-24
#for ((jt=1; jt<=$jmax; jt++)); do
#cp transitiontawe$rl/mprobfile$rl--$jt transitiontawe-221/mprobfile221-$j-$jt
#done
#done
#mkdir transitiontawe-220
#cp ../Prop000-J000d/Probability/transtotawe-d-008/mprobfile8--0 transitiontawe-220/mprobfile220-1-0
#for ((rl=30; rl<=34; rl++)); do
#j=$rl-29
#for ((jt=1; jt<=$jmax; jt++)); do
#cp transitiontawe$rl/mprobfile$rl--$jt transitiontawe-220/mprobfile220-$j-$jt
#done
#done
#mkdir transitiontawe-303
#cp ../Prop000-J000d/Probability/transtotawe-d-009/mprobfile9--0 transitiontawe-303/mprobfile303-1-0
#for ((rl=35; rl<=41; rl++)); do
#j=$rl-34
#for ((jt=1; jt<=$jmax; jt++)); do
#cp transitiontawe$rl/mprobfile$rl--$jt transitiontawe-303/mprobfile303-$j-$jt
#done
#done
#mkdir transitiontawe-313
#cp ../Prop000-J000d/Probability/transtotawe-d-010/mprobfile10--0 transitiontawe-313/mprobfile313-1-0
#for ((rl=42; rl<=48; rl++)); do
#j=$rl-41
#for ((jt=1; jt<=$jmax; jt++)); do
#cp transitiontawe$rl/mprobfile$rl--$jt transitiontawe-313/mprobfile313-$j-$jt
#done
#done
#mkdir transitiontawe-312
#cp ../Prop000-J000d/Probability/transtotawe-d-011/mprobfile11--0 transitiontawe-312/mprobfile312-1-0
#for ((rl=49; rl<=55; rl++)); do
#j=$rl-48
#for ((jt=1; jt<=$jmax; jt++)); do
#cp transitiontawe$rl/mprobfile$rl--$jt transitiontawe-312/mprobfile312-$j-$jt
#done
#done
#mkdir transitiontawe-322
#cp ../Prop000-J000d/Probability/transtotawe-d-012/mprobfile12--0 transitiontawe-322/mprobfile322-1-0
#for ((rl=56; rl<=62; rl++)); do
#j=$rl-55
#for ((jt=1; jt<=$jmax; jt++)); do
#cp transitiontawe$rl/mprobfile$rl--$jt transitiontawe-322/mprobfile322-$j-$jt
#done
#done
#mkdir transitiontawe-321
#cp ../Prop000-J000d/Probability/transtotawe-d-013/mprobfile13--0 transitiontawe-321/mprobfile321-1-0
#for ((rl=63; rl<=69; rl++)); do
#j=$rl-62
#for ((jt=1; jt<=$jmax; jt++)); do
#cp transitiontawe$rl/mprobfile$rl--$jt transitiontawe-321/mprobfile321-$j-$jt
#done
#done
#mkdir transitiontawe-331
#cp ../Prop000-J000d/Probability/transtotawe-d-014/mprobfile14--0 transitiontawe-331/mprobfile331-1-0
#for ((rl=70; rl<=76; rl++)); do
#j=$rl-69
#for ((jt=1; jt<=$jmax; jt++)); do
#cp transitiontawe$rl/mprobfile$rl--$jt transitiontawe-331/mprobfile331-$j-$jt
#done
#done
#mkdir transitiontawe-330
#cp ../Prop000-J000d/Probability/transtotawe-d-015/mprobfile15--0 transitiontawe-330/mprobfile330-1-0
#for ((rl=77; rl<=83; rl++)); do
#j=$rl-76
#for ((jt=1; jt<=$jmax; jt++)); do
#cp transitiontawe$rl/mprobfile$rl--$jt transitiontawe-330/mprobfile330-$j-$jt
#done
#done

cd ..

