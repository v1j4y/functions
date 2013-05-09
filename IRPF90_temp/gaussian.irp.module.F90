! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

module gaussian_mod
  double precision :: alpha 
  double precision, allocatable :: gaussian (:)
  logical :: gaussian_is_built = .False.
  double precision :: order 
  logical :: order_is_built = .False.
end module gaussian_mod
