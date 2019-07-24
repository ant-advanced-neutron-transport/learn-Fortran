program fortran_execute_command_line

  implicit none

  character(:), allocatable :: cmd

  cmd = 'mkdir xx'
  call execute_command_line(cmd)


end program fortran_execute_command_line
