#!/bin/bash

BINDIR=`dirname $0`
pushd $BINDIR

SPECIMG=SPEC_CPU2006v1.1.iso
TMPMNT=tmnt
TARGET=spec_src

if [ ! -f $SPECIMG ]
then
	echo "SPEC CPU image $SPECIMG not found under $BINDIR/"
	exit 1
fi

mkdir $TMPMNT
sudo mount -o loop $SPECIMG ./$TMPMNT/
mkdir $TARGET
cp -R ./$TMPMNT/* $TARGET/
sudo umount ./$TMPMNT
rm -fr ./$TMPMNT/
sudo chown -R sjpark $TARGET/
sudo chmod -R 755 $TARGET/

popd
