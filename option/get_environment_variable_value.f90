program get_envrionment_variable_value

  implicit none

  character(256) :: path

  call get_environment_variable('PATH', path)

  print*, 'PATH: ', path

end program get_envrionment_variable_value
