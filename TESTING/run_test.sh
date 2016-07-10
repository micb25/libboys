#!/bin/bash

make 
LD_LIBRARY_PATH=..:$LD_LIBRARY_PATH ./boys_test

