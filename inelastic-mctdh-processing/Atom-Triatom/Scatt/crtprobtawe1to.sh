#!/bin/bash

##Declaring variables
##-------------------
declare -i jt

##Building transition folders
##---------------------------
cd CompFromTaweto
##Loop over the various transitions
for ((l=0; l<=9; l++)); do
##Copy transition fluxes into working folder
mkdir transition0tawe$l
for jt in 0; do
if [ $jt -gt 9 ]; then
   if [ $jt -gt 99 ]; then
      if [ $l -gt 9 ]; then 
      cp ../Prop000-J$jt""d/Probability/transtotawe-d-0$l/probfile transition0tawe$l/probfile$l--$jt
      else
      cp ../Prop000-J$jt""d/Probability/transtotawe-d-00$l/probfile transition0tawe$l/probfile$l--$jt
      fi
###      echo "$jt checking 100+ good"
   else
      if [ $l -gt 9 ]; then
      cp ../Prop000-J0$jt""d/Probability/transtotawe-d-0$l/probfile transition0tawe$l/probfile$l--$jt
      else
      cp ../Prop000-J0$jt""d/Probability/transtotawe-d-00$l/probfile transition0tawe$l/probfile$l--$jt
      fi
###      echo "$jt checking 10+ 100- good"
   fi
else
 if [ $l -gt 9 ]; then
 cp ../Prop000-J00$jt""d/Probability/transtotawe-d-0$l/probfile transition0tawe$l/probfile$l--$jt
 else
 cp ../Prop000-J00$jt""d/Probability/transtotawe-d-00$l/probfile transition0tawe$l/probfile$l--$jt
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
cd CompFromTaweto
cp ../transftawe travailtawe
for ((l=0; l<=9; l++)); do
for ((jt=0; jt<=0; jt++)); do
##Copy required fluxes in the "travail" folder and interpolate
cp transition0tawe$l/probfile$l--$jt travailtawe/prob00$jt
cd travailtawe
cp prob00$jt fichier1
echo $l $jt > fichier3
./transftawe
cp fichier2 ../transition0tawe$l/mprobfile$l--$jt
cp fichier2 ../../Prop000-J000d/Probability/transtotawe-d-00$l/mprobfile$l--$jt
cd ..
done
##!End of loop on jt
done
##!End of loop on l's
#
cd ..
