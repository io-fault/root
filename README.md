# fault.io Projects

This repository provides scripts for managing the installation or retrieval of the fault.io
projects using the repositories and packages available on github. Directly cloning repositories
is not advisable as the applicable set may change.

In the presented instructions, `/opt/fault` is used as the target directory.
However, any directory may be used as a target.

## Status

The projects installed by these scripts are not properly tested or documented and are not likely
to be useful.

## Platforms

* macOS
* FreeBSD
* Linux

With FreeBSD and Linux only being occasionally tested.
Python 3.9 or higher is required.

## Environment

```shell
	mkdir -p /opt/fault
	cd /opt/fault
```

## Fetching this Repository

```shell
	git clone -b master --depth 1 https://github.com/io-fault/root
	cd root
```

## Installation

An aggregate script combining retrieval and setup at the target location.

```shell
	./github/install.sh /opt/fault
```
