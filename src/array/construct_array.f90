program construct_array

  implicit none

  real, allocatable :: iv(:), im(:,:)
  integer :: i

  iv = (/1.,2./)
  print*, 'iv = ', iv

  iv = [1.,2.,3.]
  print*, 'iv = ', iv

  iv = (/(real(i),i=1,4)/)
  print*, 'iv = ', iv

  iv = [(real(i),i=1,6)]
  print*, 'iv = ', iv

  im = reshape(iv,[2,3])
  print*, 'im = '
  do i = 1,size(im, dim=1)
    print*,  im(i,:)
  enddo

end program construct_array
