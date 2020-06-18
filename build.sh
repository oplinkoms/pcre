#!/bin/bash

CUR_PATH=`pwd`
INSTALL_PATH=/usr/local/
MAKEFILE_DIRS="./Makefile"

####  check execute result
function return_val()
{
    val=`echo $?`
    if test $val -ne 0;then
        echo "#########  `pwd` is ERROR..."
        exit -1
    fi
}


if [ ! -f  "$MAKEFILE_DIRS" ]; then
    ./configure --prefix=$INSTALL_PATH;return_val
fi
    make clean
    make;return_val
    sudo make install;return_val
    echo "--------- finished install pcre"

### manual copy
### cp -pfr $INSTALL_PATH/include/libpcre* shasta/cfg/filesystem/usr/local/include
### cp -pfr $INSTALL_PATH/lib/libpcre*  shasta/cfg/filesystem/usr/local/lib

exit 0
