program error_file_line

  implicit none

  print*, 'this is an error in ',__FILE__,' at line ',__LINE__

end program error_file_line

! compile: gfortran -cpp .
