!>> Elapsed time in seconds since the start of program execution.
program get_elapse_time

  implicit none

  real :: t(2), r
  integer :: i,j

  do i = 1,10000000
    j = 1**i
  enddo

  call etime(t,r)

  print*, 'time elapse ', r


end program get_elapse_time
