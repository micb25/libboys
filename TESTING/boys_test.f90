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
        integer :: n, io_error, nv
        double precision :: t, res, tv, mv, deps
        
        write(*,*) "-----------------------------------------------------------------------------------------------"
        write(*,'(A5,4A22)') "N", "X", "calc. value", "ref. value", "diff"
        write(*,*) "-----------------------------------------------------------------------------------------------"
        
        open(unit=20,file='benchmark.values',status='old',action='read',iostat=io_error)
        if ( io_error .eq. 0 ) then
        
                do
                        read(20,*,iostat=io_error) nv, tv, mv
                        if ( io_error .ne. 0 ) then
                                exit
                        end if
                        
                        res = Boys_func(nv, tv)
                        write(*,'(I5,4F22.16)') nv, tv, res, mv, res-mv
                end do
        else
                write(*,*) "Error! Can't open 'benchmark.values'!"
        end if
        
        close(unit=20)
        
        write(*,*) "-----------------------------------------------------------------------------------------------"
                
end program
