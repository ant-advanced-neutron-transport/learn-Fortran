program get_all_command

  implicit none

  character(256) :: cmd

  call get_command(cmd)

  print*, 'The command are: ',trim(adjustl(cmd))

end program get_all_command
