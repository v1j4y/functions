BEGIN_PROVIDER [double precision, yrange, (npoints)]
    implicit none
    BEGIN_DOC
    ! calculate function ordinate
    END_DOC

    integer :: i

    do i=1,npoints
        yrange(i)=gaussian(i)
    enddo
END_PROVIDER
