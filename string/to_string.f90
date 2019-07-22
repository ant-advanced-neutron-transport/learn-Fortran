program to_string

  implicit none

  print*, 'convert integer to string: '
  print*, 'to_str(1) = '//to_str(1)
  print*,
  print*, 'convert real to string:'
  print*, 'to_str(1.0) = '//to_str(1.0)
  print*,
  print*, 'convert real to string with format:'
  print*, "to_str(1.0,'(f12.6)') = "//to_str(1.0,'(f12.6)')
  print*,
  print*, 'convert logical to string'
  print*, "to_str(.TRUE.) = "//to_str(.TRUE.)

contains
  function to_str(value,fmt) result(s)
    class(*), intent(in) :: value
    character(*), intent(in) :: fmt
    character(:), allocatable :: s
    optional :: fmt

    character(:), allocatable :: lfmt
    character(32) :: ls

    lfmt = '(g0)'
    if(present(fmt)) lfmt = fmt

    select type(v=>value)
    type is(integer)
      write(ls, lfmt) v
    type is(real)
      write(ls, lfmt) v
    type is(logical)
      write(ls, lfmt) v
    end select

    s = trim(adjustl(ls))

  end function to_str

end program to_string
