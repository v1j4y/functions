! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

subroutine provide_npoints
  use points_mod
  implicit none
  character*(15) :: irp_here = 'provide_npoints'
  integer                   :: irp_err 
  logical                   :: irp_dimensions_OK
 if (.not.npoints_is_built) then
  call bld_npoints
  npoints_is_built = .True.

 endif
end subroutine provide_npoints

subroutine bld_npoints
  use points_mod
    implicit none                                                    ! points.irp.f:   5
  character*(7) :: irp_here = 'npoints'                              ! points.irp.f:   1
    print *, 'npoints?'                                              ! points.irp.f:   6
    read (*,*)npoints                                                ! points.irp.f:   7
end subroutine bld_npoints
