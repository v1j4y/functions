subroutine print
    implicit none
    integer :: i
    double precision :: x
    open(unit=10,file='gaussian_plot',status='unknown')

    x=0.d0
    do i=1,npoints
        x+=.01d0
        write(10,*)x,yrange(i)
    enddo
END
