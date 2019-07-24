!!> 纯函数指对输入参数以及外部其它数据都不进行修改的函数
program pure_function

  implicit none

  print*, "my_norm2([3.,4.,sqrt(11.)]) = "
  print*, my_norm2([3.,4.,sqrt(11.)])
  print*,
  print*, "norm2([3.,4.,sqrt(11.)]) = "
  print*, norm2([3.,4.,sqrt(11.)])

contains
  pure function my_norm2(x)
    real, intent(in) :: x(:)
    real :: my_norm2

    my_norm2 = sqrt(dot_product(x,x))

  end function my_norm2


end program pure_function
