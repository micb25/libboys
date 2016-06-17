!
! libBoys - a FORTRAN library to numerically calculate the Boys function
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

program boys_test
        implicit none
	double precision :: Boys_func
	integer :: n
	double precision :: t, res

        
        n = 5
        t = 5.35d0
        
        res = Boys_func(n, t)
        
        write(*,'(A,I1,A,F8.3,A,F16.8)') "F_", n, "(", t, ") = ", res
        
end program
