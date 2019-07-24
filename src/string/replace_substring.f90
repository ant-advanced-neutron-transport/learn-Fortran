program replace_substring

  implicit none

  character(*), parameter :: s = 'this is a test, this test test repalce substrings in strings.'

  print*, 'the string is: '
  print*, s
  print*,
  print*, "replace(s, 'test', 'simple test')"
  print*, replace(s, 'test', 'simple test')
  print*,
  print*, "replace_all(s, 'test', 'tst')"
  print*, replace_all(s, 'string', 'character')

contains
  !=============================================================================
  elemental function replace(this, sub,rep) result(new)
    !< Return a string with first occurrences of substring sub replaced by rep.
    character(len=*), intent(in)          :: this
    character(len=*), intent(in)          :: sub
    character(len=*), intent(in)          :: rep
    character(len(this)-len(sub)+len(rep)):: new

    integer :: pos

    pos = index(string=this, substring=sub)

    if (pos>0) then

       if (pos==1) then

          new = rep//this(len(sub)+1:)
       else
          new = this(1:pos-1)//rep//this(pos+len(sub):)
       endif

    endif

  end function replace
  !=============================================================================
  function replace_all(this, sub, rep) result(new)
    !< Return a string with all occurrences of substring sub replaced by rep.
    character(len=*), intent(in) :: this
    character(len=*), intent(in) :: sub
    character(len=*), intent(in) :: rep
    character(len=:),allocatable :: new

    new = this

    do
       if(index(new,sub) > 0) then
          new = replace(new, sub, rep)
       else
          exit
       endif
    enddo

  end function replace_all

end program replace_substring
