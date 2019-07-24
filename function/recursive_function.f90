program recursive_function

  implicit none

  integer :: n

  write(unit=*, fmt=*) 'please input an positive integer: '
  do
    read(*,*) n
    write(unit=*, fmt='(i0,a,i0)')  n, '! = ', fact(n)
  enddo

contains
  recursive function fact(n) result(r)
    !< return n!
    integer, intent(in) :: n
    integer :: r

    if(n<=0) then
      r = 1
    else
      r = n * fact(n-1)
    endif

  end function fact

end program recursive_function
