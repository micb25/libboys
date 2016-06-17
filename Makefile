#
# Makefile for libBoys
# 

TARGET = libboys.so

# Compiler
FC=gfortran 
# Compiler flags
FLAGS=-m64 -cpp -ffixed-line-length-none -ffree-line-length-none -fdefault-integer-8 -finit-local-zero -Ofast -mtune=native -march=native -ffast-math -march=native -mfpmath=sse -msse2 -ffast-math -g -fPIC 

# Linker
LD=ld
# Linker flags
LDFLAGS=-shared -fPIC -Wl,-soname,libboys.so

default: 
	$(FC) $(FLAGS) -c libboys_data.f90
	$(FC) $(FLAGS) -c libboys.f90
	$(FC) $(LDFLAGS) -o $(TARGET) libboys_data.o libboys.o 

clean:
	rm -f $(TARGET) *.mod *.o


