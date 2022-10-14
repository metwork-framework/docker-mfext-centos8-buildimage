#!/bin/bash
if [ ! -f "/usr/lib64/pkgconfig/openblas.pc" ]; then
LIBDIR=/usr/lib64
INCLUDEDIR=/usr/include
VERSION=`rpm -qi openblas | grep Version | cut -d: -f2`
echo -e "prefix=/usr\n\
exec_prefix=/usr\n\
libdir=/usr/lib64\n\
includedir=/usr/include\n\
\n\
Name: openblas
URL: https://github.com/xianyi/OpenBLAS
Description: OpenBLAS is an optimized BLAS (Basic Linear Algebra Subprograms) library based on GotoBLAS2 1.13 BSD version.
Version: ${VERSION}\n\
Libs: -L${LIBDIR} -lopenblas\n\
Cflags: -I${INCLUDEDIR}/openblas\n" > /usr/lib64/pkgconfig/openblas.pc
fi
