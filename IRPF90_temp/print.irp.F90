! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

subroutine print                                                      ! print.irp.f:   1
  use yrange_mod
  use points_mod
    implicit none                                                     ! print.irp.f:   2
  character*(5) :: irp_here = 'print'                                 ! print.irp.f:   1
    integer :: i                                                      ! print.irp.f:   3
    double precision :: x                                             ! print.irp.f:   4
  if (.not.npoints_is_built) then
    call provide_npoints
  endif
  if (.not.yrange_is_built) then
    call provide_yrange
  endif
    open(unit=10,file='gaussian_plot',status='unknown')               ! print.irp.f:   5
    x=0.d0                                                            ! print.irp.f:   7
    do i=1,npoints                                                    ! print.irp.f:   8
        x=x+(.01d0)                                                   ! print.irp.f:   9
        write(10,*)x,yrange(i)                                        ! print.irp.f:  10
    enddo                                                             ! print.irp.f:  11
end                                                                   ! print.irp.f:  12
