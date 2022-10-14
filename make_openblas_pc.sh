#!/bin/bash
if [ ! -f "/usr/lib64/pkgconfig/openblas.pc" ]; then
VERSION=`rpm -qi openblas | grep Version | cut -d: -f2`
echo -e "prefix=/usr\n\
exec_prefix=/usr\n\
libdir=/usr/lib64\n\
includedir=/usr/include\n\
Name: openblas
URL: https://github.com/xianyi/OpenBLAS
Description: OpenBLAS is an optimized BLAS (Basic Linear Algebra Subprograms) library based on GotoBLAS2 1.13 BSD version.
Version: ${VERSION}\n\
Libs: -L${libdir} -lopenblas\n\
Cflags: -I${includedir}/openblas\n" > /usr/lib64/pkgconfig/openblas.pc
fi
