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

int_product()
{
	cd "$1" || return
	"$FAULT_ROOT/bin/pdctl" index
	"$FAULT_ROOT/bin/pdctl" -x "$FAULT_ROOT/host/cc" integrate -u "$2"
}

(int_product ./development meta)
"$SCRIPTDIR/extensions/bind-devel.sh" "$FAULT_ROOT"
