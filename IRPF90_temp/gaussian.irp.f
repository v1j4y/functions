BEGIN_PROVIDER [double precision, gaussian, (npoints)]
    implicit none
    BEGIN_DOC
    ! the GTO
    END_DOC

    double precision :: x
    integer :: i

    x=0.d0
    do i=1,npoints
        x+=.01d0
        gaussian(i)=x**(order)*exp(-alpha*(x**2))
    enddo
END_PROVIDER

BEGIN_PROVIDER [double precision, order]
&BEGIN_PROVIDER [double precision, alpha]
    implicit none
    BEGIN_DOC
    ! provide order and alpha
    END_DOC

    print *, 'order?'
    read (*,*)order

    print *, 'alpha?'
    read (*,*)alpha
END_PROVIDER
