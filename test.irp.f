program test
    implicit none
    integer :: i
    do i=1,npoints
        print *, yrange(i)
    enddo
    call print
END
