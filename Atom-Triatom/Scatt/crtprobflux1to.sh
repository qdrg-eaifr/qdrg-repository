#!/bin/bash

##Declaring variables
##-------------------
declare -i jt

##Building transition folders
##---------------------------
cd CompFromFluxto
##Loop over the various transitions
for ((l=0; l<=19; l++)); do
##Copy transition fluxes into working folder
mkdir transition0rot$l
for jt in 0; do
if [ $jt -gt 9 ]; then
   if [ $jt -gt 99 ]; then
      if [ $l -gt 9 ]; then 
      cp ../Prop-J$jt""a/Probability/transtorot-a-0$l/flux transition0rot$l/flux_rot$l--$jt
      else
      cp ../Prop-J$jt""a/Probability/transtorot-a-00$l/flux transition0rot$l/flux_rot$l--$jt
      fi
###      echo "$jt checking 100+ good"
   else
      if [ $l -gt 9 ]; then
      cp ../Prop-J0$jt""a/Probability/transtorot-a-0$l/flux transition0rot$l/flux_rot$l--$jt
      else
      cp ../Prop-J0$jt""a/Probability/transtorot-a-00$l/flux transition0rot$l/flux_rot$l--$jt
      fi
###      echo "$jt checking 10+ 100- good"
   fi
else
 if [ $l -gt 9 ]; then
 cp ../Prop-J00$jt""a/Probability/transtorot-a-0$l/flux transition0rot$l/flux_rot$l--$jt
 else
 cp ../Prop-J00$jt""a/Probability/transtorot-a-00$l/flux transition0rot$l/flux_rot$l--$jt
 fi
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
for ((l=0; l<=19; l++)); do
for ((jt=0; jt<=0; jt++)); do
##Copy required fluxes in the "travail" folder and interpolate
cp transition0rot$l/flux_rot$l--$jt travailrot/flux00$jt
cd travailrot
cp flux00$jt fichier1
echo $l $jt > fichier3
./transfrot
###cp fichier2 ../transition0rot$l/mflux_rot$l--$jt
cp fichier2 ../transition0rot$l/omflux_rot$l--$jt
if [ $l -gt 9 ]; then
###cp fichier2 ../../Prop000-J000d/Probability/transtorot-a-0$l/mflux_rot$l--$jt
cp fichier2 ../../Prop111-J000a/Probability/transtorot-a-0$l/omflux_rot$l--$jt
else
###cp fichier2 ../../Prop000-J000d/Probability/transtorot-a-00$l/mflux_rot$l--$jt
cp fichier2 ../../Prop111-J000a/Probability/transtorot-a-00$l/omflux_rot$l--$jt
fi
cd ..
done
##!End of loop on jt
done
##!End of loop on l's
#
cd ..
