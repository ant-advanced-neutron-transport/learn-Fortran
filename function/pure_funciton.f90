!!> 纯函数指对输入参数以及外部其它数据都不进行修改的函数
program pure_function

  implicit none

  print*, "norm2([3.,4.]) = "
  print*, norm2([3.,4.])

contains
  pure function norm2(x)
    real, intent(in) :: x(:)
    real :: norm2

    norm2 = sqrt(dot_product(x,x))

  end function norm2


end program pure_function
