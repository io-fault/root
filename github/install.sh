#!/bin/sh
scripts="$(dirname "$0")"
sh "$scripts/retrieve.sh" "$1"
sh "$scripts/setup.sh" "$1"
