program determine_string_type

  implicit none

  print*, 'string is logical? '
  print*, "is_logical(['y', 't','n', 'f','x']): "
  print*,  is_logical(['y', 't','n', 'f','x'])
  print*,
  print*, 'string is real? '
  print*, "is_real(['1000','3.14','1.e5']):"
  print*, is_real(['1000','3.14','1.e5'])
  print*,
  print*, 'string is integer?'
  print*, "is_int(['1.0','100','1e2']):"
  print*, is_int(['1.0','100','1e2'])


contains
  !=============================================================================
  elemental function is_logical(this)
    !< Return true if the string is a logical variable
    character(*),intent(in):: this
    logical :: is_logical

    is_logical = .false.
    select case (trim(adjustl(this)))
    case ('y', 'yes','t', 'true', 'on', 'n', 'no', 'f', 'false', 'off')
      is_logical = .true.
    end select

  endfunction is_logical
  !=============================================================================
  elemental function is_int(this)
    !< Return true if the string is a integer
    character(*),intent(in)   :: this
    logical                   :: is_int

    integer :: ios  !< The iostat of I/O
    integer :: int

    is_int = .false.
    read(this, * ,iostat= ios) int
    if(ios== 0) is_int = .true.

  endfunction is_int
  !=============================================================================
  elemental function is_real(this)
    !< Return true if the string is a real.
    character(*), intent(in) :: this
    logical                  :: is_real

    integer :: ios  !< The iostat of I/O
    real    :: r

    is_real = .false.
    read(this, * ,iostat= ios) r
    if(ios== 0) is_real = .true.

  endfunction is_real

end program determine_string_type
