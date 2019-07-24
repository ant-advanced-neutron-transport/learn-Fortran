program determine_if_have_option

  implicit none

  if(have_option('-opt')) then
    print*, "Have option '-opt'"
  else
    print*, "No option '-opt'"
  endif

contains
  !=============================================================================
  function have_option(option) result(found)
    !< confirm if appear option
    character(*),intent(in) :: option
    logical   :: found

    integer :: argc
    character(64),allocatable :: argv(:) !< the max length of argument is 64
    integer :: i
    found = .false.

    argc = command_argument_count() !< number of argument
    if(argc /=0) then
      allocate(argv(argc))
    end if

    do i = 1,argc
      call get_command_argument(i,argv(i)) !< get argument
    end do

    do i = 1,argc
      if(option == trim(adjustl(argv(i)))) then
        found = .true.
        exit
      end if
    enddo

  end function have_option

end program determine_if_have_option
