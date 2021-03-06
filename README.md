# fault.io Core Projects

This repository provides scripts for managing the installation or retrieval of the fault.io
projects using the repositories and packages available on github. Directly cloning repositories
is not advisable as the applicable set may change.

In the presented instructions, `/opt/fault` is used as the target directory.
However, any directory may be used as a target.

## Status

The projects installed by these scripts are not properly documented and are not likely
useful to anyone other than the author.

## Supported Platforms

Currently, Linux is not supported due to the absence of kqueue.

* FreeBSD
* macOS

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

An aggregate script combining retrieval and setup.

```shell
	./github/install.sh /opt/fault
```
