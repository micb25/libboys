#
# Makefile for boys_test
# 

TARGET = boys_test

# Compiler
FC=gfortran 
# Compiler flags
FLAGS=-m64 -cpp -ffixed-line-length-none -ffree-line-length-none -fdefault-integer-8 -finit-local-zero -Ofast -mtune=native -march=native -ffast-math -march=native -mfpmath=sse -msse2 -ffast-math -g 

default: 
	$(FC) $(FLAGS) boys_test.f90 -o $(TARGET) -L../ -lboys

clean:
	rm -f $(TARGET) *.mod *.o
