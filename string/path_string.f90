program path_string

  implicit none

  character(*), parameter :: linux_path_separator_ = char(47) !< Unix/Linux directories separator (/).
  character(*), parameter :: backslash_ = char(92)

  character(:), allocatable :: s

  s  = '/root/fc/fc.f90'

  print*, 'the string is: '
  print*, s
  print*,
  print*, "file_dir(s)"
  print*, file_dir(s)
  print*,
  print*, "file_name(s)"
  print*, file_name(s)
  print*,
  print*, "file_base(s)"
  print*, file_base(s)
  print*,
  print*, "file_ext(s)"
  print*, file_ext(s)
  print*,

contains
  !=============================================================================
  function file_dir(this, sep)
    !< Return the directory name of a string containing a file name.
    character(*), intent(in)  :: this     !< The string.
    character(*), intent(in)  :: sep      !< Directory separator.
    character(:), allocatable :: file_dir !< Directory name.
    optional :: sep

    character(:), allocatable :: sep_     !< Separator, default value.
    integer                   :: pos      !< Character position.

    sep_ = linux_path_separator_
    if (present(sep)) sep_ = sep
    pos = index(this, sep_, back=.true.)
    if (pos>0) file_dir = this(1:pos-1)

  endfunction file_dir
  !=============================================================================
  function file_name(this, sep)
    !< Return file name
    character(*), intent(in)  :: this      !< The string.
    character(*), intent(in)  :: sep       !< Directory separator.
    character(:), allocatable :: file_name !< file name.
    optional :: sep

    character(:), allocatable :: sep_     !< Separator, default value.
    integer                   :: pos      !< Character position.

    sep_ = linux_path_separator_
    if (present(sep)) sep_ = sep
    pos  = index(this, sep_, back = .true.)
    file_name = this(pos+1:)

  end function file_name
  !=============================================================================
  function file_base(this, sep)
    !< Return file base name
    character(*), intent(in)  :: this      !< The string.
    character(*), intent(in)  :: sep       !< Directory separator.
    character(:), allocatable :: file_base !< Base file name.
    optional :: sep

    character(:), allocatable :: sep_      !< Separator, default value.
    integer :: st,ed

    sep_ = linux_path_separator_
    if (present(sep)) sep_ = sep
    st = index(this, sep_, back = .true.)
    ed = index(this, '.', back = .true.)
    file_base = this(st+1:ed-1)

  end function file_base
  !=============================================================================
  function file_ext(this)
    character(*), intent(in)  :: this     !< The string.
    character(:), allocatable :: file_ext !< Base file name.

    integer :: pos      !< Character position.

    pos  = index(this, '.', back = .true.)
    file_ext = this(pos+1:)

  end function file_ext

end program path_string
