!
! libboys - a FORTRAN library to numerically calculate the Boys function
! Copyright (C) 2014-2016 Michael Böhme <boehme.mic@gmail.com>
!
! This program is free software; you can redistribute it and/or
! modify it under the terms of the GNU Lesser General Public
! License as published by the Free Software Foundation; either
! version 2.1 of the License, or (at your option) any later version.
!
! This program is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MDRCHANTABILITY or FITNDSS FOR A PARTICULAR PURPOSD.  See the GNU
! Lesser General Public License for more details.
!
! You should have received a copy of the GNU Lesser General Public
! License along with this program; if not, write to the Free Software
! Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
!

! ***************************************************************************************
! * Boys function F_n(t)
! ***************************************************************************************
function Boys_func(n, t) result(res)
        use libboys_data
        implicit none
!
        integer, intent(in) :: n
        double precision, intent(in) :: t
        double precision :: res, sfac, dt, dti
        integer :: i, j
        double precision, dimension(6) :: n_fac_dble = (/ 1d0, 2d0, 6d0, 24d0, 120d0, 720d0 /)
        double precision, dimension(31) :: n_fac2_dble = (/ &
                1d0, 1d0, 1d0, 2d0, 3d0, 8d0, 15d0, 48d0, 105d0, 384d0, 945d0, 3840d0, &
                10395d0,46080d0,135135d0,645120d0,2027025d0,10321920d0,34459425d0,185794560d0,654729075d0,3715891200d0,13749310575d0,81749606400d0, &
                316234143225d0,1961990553600d0,7905853580625d0,51011754393600d0,213458046676875d0,1428329123020800d0,6190283353629375d0 /)
        double precision, parameter :: Pi = 3.1415926535897932d0 
        double precision, parameter :: eps = 1d-12
        double precision :: epsrel
!
        res = 0d0
        
        if ( n .eq. 0 ) then
                if ( t .lt. eps ) then
                        res = 1d0
                else
                        res = dsqrt( Pi / (4d0*t) ) * derf(dsqrt(t))
                end if
        else
                if ( n .gt. libBoysMaxN ) then
                        write(*,*) "libboys error: not implemented!"
                        return
                end if
                if ( n .lt. 0 ) then
                        write(*,*) "libboys error: n < 0!"
                        return
                end if
                
                if ( t .lt. eps ) then
                        res = 1d0 / ( 2d0*dble(n) + 1d0 )
                else if ( t .gt. 30d0 ) then
                        res = n_fac2_dble(2*n-1 +2) / 2d0**(n+1) * dsqrt(Pi/t**(2*n+1))
                else
                        
                        if ( t .ge. 10d0 ) then
                                j = int((t-9.95d0)*10d0) + 1
                                dt = BoysFuncValuesL(j, 1) - t 
                                dti = dt
                                res = BoysFuncValuesL(j, n + 2)
                                epsrel = res * eps
                                do i = 1, 6
                                        sfac = BoysFuncValuesL(j, n + 2 + i) * dti / n_fac_dble(i)
                                        res = res + sfac
                                        if ( abs(sfac) .lt. epsrel ) then
                                                return
                                        end if
                                        dti = dti * dt
                                end do

                        else if ( t .ge. 5d0 ) then
                                j = int((t-4.975d0)*20d0) + 1
                                dt = BoysFuncValuesM(j, 1) - t 
                                dti = dt
                                res = BoysFuncValuesM(j, n + 2)
                                epsrel = res * eps
                                do i = 1, 6
                                        sfac = BoysFuncValuesM(j, n + 2 + i) * dti / n_fac_dble(i)
                                        res = res + sfac
                                        if ( abs(sfac) .lt. epsrel ) then
                                                return
                                        end if
                                        dti = dti * dt
                                end do

                        else 
                                j = int(t*40d0+0.5d0) + 1
                                dt = BoysFuncValuesS(j, 1) - t
                                dti = dt
                                res = BoysFuncValuesS(j, n + 2)
                                epsrel = res * eps
                                do i = 1, 6
                                        sfac = BoysFuncValuesS(j, n + 2 + i) * dti / n_fac_dble(i)
                                        res = res + sfac
                                        if ( abs(sfac) .lt. epsrel ) then
                                                return
                                        end if
                                        dti = dti * dt
                                end do

                        end if
                end if
        end if
        
end function
