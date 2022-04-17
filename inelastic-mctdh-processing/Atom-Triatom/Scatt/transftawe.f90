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
      integer            :: i, j, k, l, isave
      real(8)            :: energy, value1, value2, proba 
      real(8)            :: tab1(10), tab2(46), val, ev2wn
      integer, parameter :: npts=2001
      character(126)     :: line
      data  tab1/1*0.00d0,1*0.4075859d0,1*0.8435908d0,1*0.8973001d0, &
                 1*1.218095201502d0,1*1.6050533d0,1*1.7661812d0, &
                 2.422431999106d0,2.744449496929d0,3.066451173499/
      data  tab2/1*0.00d0,3*0.4075859d0,3*0.8435908d0,3*0.8973001d0, &
                 5*1.218095201502d0,5*1.6050533d0,5*1.7661812d0, &
                 7*2.422431999106d0,7*2.744449496929d0,7*3.066451173499/
      ev2wn=8065.540106924d0
      tab1=tab1/ev2wn
      tab2=tab2/ev2wn
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
!     Read the files and skip the first information lines
!     --------------------------------------------------- 
      do i=1, 7
      read(222,*),line
      enddo
!
!     Transform from the prob to the mprob format
!     -------------------------------------------
      do i=1, npts
      read (222,*),energy,value1,value2,proba
      if(energy<val)then
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
