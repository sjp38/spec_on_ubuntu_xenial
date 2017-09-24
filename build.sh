#!/bin/bash

BINDIR=`dirname $0`
pushd $BINDIR

SRC=spec_src

pushd $SRC/tools/src

sudo rm /bin/sh
sudo ln -s /bin/bash /bin/sh
if PERLFLAGS="-A libs=-lm -A libs=-ldl" ./buildtools
then
	echo "Build SUCCESS"
else
	echo "Build FAIL"
fi
sudo rm /bin/sh
sudo ln -s /bin/dash /bin/sh
popd

popd
