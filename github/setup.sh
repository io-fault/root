#!/bin/sh
SETUP="./integration/system/root/setup.sh"
cd "$1"
FAULT_ROOT="$(pwd)"

if test x"$FAULTPYTHON" = x""
then
	"$SETUP"
else
	"$SETUP" "$FAULTPYTHON"
fi
