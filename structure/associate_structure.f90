!!> 使用 associate 对变量进行重命名。
program associate_structure

  implicit none

  real :: a
  a = 1.

  associate(b=>a)
    print*, b
  end associate

end program associate_structure
