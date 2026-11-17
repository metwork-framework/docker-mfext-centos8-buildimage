#!/bin/bash
if [ ! -f "/usr/lib64/pkgconfig/gmp.pc" ]; then
LIBDIR=/usr/lib64
INCLUDEDIR=/usr/include
VERSION=`rpm -qi gmp | grep Version | cut -d: -f2`
echo -e "prefix=/usr\n\
exec_prefix=/usr\n\
libdir=/usr/lib64\n\
includedir=/usr/include\n\
\n\
Name: gmp
URL: https://gmplib.org
Description: GNU Multiple Precision Arithmetic Library
Version: ${VERSION}\n\
Libs: -L${LIBDIR} -lgmp\n\
Cflags: -I${INCLUDEDIR}\n" > /usr/lib64/pkgconfig/gmp.pc
fi
