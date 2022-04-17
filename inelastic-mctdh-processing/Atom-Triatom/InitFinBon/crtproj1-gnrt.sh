#!/bin/bash
declare -i ip
for i in 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83; do
ip=$((10#$i+0))
concat84 -w -D ../InitFin/globbis ../InitFin/glob1bis/restart ../InitFin/glob3/rst0$i
cat > geni1b.inp << EOF
#########################################################################
###               4D Atom-Triatom Inelastic scattering                ###
###       Rigid Rotor Approximation for the triatom and Diatom        ###
###                      Wigner-dvr and FFT                           ###
###               Generating the initial wavefunction                 ###
#########################################################################

RUN-SECTION
 name  = InitProj-gnrt/RST$ip
 title = CH3CHCH2O-He inelastic scattering, rigid rotor, jacobi coordinates, initial functions
 geninwf split-rst steps gridpop
 usepthreads=4
 tfinal =100.0  tout = all tpsi=0.01
end-run-section

PARAMETER-SECTION
  jtot  = 0
  sl0_1 = 0
  sl0_2 = 0
  slz_1 = 0
  slz_2 = 0
end-parameter-section

OPERATOR-SECTION
  opname = geni1b
end-operator-section

sbasis-section
 r = 30
 be_mol,ga_mol,al_mol = 30
end-sbasis-section

pbasis-section
 r      FFT     768  4.0   40.0
 be_mol wigner   40  all   
 ga_mol exp      79  2pi
 al_mol k        -5   5
end-pbasis-section

INTEGRATOR-SECTION
 CMF     = 0.25, 1.0d-6
 RK8/spf = 4.0d-8, 0.1
 SIL/A   = 20, 4d-7 
END-INTEGRATOR-SECTION

INIT_WF-SECTION
 autoblock
 file = ../InitFin/globbis/
 OPERATE = Imp
end-init_wf-section

end-input
EOF

cat > geni1b.op << EOF
                ### ------ OPERATOR FILE ------ ###

 OP_DEFINE-SECTION
 TITLE
 H2O-HCN Hamiltonian Operator, J>0, rigid rotor approximation
 END-TITLE
 END-OP_DEFINE-SECTION
 PARAMETER-SECTION
 hydrogen_mass = 1.0,H-mass
 oxygen_mass = 15.99491463,AMU
 argon_mass = 39.962384,AMU
 mass_r = 3.7443879,AMU         #au
 atomA_mass  = hydrogen_mass   # mass of atom A in molecule A-B-C
 atomB_mass  = oxygen_mass     # mass of atom B in molecule A-B-C
 atomC_mass  = hydrogen_mass   # mass of atom C in molecule A-B-C

 Arot = 0.601213, cm-1
 Brot = 0.222893, cm-1
 Crot = 0.198517, cm-1
 j_cent = jtot^2/2.0/mass_r+jtot/2.0/mass_r

 sp = 30.0
 omega = 0.0000373,au
 massomegasq = mass_r*omega^2
 END-PARAMETER-SECTION

 LABELS-SECTION
 well1d = q[sp]^2
 impul = Exp[2.20,30.0]^1
 END-LABELS-SECTION

HAMILTONIAN-SECTION
----------------------------------------------------------
  modes            | r       | be_mol  | ga_mol  | al_mol
----------------------------------------------------------
#  1.0              | KE      | 1       | 1       | 1
#------------------System Angular KEO----------------------
#  j_cent           | q^-2    | 1       | 1       | 1
#  0.5/mass_r       | q^-2    | j^2     | 1       | 1
# -1.0/mass_r       | q^-2    | 1       | 1       | q^2
#  0.5/mass_r       | q^-2    | jpms    | 1       | 1
-----------------------RR MOL KEO-------------------------
-Brot/1.0          | 1       | 1       | dq^2    | 1
-Crot/4.0          | 1       | jp^2    | 1       | 1
 Arot/4.0          | 1       | jp^2    | 1       | 1
-Crot/4.0          | 1       | jm^2    | 1       | 1
 Arot/4.0          | 1       | jm^2    | 1       | 1
 Arot/4.0          | 1       | jpjm    | 1       | 1
 Crot/4.0          | 1       | jpjm    | 1       | 1
 Arot/4.0          | 1       | jmjp    | 1       | 1
 Crot/4.0          | 1       | jmjp    | 1       | 1
---------------------Potential Energy---------------------
 massomegasq/2.0   | well1d  | 1       | 1       | 1 
----------------------------------------------------------
END-HAMILTONIAN-SECTION

HAMILTONIAN-SECTION_Imp
nodiag
-----------------------------------------------------------
  modes            | r       | be_mol  | ga_mol  | al_mol  
-----------------------------------------------------------
  1.0              | impul   | 1       | 1       | 1      
-----------------------------------------------------------
END-HAMILTONIAN-SECTION

END-OPERATOR

#******************************************************************************#
EOF
mctdh84 -mnd geni1b.inp
cp -r InitProj-gnrt/RST$ip ../Scattering/Projectors-gnrt/
done

