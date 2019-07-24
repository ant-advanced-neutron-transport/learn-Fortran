!!> block 结构可以在程序中定义新的变量，block中定义的变量的影响域只存在于该结构中
program block_structure

  implicit none

  real :: a

  a = 1.
  print*, "ahead block, a =",a

  block
    integer :: a
    a = 1
    print*, "in block, a =",a
  end block

  print*, "behind block, a =",a

end program block_structure
