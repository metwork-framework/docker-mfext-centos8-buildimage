FROM rockylinux:8

RUN yum -y install epel-release yum-utils
RUN yum-config-manager --enable powertools
RUN yum -y install openldap-devel createrepo wget bzip2 patch make cmake cmake3 ctags automake texinfo file gcc gcc-c++ gcc-gfortran python3 libtool bison flex flex-devel perl-XML-Parser swig gettext libjpeg-turbo freetype fontconfig jasper-libs zlib-devel bzip2-devel libjpeg-turbo-devel freetype-devel fontconfig-devel rpm-build xz xz-devel expat-devel bc which git nspr-devel nss-devel popt-devel elfutils-devel elfutils elfutils-libelf-devel elfutils-libelf elfutils-libs openblas-devel valgrind ncurses-devel gperf libX11-devel libXft-devel libXrender-devel libXext-devel pixman-devel libtirpc-devel rpcgen libaec-devel tcsh libXmu-devel libXt-devel libXaw-devel byacc imake gsl-devel libcurl-devel pcre-devel openssl-devel libev-devel sqlite-devel c-ares-devel glib2-devel json-c-devel libxml2-devel libxslt-devel oniguruma-devel libpng-devel libevent-devel graphviz-devel tcl-devel tk-devel && rpm -qa |sort |md5sum |awk '{print $1;}' >/etc/buildimage_hash

