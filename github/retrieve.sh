#!/bin/sh
ROOT="$1"
BRANCH="${2:-master}"

clone_depth="--depth 1"

get_repo ()
{
	local repo root rpath ctx rname
	repo="$1"
	root="$2"
	rpath="$3"
	ctx="$4"
	shift 4

	ri="https://github.com/io-fault/$repo"
	path="$root/$rpath/$ctx"

	if test -d "$path"
	then
		echo "updating $ri at $path"
		(cd "$path" || exit; git stash -q; git clean -fd; git pull -q gh "$BRANCH")
	else
		echo "cloning $ri to $path"
		git clone -o gh -q -b "$BRANCH" $clone_depth "$ri" "$path"
	fi
}

setup_root_dir ()
{
	local root
	root="$1"
	shift 1

	if ! test -d "$root"
	then
		mkdir -p "$root" || return
	fi

	cd "$root" || return
	for x in "$@"
	do
		if ! test -d "$x"
		then
			mkdir "$x"
		fi
	done
}

(setup_root_dir "$ROOT" python integration interface)
get_repo python "$ROOT" python fault &
get_repo integration "$ROOT" integration system &
get_repo terminal "$ROOT" interface terminal &
wait
