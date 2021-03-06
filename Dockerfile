FROM centos:8

RUN yum -y install epel-release
RUN yum -y install createrepo wget bzip2 patch make cmake cmake3 automake file gcc gcc-c++ gcc-gfortran libtool bison flex perl-XML-Parser swig gettext libjpeg-turbo freetype fontconfig jasper-libs zlib-devel bzip2-devel libjpeg-turbo-devel freetype-devel fontconfig-devel rpm-build xz expat-devel bc which git nspr-devel nss-devel popt-devel elfutils-devel elfutils elfutils-libelf-devel elfutils-libelf elfutils-libs atlas-devel valgrind ncurses-devel libX11-devel libXft-devel libXrender-devel libXext-devel pixman-devel && rpm -qa |sort |md5sum |awk '{print $1;}' >/etc/buildimage_hash
