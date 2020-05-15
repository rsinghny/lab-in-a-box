#!/bin/sh

TARFILE=$1
LOGFOLDER=$2

if [ -z $TARFILE ]; then
	echo "Need to pass tarfile in ./setup.sh TARFILENAME LOGFOLDER, if calling from makefile make sure you do \"make run TARFILE=file.tgz LOGFOLDER=/path/to/log/folder\""
	exit 1
fi

if [ -z $LOGFOLDER ]; then
        echo "Need to pass LOGFOLDER in ./setup.sh TARFILENAME LOGFOLDER, if calling from makefile make sure you do \"make run TARFILE=file.tgz LOGFOLDER=/path/to/log/folder\""
        exit 1
fi


tar -zxf $TARFILE

mkdir -p $LOGFOLDER
