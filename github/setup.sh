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

int_product ()
{
	"$FAULT_ROOT/bin/pdctl" -D "$1" -x "$FAULT_ROOT/host/cc" integrate -U "$2"
}

(int_product ./development meta)
"$SCRIPTDIR/extensions/bind-devel.sh" "$FAULT_ROOT"
