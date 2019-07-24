program determine_num_substring

  implicit none
  character(*), parameter :: s = 'this is a test, this test test number of substring in a string.'

  print*, 'the string is: '
  print*, s
  print*, "number of 'test' in the string: "
  print*, num_substring(s, 'test')

  print*, "number of blank space in the string: "
  print*, num_substring(s)

contains
  !=============================================================================
  pure function num_substring(this,sub) result(rst)
    !< count the word `sub` in `this`
    character(*), intent(in):: this
    character(*), intent(in):: sub
    optional :: sub

    character(:), allocatable :: lsub
    integer :: rst
    integer :: n1,n2

    lsub = ' '
    if(present(sub)) lsub = sub

    rst = 0
    if (len(lsub)>len(this)) return

    n1 = 1
    do
       n2 = index(string=this(n1:), substring=lsub)
       if (n2 > 0) then
          rst = rst + 1
          n1 = n1 + n2 + len(lsub)
       else
          exit
       endif
    enddo

  endfunction num_substring


end program determine_num_substring
