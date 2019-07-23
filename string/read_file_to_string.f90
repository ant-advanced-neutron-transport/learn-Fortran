program read_file_to_string
  use iso_fortran_env
  implicit none

  character(:), allocatable :: s, file
  character(64) :: file_name

  write(output_unit,*) 'please input file name:'
  read(input_unit,*) file_name

  file = trim(adjustl(file_name))
  s = file_content(file)

  print*, 'The file content is as follows: '
  print*, s


contains
  !=============================================================================
  function file_content(this) result(string)
    !< Read a file as a single string stream.
    character(len=*), intent(in) :: this       !< File name.
    character(:),allocatable     :: string     !< The string.

    integer   :: unit       !< Logical unit.
    logical   :: exist      !< Check if file exist.
    integer   :: size   !< Size of the file.

    inquire(file=this, exist=exist)
    if (exist) then
      open(newunit=unit, file=this, access='stream', form='unformatted')
      inquire(file=this, size=size)
      allocate(character(len=size) :: string)
      read(unit=unit) string
      close(unit)
    else
      error stop "file "//this//" not found"
    endif

  end function file_content

end program read_file_to_string
