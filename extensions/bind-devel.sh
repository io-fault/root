#!/bin/sh
FAULT_ROOT="$1"
shift 1

PYD="$FAULT_ROOT/python"
SYS="$FAULT_ROOT/integration"
DEV="$FAULT_ROOT/development"

bind_factor()
{
	"$FAULT_ROOT/bin/fault-tool" python .module \
		system.python.bin.bind \
		-ioptimal "-F$PYD/fault" "-L$SYS" "-L$DEV" \
		"$FAULT_ROOT/bin/$1" "$2"
}

bind_factor "wkctl" "meta.workspaces.bin.control"
bind_factor "sy" "meta.syntax.bin.editor"
