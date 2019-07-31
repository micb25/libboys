[![License](https://img.shields.io/github/license/micb25/libboys.svg)](LICENSE)
[![Issues](https://img.shields.io/github/issues/micb25/libboys.svg)](https://github.com/micb25/libboys/issues)

libboys
=======

This is the README for libboys, a FORTRAN90 library to numerically evaluate the Boys function F_n(x) [1]: 

![equation](http://latex.codecogs.com/gif.latex?F_n%28x%29%3D%5Cint_0%5E1t%5E%7B2n%7De%5E%7B-xt%5E2%7Ddt)

This function is needed for quantum chemical calculations to solve molecular integrals. However, there is no analytical solution to solve the Boys function (except for very specific cases). The accuracy of the numerical implementation in libboys is achieved by precalculated values and a recursive formula up to six orders.

Literature
----------

[1] S. F. Boys, *Proc R. Soc. Am.* **1950**, *200*, 542.

License
-------

The library was written by Michael Böhme and is licensed under GNU Lesser General Public License (LGPL). 
