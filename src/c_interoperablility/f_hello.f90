program f_hello
  use iso_c_binding
  implicit none

  integer :: ierr

  interface
    function hello_c() result(i) bind(C,name='hello_c')
      use iso_c_binding
      integer(c_int)::i
    end function hello_c
  end interface

  ierr = hello_c()

end program f_hello
