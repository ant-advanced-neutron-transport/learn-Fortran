program get_wall_time

  implicit none

  real :: s
  s = wtime()
  print*, 'timer start'
  call sleep(1)
  print*, 'sleep 1 seconds'
  print*, 'time elapse ', wtime()

contains
  !=============================================================================
  real function wtime()
     logical, save :: started=.false.
     integer, save :: counter0, counter1, counter_rate
     real  :: secs

     wtime = -1.0

     if(.not.started) then
        call system_clock(counter0)
        wtime = 0.0
        started=.true.
     else
       call system_clock (counter1, counter_rate)
       secs=  real(counter1-counter0)/real(counter_rate)
       wtime=secs
     endif

  end function wtime

end program get_wall_time
