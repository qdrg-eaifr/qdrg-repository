#!/bin/bash

##Declaring variables
##-------------------
declare -i jt

##Building transition folders
##---------------------------
cd CompFromTaweto
##Loop over the various transitions
for ((l=0; l<=24; l++)); do
##Copy transition fluxes into working folder
mkdir transitiontawe$l
for jt in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50; do
if [ $jt -gt 9 ]; then
   if [ $jt -gt 99 ]; then
      if [ $l -gt 9 ]; then 
      cp ../Prop000-J$jt""d/Probability/transtotawe-d-0$l/probfile transitiontawe$l/probfile$l--$jt
      else
      cp ../Prop000-J$jt""d/Probability/transtotawe-d-00$l/probfile transitiontawe$l/probfile$l--$jt
      fi
###      echo "$jt checking 100+ good"
   else
      if [ $l -gt 9 ]; then
      cp ../Prop000-J0$jt""d/Probability/transtotawe-d-0$l/probfile transitiontawe$l/probfile$l--$jt
      else
      cp ../Prop000-J0$jt""d/Probability/transtotawe-d-00$l/probfile transitiontawe$l/probfile$l--$jt
      fi
###      echo "$jt checking 10+ 100- good"
   fi
else
 if [ $l -gt 9 ]; then
 cp ../Prop000-J00$jt""d/Probability/transtotawe-d-0$l/probfile transitiontawe$l/probfile$l--$jt
 else
 cp ../Prop000-J00$jt""d/Probability/transtotawe-d-00$l/probfile transitiontawe$l/probfile$l--$jt
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
for ((l=0; l<=24; l++)); do
for ((jt=1; jt<=50; jt++)); do
##Copy required fluxes in the "travail" folder and interpolate
cp transitiontawe$l/probfile$l--$jt travailtawe/prob00$jt
cd travailtawe
cp prob00$jt fichier1
echo $l $jt > fichier3
./transftawe
cp fichier2 ../transitiontawe$l/mprobfile$l--$jt
cd ..
done
##!End of loop on jt
done
##!End of loop on l's
#d ..
cd ..
