program get_cpu_time

  implicit none
  real :: t0, t1
  integer :: i, n

  call cpu_time(t0)

  do i = 2, 10000000
    n = 1**i
  enddo
  
  call cpu_time(t1)

  print*, 'CPU elapse time: ',t1-t0

end program get_cpu_time
