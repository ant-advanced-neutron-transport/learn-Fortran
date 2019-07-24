program get_option_value

  implicit none
  real    :: ropt
  integer :: iopt
  logical :: lopt, found

  found = .FALSE.
  call get_option('-r', ropt, found)
  if(found) then
    print*, "Have option '-r', the value is ", ropt
  else
    print*, "No option '-r'"
  endif

  found = .FALSE.
  call get_option('-i', iopt, found)
  if(found) then
    print*, "Have option '-i', the value is ", iopt
  else
    print*, "No option '-i'"
  endif

  found = .FALSE.
  call get_option('-l', lopt, found)
  if(found) then
    print*, "Have option '-l', the value is ", lopt
  else
    print*, "No option '-l'"
  endif

contains
  !=============================================================================
  subroutine get_option(option,arg,found)
    !< get option for integer, real, logical, character(*)
    character(*),intent(in)      :: option
    class(*),intent(out)         :: arg
    logical,intent(out),optional :: found

    integer :: argc
    character(32),allocatable :: argv(:)
    integer :: i
    logical :: found_

    found_ = .false.
    ! arg  = 0
    argc = command_argument_count()
    if(argc /=0) then
      allocate(argv(argc))
    end if


    do i = 1,argc
      call get_command_argument(i,argv(i))
    end do

    do i = 1,argc
      if(option == trim(adjustl(argv(i)))) then
        select type (arg)
        type is(integer)
          read(argv(i+1),*) arg
        type is(real)
          read(argv(i+1),*) arg
        type is(logical)
          read(argv(i+1),*) arg
        type is(character(*))
          read(argv(i+1),*) arg
        class default
            error stop "unknow option type"
        end select

        found_ = .true.
        exit
      end if
    enddo

    if(present(found)) found = found_

  end subroutine get_option

end program get_option_value
