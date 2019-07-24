!!> 逐元函数是指参数为标量的函数同样适用于数组参数，对数组中每一个都按照标量执行
program elemental_function

  implicit none

  print*, "double(2.) = "
  print*, double(2.)
  print*, "double([1.,2.,3.]) = "
  print*, double([1.,2.,3.])

contains
  elemental function double(x)
    real, intent(in) :: x
    real :: double
    double = 2.*x
  end function double


end program elemental_function
