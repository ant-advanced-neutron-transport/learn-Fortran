program read_file_line_to_string
  use iso_fortran_env
  implicit none

  character(:), allocatable :: s
  integer :: unit, ios, nl
  character(64) :: file_name

  write(output_unit,*) 'please input file name:'
  read(input_unit,*) file_name

  open(newunit=unit, file=trim(file_name), iostat=ios)
  if ( ios /= 0 ) stop "Error opening file "

  nl = 0
  do
    nl = nl + 1
    s = file_line_content(unit,ios=ios)
    print*, nl, s
    if(is_iostat_end(ios)) exit
  enddo

  close(unit)

contains
  !=============================================================================
  function file_line_content(unit, form, ios) result(line)
    !< Read line from a connected unit.
    integer,      intent(in)  :: unit
    character(*), intent(in)  :: form  !< Format of unit.
    character(:), allocatable :: line  !< Line storage.
    integer, intent(out)      :: ios
    optional :: form, ios

    character(:), allocatable :: form_
    integer    :: ios_ !< IO status code, local variable.
    character  :: ch   !< Character storage.

    form_ = 'formatted' ; if (present(form)) form_ = form
    line = ''
    select case(form_)
    case('formatted')
       do
          read(unit, "(a)", advance='no', iostat=ios_) ch
          if(is_iostat_eor(ios_)) exit
          if(is_iostat_end(ios_)) exit
          line = line//ch
       enddo
    case('unformatted')
       do
          read(unit, iostat=ios_) ch
          if(is_iostat_end(ios_)) exit
          if (ch==new_line('a')) then
             ios_ = iostat_eor
             exit
          endif
          line = line//ch
       enddo
    endselect
    if(present(ios)) ios = ios_

  endfunction file_line_content

end program read_file_line_to_string
