subroutine irp_finalize_1625407493
 use print_mod
 use points_mod
 use yrange_mod
 use gaussian_mod
  if (allocated(gaussian)) then
    gaussian_is_built = .False.
    deallocate(gaussian)
  endif
  if (allocated(yrange)) then
    yrange_is_built = .False.
    deallocate(yrange)
  endif
end
