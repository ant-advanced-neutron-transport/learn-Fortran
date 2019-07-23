program string_index

  implicit none

  character(*), parameter :: s = '! this is a test string #'

  print*, "'"//s//"'"//" is start with '!'?"
  print*, start_with(s, '!')
  print*,
  print*, "'"//s//"'"//" is end with '#'?"
  print*, end_with(s, '#')

contains
  !=============================================================================
  pure function start_with(this, prefix)
    !< Return true if a string starts with a specified prefix.
    character(len=*), intent(in) :: this
    character(len=*), intent(in) :: prefix
    logical :: start_with

    start_with= .false.
    if (len(prefix)<=len(this)) then
       start_with = index(this, prefix)==1
    endif

  end function start_with
  !=============================================================================
  pure function end_with(this, suffix)
    !< Return true if a string end with a specified suffix.
    character(len=*), intent(in) :: this
    character(len=*), intent(in) :: suffix
    logical :: end_with

    end_with= .false.
    if (len(suffix)<=len(this)) then
       end_with = index(this, suffix, back = .true.)==(len(this) - len(suffix) + 1)
    endif

  end function end_with

end program string_index
