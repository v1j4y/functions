! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

subroutine provide_gaussian
  use gaussian_mod
  use points_mod
  implicit none
  character*(16) :: irp_here = 'provide_gaussian'
  integer                   :: irp_err 
  logical                   :: irp_dimensions_OK
  if (.not.npoints_is_built) then
    call provide_npoints
  endif
  if (.not.order_is_built) then
    call provide_order
  endif
 if (allocated (gaussian) ) then
  irp_dimensions_OK = .True.
  irp_dimensions_OK = irp_dimensions_OK.AND.(SIZE(gaussian,1)==(npoints))
  if (.not.irp_dimensions_OK) then
   deallocate(gaussian,stat=irp_err)
   if (irp_err /= 0) then
     print *, irp_here//': Deallocation failed: gaussian'
     print *, ' size: (npoints)'
   endif
   if ((npoints>0)) then
    allocate(gaussian(npoints),stat=irp_err)
    if (irp_err /= 0) then
     print *, irp_here//': Allocation failed: gaussian'
     print *, ' size: (npoints)'
    endif
   endif
  endif
 else
   if ((npoints>0)) then
    allocate(gaussian(npoints),stat=irp_err)
    if (irp_err /= 0) then
     print *, irp_here//': Allocation failed: gaussian'
     print *, ' size: (npoints)'
    endif
   endif
 endif
 if (.not.gaussian_is_built) then
  call bld_gaussian
  gaussian_is_built = .True.

 endif
end subroutine provide_gaussian

subroutine bld_gaussian
  use gaussian_mod
  use points_mod
    implicit none                                                  ! gaussian.irp.f:   2
  character*(8) :: irp_here = 'gaussian'                           ! gaussian.irp.f:   1
    double precision :: x                                          ! gaussian.irp.f:   7
    integer :: i                                                   ! gaussian.irp.f:   8
    x=0.d0                                                         ! gaussian.irp.f:  10
    do i=1,npoints                                                 ! gaussian.irp.f:  11
        x=x+(.01d0)                                                ! gaussian.irp.f:  12
        gaussian(i)=x**(order)*exp(-alpha*(x**2))                  ! gaussian.irp.f:  13
    enddo                                                          ! gaussian.irp.f:  14
end subroutine bld_gaussian
subroutine provide_order
  use gaussian_mod
  implicit none
  character*(13) :: irp_here = 'provide_order'
  integer                   :: irp_err 
  logical                   :: irp_dimensions_OK
 if (.not.order_is_built) then
  call bld_order
  order_is_built = .True.

 endif
end subroutine provide_order

subroutine bld_order
  use gaussian_mod
    implicit none                                                  ! gaussian.irp.f:  19
  character*(5) :: irp_here = 'order'                              ! gaussian.irp.f:  17
    print *, 'order?'                                              ! gaussian.irp.f:  24
    read (*,*)order                                                ! gaussian.irp.f:  25
    print *, 'alpha?'                                              ! gaussian.irp.f:  27
    read (*,*)alpha                                                ! gaussian.irp.f:  28
end subroutine bld_order
