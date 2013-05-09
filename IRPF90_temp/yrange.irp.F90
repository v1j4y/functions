! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

subroutine provide_yrange
  use gaussian_mod
  use yrange_mod
  use points_mod
  implicit none
  character*(14) :: irp_here = 'provide_yrange'
  integer                   :: irp_err 
  logical                   :: irp_dimensions_OK
  if (.not.npoints_is_built) then
    call provide_npoints
  endif
  if (.not.gaussian_is_built) then
    call provide_gaussian
  endif
 if (allocated (yrange) ) then
  irp_dimensions_OK = .True.
  irp_dimensions_OK = irp_dimensions_OK.AND.(SIZE(yrange,1)==(npoints))
  if (.not.irp_dimensions_OK) then
   deallocate(yrange,stat=irp_err)
   if (irp_err /= 0) then
     print *, irp_here//': Deallocation failed: yrange'
     print *, ' size: (npoints)'
   endif
   if ((npoints>0)) then
    allocate(yrange(npoints),stat=irp_err)
    if (irp_err /= 0) then
     print *, irp_here//': Allocation failed: yrange'
     print *, ' size: (npoints)'
    endif
   endif
  endif
 else
   if ((npoints>0)) then
    allocate(yrange(npoints),stat=irp_err)
    if (irp_err /= 0) then
     print *, irp_here//': Allocation failed: yrange'
     print *, ' size: (npoints)'
    endif
   endif
 endif
 if (.not.yrange_is_built) then
  call bld_yrange
  yrange_is_built = .True.

 endif
end subroutine provide_yrange

subroutine bld_yrange
  use gaussian_mod
  use yrange_mod
  use points_mod
    implicit none                                                    ! yrange.irp.f:   2
  character*(6) :: irp_here = 'yrange'                               ! yrange.irp.f:   1
    integer :: i                                                     ! yrange.irp.f:   7
    do i=1,npoints                                                   ! yrange.irp.f:   9
        yrange(i)=gaussian(i)                                        ! yrange.irp.f:  10
    enddo                                                            ! yrange.irp.f:  11
end subroutine bld_yrange
