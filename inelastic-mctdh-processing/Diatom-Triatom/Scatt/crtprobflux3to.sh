#!/bin/bash

#Declaring variables
#-------------------
declare -i rl j jt jmax jmin
jmin=0
jmax=35

##Bash tables containing the various states
##-----------------------------------------
declare -a arraystate
arraystatej0=(000 111 202 211)
#for ((i=0; i<=15; i++)); do
#echo "arrstate[$i]=" ${arraystatej0[$i]} 
#done

##Computing partial cross-sections
##--------------------------------
#Go into the data folder
cd CompFromFluxto
#Create the cross-sections folder
#mkdir CrossSections
#Copy xs programs to the CrossSections folder
###cp ../codesum*-flux* .
cp ../codesum*-fluxo* .
#Loop onto the states transitions folders
for ((i=0; i<=3; i++)); do
cd transitionrot-${arraystatej0[$i]}-0
pwd
#Copy xs programs to the transition folders
###cp ../codesum*-flux* .
cp ../codesum*-fluxo* .
for ((jt=$jmin; jt<=$jmax; jt++)); do
#Run pgm for init summation
echo "$jt ${arraystatej0[$i]}" > inputl
###./codesuminit-flux
./codesuminit-fluxo
done
#Run pgm for jtot
echo "$jmin $jmax ${arraystatej0[$i]}" > inputjtot
###./codesumfin-flux
./codesumfin-fluxo
#Copy results to XS output folder
###cp sum-total ../CrossSections/xsection-${arraystatej0[$i]}
cp sum-total ../CrossSections/csection-${arraystatej0[$i]}
cd ..
done
cd ..

