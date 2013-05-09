BEGIN_PROVIDER [integer, npoints]
    BEGIN_DOC
    ! number of points
    END_DOC
    implicit none
    print *, 'npoints?'
    read (*,*)npoints
END_PROVIDER
