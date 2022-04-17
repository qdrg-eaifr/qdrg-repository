#!/bin/bash

##Declaring variables
##-------------------
declare -i jt

##Building transition folders
##---------------------------
cd CompFromFluxto
##Loop over the various transitions
#for ((l=0; l<=62; l++)); do
for l in 0 4 5 6 10 11 12 13 14 20 21 22 23 24; do
##Copy transition fluxes into working folder
mkdir transitionrot$l
for jt in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35; do 
if [ $jt -gt 9 ]; then
   if [ $jt -gt 99 ]; then
###      if [ $l -gt 9 ]; then 
###      cp ../Prop-test-J$jt""/Probability/transtorot-0$l/flux transitionrot$l/flux_rot$l--$jt
###      else
###      cp ../Prop-test-J$jt""/Probability/transtorot-00$l/flux transitionrot$l/flux_rot$l--$jt
###      fi
      cp ../Prop-c-J$jt""/Probability/transtorot-$l/flux transitionrot$l/flux_rot$l--$jt
###      echo "$jt checking 100+ good"
   else
###      if [ $l -gt 9 ]; then
###      cp ../Prop-test-J0$jt""/Probability/transtorot-0$l/flux transitionrot$l/flux_rot$l--$jt
###      else
###      cp ../Prop-test-J0$jt""/Probability/transtorot-00$l/flux transitionrot$l/flux_rot$l--$jt
###      fi
      cp ../Prop-c-J0$jt""/Probability/transtorot-$l/flux transitionrot$l/flux_rot$l--$jt
###      echo "$jt checking 10+ 100- good"
   fi
else
###if [ $l -gt 9 ]; then
###cp ../Prop-test-J00$jt""/Probability/transtorot-0$l/flux transitionrot$l/flux_rot$l--$jt
###else
###cp ../Prop-test-J00$jt""/Probability/transtorot-00$l/flux transitionrot$l/flux_rot$l--$jt
###fi
cp ../Prop-c-J00$jt""/Probability/transtorot-$l/flux transitionrot$l/flux_rot$l--$jt
fi
done
##End of loop on jt
done
##End of loop on l's
cd ..
##---------------------------


##Interpolation of transition probabilities
##-----------------------------------------
cd CompFromFluxto
cp ../transfrot travailrot
#for ((l=0; l<=62; l++)); do
for l in 0 4 5 6 10 11 12 13 14 20 21 22 23 24; do
#for ((jt=1; jt<=50; jt++)); do
for jt in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35; do 
##Copy required fluxes in the "travail" folder and interpolate
cp transitionrot$l/flux_rot$l--$jt travailrot/flux00$jt
cd travailrot
cp flux00$jt fichier1
echo 4 $l $jt > fichier3
./transfrot
##cp fichier2 ../transitionrot$l/omflux_rot$l--$jt
cp fichier2 ../transitionrot$l/omflux_rot$l--$jt
cd ..
done
##!End of loop on jt
done
##!End of loop on l's
#
cd ..
