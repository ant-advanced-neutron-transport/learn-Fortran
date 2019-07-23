program split_string

  implicit none

  type str_t
    character(:), allocatable :: raw
  end type str_t

  type(str_t), allocatable :: subs(:)
  integer :: i

  character(*), parameter :: s = 'this is a test, this test test split strings.'
  print*, 'the string is: '
  print*, s
  print*,

  print*, 'call split(s, subs):'
  call split(s, subs)
  do i = 1, size(subs)
    print*, subs(i)%raw
  enddo

  print*,
  print*, "call split(s, subs,','):"
  call split(s, subs,',')
  do i = 1, size(subs)
    print*, subs(i)%raw
  enddo

contains
  !=============================================================================
  subroutine split(this, words, sep, nwords)
    !< Return a list of words in the string
    character(len=*), intent(in)         :: this
    type(str_t),allocatable,intent(out)  :: words(:)
    character(len=*), intent(in)  :: sep
    integer, intent(out)          :: nwords

    optional :: sep, nwords

    character(1),parameter :: space = ' '
    character(1),parameter :: table = char(9)

    character(:),allocatable :: str_tmp, lsep

    integer :: i,c,n

    lsep  = space
    if(present(sep)) lsep = sep

    str_tmp = replace_all(trim(adjustl(this)), table ,lsep)
    str_tmp = str_tmp//lsep

    n = num_substring(str_tmp, lsep)

    allocate(words(n))

    do i = 1,n
       c = index(str_tmp,lsep)
       words(i)%raw = str_tmp(1:c-1)
       str_tmp = trim(adjustl(str_tmp(c+1:)))//lsep
    end do

    if(allocated(str_tmp))  deallocate(str_tmp)
    if(present(nwords)) nwords = n

  end subroutine split
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

end program split_string
