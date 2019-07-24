program convert_string_to_other_type

  implicit none

  print*, "convert string to logical:"
  print*, "to_logical(['yes','no ','off','on '])"
  print*, to_logical(['yes','no ','off','on '])
  print*,
  print*, "convert string to real:"
  print*, "to_real(['1000','1.e2','3.14'])"
  print*, to_real(['1000','1.e2','3.14'])
  print*,
  print*, "convert string to integer:"
  print*, "to_int(['1000','3,14'])"
  print*, to_int(['1000','3,14'])


contains
  !=============================================================================
  elemental function to_logical(this)
     !< convert string to logical
    character(*),intent(in) :: this
    logical :: to_logical

    to_logical = .false.
    select case (trim(adjustl(this)))
    case ('y','yes', 't', 'true', 'on')
      to_logical = .true.
    case ('n','no', 'f', 'false', 'off')
      to_logical = .false.
    case default
      to_logical = .false.
      ! error stop 'string "'//trim(adjustl(this))//'" is not a logical identification!'
    end select

  endfunction to_logical

  !=============================================================================
  elemental function to_int(this)
    !< convert string to integer
    character(*),intent(in) :: this
    integer :: to_int
    integer :: ios

    read(this, * ,iostat= ios) to_int
    ! if(ios /= 0) error stop "string "//this//" is not a integer number"

  endfunction to_int
  !=============================================================================
  elemental function to_real(this)
    !< convert string to real
    character(*),intent(in) :: this
    real    :: to_real
    integer :: ios

    read(this, * , iostat= ios) to_real
    ! if(ios /= 0) error stop 'string "'//str//'" is not a real number'

  endfunction to_real

end program convert_string_to_other_type
