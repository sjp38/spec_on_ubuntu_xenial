#!/bin/bash

if [ $# -ne 1 ];
then
	echo "Usage: $0 <mcf|omnetpp|...>"
	exit 1
fi

CALLEE_DIR=`dirname $0`
pushd $CALLEE_DIR > /dev/null

SPEC_DIR=spec_src

pushd $SPEC_DIR > /dev/null
source ./shrc
cp config/Example-linux64-amd64-gcc43.cfg ./config/config.cfg
logfile=`runspec --iterations 1 --size ref --action onlyrun --config config.cfg --noreportable $1 | grep "The log for this run is in " | awk '{print $8}'`
cat $logfile

popd > /dev/null

popd > /dev/null
