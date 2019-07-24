!>> 通过 f2py 可以将 fortran 模块生成动态链接库，直接在 python 中使用。
!>> 通过以下命令生成动态库 func.so, 然后在 pyhton 使用该模块，并对该模块进行验证。

!>> f2py -c legendre.f90 -m func

!>> 然后在 Python 中可以使用 func.legendre.plm(lmx) 调用该模块中的函数

module legendre

  implicit none

  public :: plm

  private
contains
  !===========================================================================
  real pure function plm (l,m,x)
    !< Calculate the value of Associated Legendre Polynomial by recursion relation
    integer,intent(in) :: l, m
    real, intent(in) :: x

    real :: Pmm, Pmp1m, fact, x2
    integer :: i

    Pmm = 1.0
    if(m>=0) then
       fact = 1.0
       x2 = sqrt(1.0-x*x)
       do i=1,m
          Pmm = Pmm*(-fact)*x2
          fact=fact + 2.0
       end do
    endif

    Pmp1m=x*(2*m+1)*Pmm

    if(l==m)then
       Plm=Pmm
    elseif(l==m+1)then
       Plm=Pmp1m
    elseif( l>=m+2 ) then
       do i=m+2,l
          Plm=((2.0*i-1.0)*x*Pmp1m-(i+m-1.0)*Pmm)/(i-m)
          Pmm=Pmp1m
          Pmp1m=plm
       end do
    end if

  end function plm

end module legendre
