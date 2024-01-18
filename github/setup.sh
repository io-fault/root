#!/bin/sh
SCRIPTDIR="$(cd `dirname "$0"`/..; pwd)"
SETUP="./integration/system/root/setup.sh"
cd "$1"
FAULT_ROOT="$(pwd)"

if test x"$FAULTPYTHON" = x""
then
	"$SETUP"
else
	"$SETUP" "$FAULTPYTHON"
fi
