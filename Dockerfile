FROM rockylinux:8.5

ENV DCO_CRONIE_START=1 \
    S6_KEEP_ENV=1 \
    S6_BEHAVIOUR_IF_STAGE2_FAILS=1

RUN cp -R /usr/lib64/libjson-c.so.4.0.0 /usr/lib64/libjson-c.so.4.0.0.ori
RUN yum -y install epel-release yum-utils
RUN yum-config-manager --enable powertools
RUN dnf module -y enable javapackages-tools
#RUN dnf module -y enable subversion-devel #useful for utf8proc-devel
RUN yum -y install openldap-devel createrepo wget bzip2 patch make cmake cmake3 ctags automake texinfo file gcc gcc-c++ gcc-gfortran python3 libtool bison flex flex-devel perl-XML-Parser swig gettext libjpeg-turbo freetype fontconfig jasper-libs zlib-devel bzip2-devel libjpeg-turbo-devel freetype-devel fontconfig-devel rpm-build xz xz-devel expat-devel bc which git nspr-devel nss-devel popt-devel elfutils-devel elfutils elfutils-libelf-devel elfutils-libelf elfutils-libs openblas-devel valgrind ncurses-devel gperf libX11-devel libXft-devel libXrender-devel libXext-devel pixman-devel libtirpc-devel rpcgen libaec-devel tcsh libXmu-devel libXt-devel libXaw-devel byacc imake gsl-devel libcurl-devel pcre-devel libev-devel c-ares-devel glib2-devel json-c-devel libxml2-devel libxslt-devel oniguruma-devel libpng-devel libevent-devel graphviz-devel tcl-devel tk-devel libtiff-devel openjpeg2-devel jasper-devel cairo-devel fribidi-devel harfbuzz-devel pango-devel gdbm-devel librsvg2-devel libffi-devel autoconf-archive antlr-C++ antlr-tool uwsgi-plugin-common uwsgi-devel libcap-devel rust cargo perl-IPC-Cmd perl-Pod-Html && rpm -qa |sort |md5sum |awk '{print $1;}' >/etc/buildimage_hash
ADD make_openblas_pc.sh /root
RUN chmod +x /root/make_openblas_pc.sh && /root/make_openblas_pc.sh
RUN yum -y install initscripts vim coreutils-common cronie
RUN mv /usr/lib64/libjson-c.so.4.0.0 /usr/lib64/libjson-c.so.4.0.0.new && cp -R /usr/lib64/libjson-c.so.4.0.0.ori /usr/lib64/libjson-c.so.4.0.0
COPY root /
RUN /build/s6_overlay.sh && \
    yum clean all && \
    rm -Rf /build

ENTRYPOINT ["/init"]

