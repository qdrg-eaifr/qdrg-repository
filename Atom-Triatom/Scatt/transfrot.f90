!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!                                                          !!!
!!!   Fortran program to transform probabilities to mprob    !!!
!!!            Used for Atom-Triatom Collision               !!!
!!!                                                          !!!
!!!        Author: Steve Ndengue; Date: 06/04/2015           !!!
!!!                                                          !!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      program transforming
!
!
      integer            :: i, j, k, l, isave, jtot, i0
      real(8)            :: energy, value1, value2, proba
      real(8)            :: tab1(21), tab2(129), val
      real(8)            :: valinit, valprev, valcur
      integer, parameter :: npts=2001
      character(126)     :: line
      data tab1/1*0.00d0,1*0.4075859d0,1*0.8435908d0,1*0.8973001d0, &
                1*1.2180952d0,1*1.6050533d0,1*1.7661812d0, &
                1*2.4224320d0,1*2.7444495d0,1*3.0664512d0, &
                1*3.0741959d0,1*3.0788584d0,1*4.2969536d0, &
                1*4.3200370d0,1*6.6140499d0,1*6.6143030d0, &
                1*4.0081246d0,1*4.2587646d0,1*4.7940863d0, &
                1*5.9236641d0,1*5.9913870d0/
      data tab2/1*0.00d0,3*0.4075859d0,3*0.8435908d0,3*0.8973001d0, &
                5*1.2180952d0,5*1.6050533d0,5*1.7661812d0,&
                7*2.4224320d0,7*2.7444495d0,7*3.0664512d0, &
                5*3.0741959d0,5*3.0788584d0,7*4.2969536d0, &
                7*4.3200370d0,7*6.6140499d0,7*6.6143030d0, &
                9*4.0081246d0,9*4.2587646d0,9*4.7940863d0, &
                9*5.9236641d0,9*5.9913870d0/
!
!     Open the input file and read it
!     -------------------------------
      open(222,file='fichier1',status='unknown',position='rewind')
      open(224,file='fichier2',status='unknown',position='rewind')
      open(226,file='fichier3',status='unknown',position='rewind')
!
!     Read input file
!     ---------------
      read(226,*),i0,jtot
      if(jtot==0)then
      val=tab1(i0+1)
      endif
      if(jtot>0)then
      val=tab2(i0+1)
      endif
!
!     Read the first value
!     --------------------
      do i=1, 4
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
      if(energy<val)then
      write(224,'(2F20.12)'),energy,0d0
      else if(value2==valinit)then
      write(224,'(2F20.12)'),energy,0d0 
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
