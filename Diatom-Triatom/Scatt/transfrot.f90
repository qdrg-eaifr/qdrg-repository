!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!                                                          !!!
!!!   Fortran program to transform probabilities to mprob    !!!
!!!            Used for Triatom-Diatom Collision             !!!
!!!                                                          !!!
!!!        Author: Steve Ndengue; Date: 02/10/2018           !!!
!!!                                                          !!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      program transforming
!
!
      integer            :: i, j, k, l, isave, jtot, il, ih, i0
      real(8)            :: energy, value1, value2, proba
      real(8)            :: tab2(63), val
      real(8)            :: valinit, valprev, valcur
      integer, parameter :: npts=2001
      character(126)     :: line
      data tab2/1*0.00d0,3*23.79948d0,3*37.15834d0,3*42.4024d0, &
                5*70.132883714658d0,5*79.51324d0,5*95.24542d0, &
                5*135.322d0,5*136.587556285d0,7*136.889703584d0, &
                7*142.330898979d0,7*173.597554609d0,7*206.72044d0/
!
!     Open the input file and read it
!     -------------------------------
      open(222,file='fichier1',status='unknown',position='rewind')
      open(224,file='fichier2',status='unknown',position='rewind')
      open(226,file='fichier3',status='unknown',position='rewind')
!
!     Read input file
!     ---------------
      read(226,*),ih,il,jtot
      i0=max(ih,il)
      val=tab2(i0+1)
!
!     Read the first value
!     --------------------
      do i=1, 7
      read(222,*),line
      enddo
      read(222,*),energy,value1,valinit,proba
      rewind(222)
!
!     Read the files and skip the first information lines
!     --------------------------------------------------- 
      do i=1, 4
      read(222,*),line
      enddo
!
!     Transform from the prob to the mprob format
!     -------------------------------------------
      do i=1, npts
      read (222,*),energy,value1,value2,proba
      if((energy<val).or.(value2==valinit))then
      write(224,'(2F20.12)'),energy,0d0
      else if(proba> 1d0)then
      write(224,'(2F20.12)'),energy,1d0 
      else
      write(224,'(2F20.12)'),energy,proba
      endif
      enddo
!
!
      close(222)
      close(224)
      close(226)
!
!
      end program transforming
