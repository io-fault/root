#!/bin/sh
SETUP="./integration/system/root/setup.sh"
cd "$1"

if test x"$FAULTPYTHON" = x""
then
	"$SETUP"
else
	"$SETUP" "$FAULTPYTHON"
fi

# Development is not handled by root/setup.sh
cd ./development
../bin/pdctl integrate
