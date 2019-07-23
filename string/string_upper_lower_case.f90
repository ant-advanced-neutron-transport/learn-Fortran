program string_upper_lower_case

  implicit none

  character(*), parameter :: upper_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  character(*), parameter :: lower_ = 'abcdefghijklmnopqrstuvwxyz'

  print*, "upper case:"
  print*, "upper('This IS upper CaSe')"
  print*, upper('This IS upper CaSe')
  print*,
  print*, "lower case:"
  print*, "lower('This IS lower CaSe')"
  print*, lower('This IS lower CaSe')

contains
  !=============================================================================
  elemental function upper(this)
    !< Return a string with all lowercase characters.
    character(*), intent(in) :: this
    character(len(this))     :: upper

    integer :: n1, n2

    upper = this
    do n1=1, len(this)
      n2 = index(lower_, this(n1:n1))
      if (n2>0) upper(n1:n1) = upper_(n2:n2)
    enddo

  endfunction upper

  !=============================================================================
  elemental function lower(this)
  !< Return a string with all lowercase characters.
  character(*), intent(in) :: this
  character(len(this))     :: lower

  integer :: n1, n2

  lower = this
  do n1=1, len(this)
    n2 = index(upper_, this(n1:n1))
    if (n2>0) lower(n1:n1) = lower_(n2:n2)
  enddo

  endfunction lower

end program string_upper_lower_case
