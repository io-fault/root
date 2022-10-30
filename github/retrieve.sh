#!/bin/sh
ROOT="$1"
BRANCH="${2:-master}"

clone_depth="--depth 1"
product_directories="python/fault integration/system development/meta"

get_repo ()
{
	local ghprefix root rpath ghprefix rname
	root="$1"
	rpath="$2"
	ghprefix="$3"
	ctx="$4"
	rname="$5"
	shift 5

	ghr="$ghprefix$rname"
	ri="https://github.com/io-fault/$ghr"
	path="$root/$rpath/$ctx/$rname"

	if test -d "$path"
	then
		echo "updating $ghr at $path"
		(cd "$path" && git pull -q gh "$BRANCH")
	else
		echo "cloning $ghr to $path"
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
	for x in $product_directories
	do
		if ! test -d "$x"
		then
			mkdir -p "$x"
		fi
	done
}

(setup_root_dir "$ROOT")

for x in $(cat products/py.txt)
do
	get_repo "$ROOT" python py- fault "$x" &
done
wait

for x in $(cat products/sys.txt)
do
	get_repo "$ROOT" integration sys- system "$x" &
done
wait

for x in $(cat products/meta.txt)
do
	get_repo "$ROOT" development meta- meta "$x" &
done
wait
