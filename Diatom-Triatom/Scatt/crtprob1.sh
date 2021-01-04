#!/bin/bash

###Loop over total J
for jtot in 000 001 002 003 004 005 006 007 008 009 010 011 012 013 014 015 016 017 018 019 020 021 022 023 024 025 026 027 028 029 030 031 032 033 034 035; do
cd Prop-b-J$jtot
mkdir Probability

###Energy Distribution
#crosspec84 -o enerd1 -q 2000 0.00 300.00 cm-1 cross
#mv enerd1.pl enerd1

###Compute total flux and write it in another output file
#flux84 -w -ed fluxt -n 10 -p 2000 0.00 300.00 cm-1 r
#mv flux fluxenerd

###Loop over initial states
for i in 0 4 5 6 10 11 12 13 14 20 21 22 23 24; do
mkdir Probability/transtorot-$i
flux84 -w  -n 1 -o Probability/transtorot-$i -p 2000 -P 2 read ../Projectors/RST$i 1 1 % -P 3 read ../Projectors/RST$i 1 1 % 0.00 300.00 cm-1 R
#mkdir Probability/transonrot-d-$i
#flux84 -w -ed flux -n 10 -o Probability/transonrot-d-$i -p 2000 -P 2 read ../Projectors/Jgt0-5/RST$i 1 1 % 0.00 100.00 cm-1 r
#flux84 -w -n 10 -o Probability/transonrot-b-$i -p 2000 -P 2 read ../Projectors/Jgt0-5/RST$i 1 1 % 0.00 100.00 cm-1 r
###mkdir Probability/transtotawe-$i
###crosscorr84 -n 1 -o Probability/transtotawe-$i/crossfile -f ./psi -r ../Projectors/RST$i/restart
###twprob84 -p 2000 -o Probability/transtotawe-$i/probfile 0.00 300.00 cm-1 Probability/transtotawe-$i/crossfile enerd enerd 
#mkdir Probability/transontawe-d-$i
#crosscorr84 -n 10 -o Probability/transontawe-d-$i/crossfile -f ./psi -r ../Projectors/Jgt0-5/RST$i/restart
#twprob84 -p 2000 -o Probability/transontawe-d-$i/probfile 0.00 100.00 cm-1 Probability/transontawe-d-$i/crossfile ./enerd ./enerd
done

cd ..
done

