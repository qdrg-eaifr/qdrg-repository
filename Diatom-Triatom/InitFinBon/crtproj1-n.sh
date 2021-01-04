#!/bin/bash
declare -i ip
#for i in 0 1 2 3 4 5 6 7 8 9; do
#for i in 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62; do 
for i in 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62; do
ip=$((10#$i+0))
concat84 -w -D ../InitFin1/globbis ../InitFin1/glob1bis/restart ../InitFin1/glob2c/rst0$i
#concat84 -w -D ../InitFin1/globbis ../InitFin1/glob1bis/restart ../InitFin1/glob2c/rst00$i
cat > geni1b.inp << EOF
#########################################################################
###           5D Diatom-Triatom Inelastic scattering (J=0)            ###
###       Rigid Rotor Approximation for the triatom and Diatom        ###
###                      Wigner-dvr and FFT                           ###
###               Generating the initial wavefunction                 ###
#########################################################################

RUN-SECTION
 name  = InitProj-n/RST$ip
 title = H2O-H2 inelastic scattering, rigid rotor, jacobi coordinates, initial functions
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
 R = 10
 theta,phi = 10
 be_h2o,ga_h2o,al_h2o = 10
end-sbasis-section

pbasis-section
 R      FFT     960  2.0   72.0
 theta  KLeg      3  all
 phi    k        -2   2
 be_h2o wigner    6  all   #17  33
 ga_h2o k        -5   5
 al_h2o k        -5   5
end-pbasis-section

INTEGRATOR-SECTION
 CMF     = 0.25, 1.0d-6
 RK8/spf = 4.0d-8, 0.1
 SIL/A   = 20, 4d-7 
END-INTEGRATOR-SECTION

INIT_WF-SECTION
 autoblock
 file = ../InitFin1/globbis/
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
 carbon_mass = 12.0,AMU
 oxygen_mass = 15.99491461959,AMU
 nitrogen_mass = 14.0030740048,AMU
 monomerA_mass = 2.0*hydrogen_mass+oxygen_mass
 monomerB_mass = 2.0*hydrogen_mass
 mass_total = monomerA_mass+monomerB_mass
 mass_R = monomerA_mass*monomerB_mass/mass_total
 #mass_R = 10.803787133,AMU         #au
 Arot = 27.8572, cm-1
 Brot = 14.5145, cm-1
 Crot =  9.2799, cm-1
 BH2rot = 59.2434, cm-1
 sp = 33.0
 omega = 0.0000373,au
 massomegasq = mass_R*omega^2
 j_cent = jtot^2/2.0/mass_R+jtot/2.0/mass_R
 END-PARAMETER-SECTION

 LABELS-SECTION
 well1d = q[sp]^2
 impul = Exp[1.60,53.0]^1
 END-LABELS-SECTION

HAMILTONIAN-SECTION
  ----------------------------------------------------------------------------------------------------------------
  modes                      | R        | be_h2o               | ga_h2o  | al_h2o  | theta           | phi
  ----------------------------------------------------------------------------------------------------------------
#  -0.5/mass_R                |1 q^-2    |2 j_ms                |4&6 cpp                      # These four lines Test
#  -0.5/mass_R                |1 q^-2    |5 j_p                 |4&6 cpp                      # should be        Test
#  -0.5/mass_R                |1 q^-2    |2 j_ps                |4&6 cmm                      # removed          Test
#  -0.5/mass_R                |1 q^-2    |5 j_m                 |4&6 cmm                      # for J=0          Test
#   1.0                       | KE       | 1                    | 1       | 1       | 1               | 1
#   j_cent                    | q^-2     | 1                    | 1       | 1       | 1               | 1
#   0.5/mass_R                | q^-2     | j^2                  | 1       | 1       | 1               | 1
#   0.5/mass_R                | q^-2     | 1                    | 1       | 1       | j^2             | 1
#  -1.0/mass_R                | q^-2     | 1                    | 1       | q       | 1               | q
#   0.5/mass_R                | q^-2     | j_ps                 | 1       | 1       | j_m             | 1
#   0.5/mass_R                | q^-2     | j_ms                 | 1       | 1       | j_p             | 1
#  -1.0/mass_R                | q^-2     | 1                    | 1       | q^2     | 1               | 1
#  -1.0/mass_R                | q^-2     | 1                    | 1       | 1       | 1               | q^2
  -----------------------------------------RR H2O-HCN KEO---------------------------------------------------------
   massomegasq/2.0           | well1d   | 1                    | 1       | 1       | 1               | 1         
   Brot/1.0                  | 1        | 1                    | q^2     | 1       | 1               | 1
  -Crot/4.0                  | 1        | jp^2                 | 1       | 1       | 1               | 1
   Arot/4.0                  | 1        | jp^2                 | 1       | 1       | 1               | 1
  -Crot/4.0                  | 1        | jm^2                 | 1       | 1       | 1               | 1
   Arot/4.0                  | 1        | jm^2                 | 1       | 1       | 1               | 1
   Arot/4.0                  | 1        | jpjm                 | 1       | 1       | 1               | 1
   Crot/4.0                  | 1        | jpjm                 | 1       | 1       | 1               | 1
   Arot/4.0                  | 1        | jmjp                 | 1       | 1       | 1               | 1
   Crot/4.0                  | 1        | jmjp                 | 1       | 1       | 1               | 1
   BH2rot/1.0                | 1        | 1                    | 1       | 1       | j^2             | 1
  ----------------------------------------------------------------------------------------------------------------
END-HAMILTONIAN-SECTION

HAMILTONIAN-SECTION_Imp
nodiag
  ----------------------------------------------------------------------------------------------------------------
  modes                      | R        | be_h2o               | ga_h2o  | al_h2o  | theta           | phi
  ----------------------------------------------------------------------------------------------------------------
  1.0                        | impul    | 1                    | 1       | 1       | 1               | 1
  ----------------------------------------------------------------------------------------------------------------
END-HAMILTONIAN-SECTION

END-OPERATOR

#******************************************************************************#
EOF
mctdh84 -mnd geni1b.inp
cp -r InitProj-n/RST$ip ../Scattering1/Projectors-n/
done

