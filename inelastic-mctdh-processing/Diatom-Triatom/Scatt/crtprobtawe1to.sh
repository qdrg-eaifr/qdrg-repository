#!/bin/bash

##Declaring variables
##-------------------
declare -i jt

##Building transition folders
##---------------------------
cd CompFromTaweto
##Loop over the various transitions
#for ((l=0; l<=62; l++)); do
for l in 0 4 5 6 10 11 12 13 14 20 21 22 23 24; do
##Copy transition fluxes into working folder
mkdir transitiontawe$l
for jt in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35; do
if [ $jt -gt 9 ]; then
   if [ $jt -gt 99 ]; then
###      if [ $l -gt 9 ]; then 
###      cp ../Prop000-a-J$jt/Probability/transtotawe-0$l/probfile transitiontawe$l/probfile$l--$jt
###      else
###      cp ../Prop000-a-J$jt/Probability/transtotawe-00$l/probfile transitiontawe$l/probfile$l--$jt
###      fi
      cp ../Prop-c-J$jt/Probability/transtotawe-$l/probfile transitiontawe$l/probfile$l--$jt   
###      echo "$jt checking 100+ good"
   else
###      if [ $l -gt 9 ]; then
###      cp ../Prop000-a-J0$jt/Probability/transtotawe-0$l/probfile transitiontawe$l/probfile$l--$jt
###      else
###      cp ../Prop000-a-J0$jt/Probability/transtotawe-00$l/probfile transitiontawe$l/probfile$l--$jt
###      fi
      cp ../Prop-c-J0$jt/Probability/transtotawe-$l/probfile transitiontawe$l/probfile$l--$jt
###      echo "$jt checking 10+ 100- good"
   fi
else
### if [ $l -gt 9 ]; then
### cp ../Prop000-a-J00$jt/Probability/transtotawe-0$l/probfile transitiontawe$l/probfile$l--$jt
### else
### cp ../Prop000-a-J00$jt/Probability/transtotawe-00$l/probfile transitiontawe$l/probfile$l--$jt
### fi
 cp ../Prop-c-J00$jt/Probability/transtotawe-$l/probfile transitiontawe$l/probfile$l--$jt
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
#for ((l=0; l<=62; l++)); do
for l in 0 4 5 6 10 11 12 13 14 20 21 22 23 24; do
for ((jt=0; jt<=35; jt++)); do
##Copy required fluxes in the "travail" folder and interpolate
cp transitiontawe$l/probfile$l--$jt travailtawe/prob00$jt
cd travailtawe
cp prob00$jt fichier1
echo 4 $l $jt > fichier3
./transftawe
cp fichier2 ../transitiontawe$l/mprobfile$l--$jt
cd ..
done
##!End of loop on jt
done
##!End of loop on l's
#d ..
cd ..
