program join_string

  implicit none

  character(10), allocatable :: chars(:)
  integer :: i

  chars = ['this', 'is  ','a   ','test']
  print*, 'characters is:'
  print*, ("'"//chars(i)//"',", i = 1, size(chars))
  print*, 'join(chars):'
  print*, join(chars)
  print*,
  print*, "join(chars,sep=','):"
  print*, join(chars,sep=',')

contains
  !=============================================================================
  function join(words, sep) result(this)
    !< Return the string that is the join of an array of characters.
    character(len=*), intent(in)  :: words(1:)
    character(len=*), intent(in)  :: sep
    character(len=:), allocatable :: this
    optional :: sep

    character(len=:), allocatable :: lsep

    integer :: i

    lsep = ' '
    if (present(sep)) lsep = sep

    this = ''

    do i=2, size(words,1)
       if (trim(words(i))/='') this = this//lsep//trim(adjustl(words(i)))
    enddo

    if (words(1)/='') then
       this = trim(adjustl(words(1)))//this
    else
       this = this(len(lsep)+1:len(this))

    endif

  end function join

end program join_string
