!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!                                                          !!!
!!!     Fortran program to sum transition probabilities      !!!
!!!          for specific rotational transition              !!!
!!!            Used for Atom-Triatom Collision               !!!
!!!                                                          !!!
!!!        Author: Steve Ndengue; Date: 06/04/2015           !!!
!!!                                                          !!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      program codesumfin
!
!
      integer            :: i, j, k, jtoti, jtotf, jtot, v, l
      real(8)            :: energy0, energy1, energy2, energy3 
      real(8)            :: proba1, proba2, vibnrj(16), proba0      
      real(8)            :: red_mass, delta, vibrotenergy, coeff
      character(7)       :: fn1
      character(9)       :: fn0, fn2
      character(3)       :: dmchar0
      integer, parameter :: npts=2001
      real(8), parameter :: ev2wn=8065.540106924d0
      real(8), parameter :: coeff_conv=0.006566174434186d0
!
!     Calculations of parameters
!     --------------------------
      mass_red=3.7523705333d0             ! Reduced mass in amu
      pi=dacos(-1d0)
      coeff=coeff_conv/mass_red
!     vibnrj=(/0.0,1082.0735,3226.0647,5342.7874,7438.1364,9491.3868, &
!            11462.1407,13763.9679,15130.8380,17351.7562,20782.5887/)
!
!     Open the input file and read it
!     -------------------------------
      open(777,file='inputjtot',status='unknown',position='rewind')
      read(777,*),jtoti,jtotf,v
!
!     Initialize the sum file
!     -----------------------
      fn0='sum-total'
      fn2='sum-dummy'
      open(unit=3,file=fn0,status='unknown',position='rewind')
      do i=1, npts
      write(3,'(2E20.12)'),0d0,0d0
      enddo
      close(3)
!
!     Weighted sum of probabilities for the various jtot
!     --------------------------------------------------
      k=700
      do jtot=jtoti, jtotf
      k=k+5
      write(dmchar0,'(I0)') jtot
      fn1='sum-'//dmchar0
      open(unit=k+0,file=fn0,status='unknown',position='rewind')
      open(unit=k+1,file=fn1,status='unknown',position='rewind')
      open(unit=k+2,file=fn2,status='unknown',position='rewind')
      do i=1, npts
      read (k+0,'(2E20.12)'),energy0,proba0
      read (k+1,'(2F20.12)'),energy1,proba1
      write(k+2,'(2E20.12)'),energy1,(2d0*jtot+1d0)*proba1+proba0
      enddo
      close(k+0)
      close(k+1)
      close(k+2)
!
      open(unit=k+0,file=fn0,status='unknown',position='rewind')
      open(unit=k+2,file=fn2,status='unknown',position='rewind')
      do i=1, npts
      read (k+2,'(2E20.12)'),energy2,proba2
      write(k+0,'(2E20.12)'),energy2,proba2
      enddo
      close(k+0)
      close(k+2)
      enddo
!
!     Writing in the good units
!     -------------------------
      open(unit=k+0,file=fn0,status='unknown',position='rewind')
      open(unit=k+2,file=fn2,status='unknown',position='rewind')
!     vibrotenergy=wn2ha*(vibnrj(v)+rot_const*dble(l**2+l))
      do i=1, npts
      read (k+2,'(2E20.12)'),energy2,proba2
      energy3=energy2     !-0.1250262d0
      !XS = 0 if energy < B*[j1*(j1+1)+j2*(j2+1)]      
!!    if((energy3*ev2ha)<(vibrotenergy))then
!!    write(k+0,'(2f20.12)'),energy3,0d0
!!    else
      if (energy3==0.0) then
      write(k+0,'(2E20.12)'),energy3,0.0d0
      else
      write(k+0,'(2E20.12)'),energy3,(coeff/(energy3/ev2wn))*proba2
      endif
!!    endif
      enddo
!
!
      end program codesumfin


      real(8) function delta(i,j)
      integer i, j
      delta=0d0
      if(i==j)delta=1d0
      end function delta
