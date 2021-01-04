!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!                                                       !!!
!!! Fortran program to sum transition probabilities       !!!
!!!       for specific rotational transition              !!!
!!!                                                       !!!
!!!    Author: Steve Ndengue; Date: 09/12/2016            !!!
!!!                                                       !!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      program codesuminit
!
!
      integer, parameter::  npts=2001
      integer:: i, j, k, jot, v, l, lc, m, nstrt
      real(8):: energy0, energy1, energy2, proba0, proba1, proba2
      real(8):: dumm1, dumm2, dumm3

      character(19):: fn1
      character(70):: lgchar1
      character(7) :: fn0
      character(9) :: fn2
      character(3) :: dmchar0, dmchar1
      character(1) :: dmchar2, dmchar3p, dmchar4p, dmchar1p
      character(2) :: dmchar3l, dmchar4l
!
!     Open the input file and read it       
!     -------------------------------
      open(888,file='inputl',status='unknown',position='rewind')
      read(888,*),jtot,v
!     Select the correct l
      l=int(dble(v)/100)
      if (l==0)then
      write(dmchar1p,'(I0)') 0
      else
      write(dmchar1,'(I0)') v
      endif
!c!      if (jtot==0) then
!c!      lc=0
!c!      else
      lc=l
!c!      endif
!
!     Initialize the sum file
!     -----------------------
      write(dmchar0,'(I0)'),jtot
      fn0='sum-'//dmchar0
      open(unit=3,file=fn0,status='unknown',position='rewind')
      do i=1, npts
      write(3,'(2f20.12)'),0d0,0d0
      enddo
      close(3)
!
!     Write the probabilities files in a vector and sum immediately
!     -------------------------------------------------------------
      k=300
      fn0='sum-'//dmchar0
      fn2='sum-dummy'
!     print*,'fn0=',fn0
!     print*,'fn2=',fn2
      do m=1, 2*lc+1
      k=k+5
!
      if(l==0)then
        write(dmchar4p,'(I0)') m
        fn1='mprobfile00'//dmchar1p//'-'//dmchar4p//'-'//dmchar0
      else
        write(dmchar4p,'(I0)') m
        fn1='mprobfile'//dmchar1//'-'//dmchar4p//'-'//dmchar0
      endif
!
!     print*,'fn1=',fn1
      open(unit=k+0,file=fn0,status='unknown',position='rewind')
      open(unit=k+1,file=fn1,status='unknown',position='rewind')
      open(unit=k+2,file=fn2,status='unknown',position='rewind')
!
!!    rewind(k+1)
!!    do i=1, 7
!!    read(k+1,*),lgchar1
!!    enddo 
!
      do i=1, npts
!!    read (k+0,'(4f20.12)'),energy0,proba0
!!    read (k+1,'(4f20.12)'),energy1,proba1
      read (k+0,*),energy0,proba0
      read (k+1,*),energy1,proba1
!     write(3030,*),energy1,proba0,proba1
!     print*,'energy1=',energy1,'proba1=',proba1
!!      if(i.lt.nstrt)then
!!      write(k+2,'(2f20.12)'),energy1,proba0
!!      else
      write(k+2,'(2f20.12)'),energy1,proba0+proba1
!!      endif
      enddo
!
      close(k+0)
      close(k+1)
      close(k+2)
      open(unit=k+0,file=fn0,status='unknown',position='rewind')
      open(unit=k+2,file=fn2,status='unknown',position='rewind')
      do i=1, npts
      read (k+2,'(2f20.12)'),energy2,proba2
      write(k+0,'(2f20.12)'),energy2,proba2
      enddo
      close(k+0)
      close(k+2)
!
      enddo
!
!
      end program codesuminit
