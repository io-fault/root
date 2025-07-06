#!/bin/sh
SCRIPTDIR="$(cd `dirname "$0"` && pwd)"
sh "$SCRIPTDIR/retrieve.sh" "$1"
sh "$SCRIPTDIR/setup.sh" "$1"
