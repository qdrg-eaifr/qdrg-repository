#!/bin/bash

#Declaring variables
#-------------------
declare -i rl j jt jmax jmin
jmin=0
jmax=25

##Bash tables containing the various states
##-----------------------------------------
declare -a arraystate
arraystatej0=(000 101 111 110 202 212 211)
#arraystatej0=(000 101 111 110 202 212 211 221 220 303 313 312 322 321 331 330)
#for ((i=0; i<=15; i++)); do
#echo "arrstate[$i]=" ${arraystatej0[$i]} 
#done

##Computing partial cross-sections
##--------------------------------
#Go into the data folder
cd CompFromTaweto
#Create the cross-sections folder
#mkdir CrossSections
#Copy xs programs to the CrossSections folder
cp ../codesum*-tawe* .
#Loop onto the states transitions folders
for ((i=0; i<=6; i++)); do
cd transitiontawe-${arraystatej0[$i]}
pwd
#Copy xs programs to the transition folders
cp ../codesum*-tawe* .
for ((jt=$jmin; jt<=$jmax; jt++)); do
#Run pgm for init summation
echo "$jt ${arraystatej0[$i]}" > inputl
./codesuminit-tawe
done
#Run pgm for jtot
echo "$jmin $jmax ${arraystatej0[$i]}" > inputjtot
./codesumfin-tawe
#Copy results to XS output folder
cp sum-total ../CrossSections/xsection-${arraystatej0[$i]}
cd ..
done
cd ..

