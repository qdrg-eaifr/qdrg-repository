#!/bin/bash

##Declaring variables
##-------------------
declare -i jt

##Building transition folders
##---------------------------
cd CompFromFluxto
##Loop over the various transitions
for ((l=0; l<=83; l++)); do
##Copy transition fluxes into working folder
mkdir transitionrot$l
for jt in 000 001 002 003 004 005 006 007 008 009 010 011 012 013 014 015 016 017 018 019 020 021 022 023 024 025 026 027 028 029 030 031 032 033 034 035 036 037 038 039 040; do # 41 42 43 44 45 46 47; do
 cp ../Prop-J$jt/Probability/transtorot-$l/flux transitionrot$l/flux_rot$l--$jt
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
for ((l=0; l<=83; l++)); do
#for ((jt=1; jt<=50; jt++)); do
for jt in 000 001 002 003 004 005 006 007 008 009 010 011 012 013 014 015 016 017 018 019 020 021 022 023 024 025 026 027 028 029 030 031 032 033 034 035 036 037 038 039 040; do # 41 42 43 44 45 46 47 48 49 50; do
##Copy required fluxes in the "travail" folder and interpolate
cp transitionrot$l/flux_rot$l--$jt travailrot/flux00$jt
cd travailrot
cp flux00$jt fichier1
echo $l $jt > fichier3
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
