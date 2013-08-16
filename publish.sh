#!/bin/bash

###############################################################################
#
# symlinks files provided on command line or all in this dir to target (~),
# prepending dot.
#
# DESTRUCTIVE: UNDERSTAND BEFORE USING!!
#
###############################################################################

df=$*

if [ "x$df" = "x" ] ; then
	df=`find . -path './.git' -prune -o \! -type d \! -executable -printf '%P '`
fi

echo $df

target=~
if [ ! -d $target ] ; then
	echo "target $target is not a directory" 1>&2
	exit 127
fi

backup=$target/bak
if [ ! -d $backup ] ; then
	mkdir $backup
fi

here=`pwd`

for f in $df ; do
	cp -H -v $target/.$f $backup
	ln -f -v -s $here/$f $target/.$f
done

