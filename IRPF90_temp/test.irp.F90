! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

program irp_program                                                    ! test:   0
 call test                                                             ! test.irp.f:   0
 call irp_finalize_1625407493()                                        ! test.irp.f:   0
end program                                                            ! test.irp.f:   0
subroutine test                                                        ! test.irp.f:   1
  use yrange_mod
  use points_mod
    implicit none                                                      ! test.irp.f:   2
  character*(4) :: irp_here = 'test'                                   ! test.irp.f:   1
    integer :: i                                                       ! test.irp.f:   3
  if (.not.npoints_is_built) then
    call provide_npoints
  endif
  if (.not.yrange_is_built) then
    call provide_yrange
  endif
    do i=1,npoints                                                     ! test.irp.f:   4
        print *, yrange(i)                                             ! test.irp.f:   5
    enddo                                                              ! test.irp.f:   6
    call print                                                         ! test.irp.f:   7
end                                                                    ! test.irp.f:   8
