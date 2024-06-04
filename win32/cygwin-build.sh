#!/bin/bash -x

DATESTAMP=$(date +'%Y%m%d-%H%M%S')
LOGFILE=$TMP/smbclient-cygwin-build.$DATESTAMP.log
BLDFLAGS="-g3 -O0 -Wno-error=char-subscripts"
cd `dirname $0`/..

# In Cygwin, remote smbfs shares are mounted using the 'mount' application

{
    echo ===================== BEGIN ======== $PWD

    rm -rf bin
    ./configure --disable-fault-handling --without-pam --without-ad-dc \
        --disable-python --without-gettext --without-cluster-support -v || exit 1

    make -w CFLAGS="'$BLDFLAGS'" CXXFLAGS="'$BLDFLAGS'" smbclient || exit 1
    make -w CFLAGS="'$BLDFLAGS'" CXXFLAGS="'$BLDFLAGS'" testparm || exit 1

    echo ===================== END ======== $PWD

} 2>&1 | tee $LOGFILE

echo ==================== Log saved in $LOGFILE
