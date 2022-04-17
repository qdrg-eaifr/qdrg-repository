#!/bin/bash

###Loop over total J
for jtot in 001; do 
cd Prop-J$jtot
mkdir Probability

###Energy Distribution
#crosspec84 -o enerd1 -q 2000 0.00 300.00 cm-1 cross
#mv enerd1.pl enerd1

###Compute total flux and write it in another output file
#flux84 -w -ed fluxt -n 10 -p 2000 0.00 300.00 cm-1 r
#mv flux fluxenerd

###Loop over initial states
for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83; do
mkdir Probability/transtorot-$i
flux84 -w -n 1 -o Probability/transtorot-$i -p 2000 -P 2 read ../Projectors-gnrt/RST$i 1 1 % 0.00 300.00 cm-1 r
done

cd ..
done

