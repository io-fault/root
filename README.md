# fault.io core projects

This repository provides scripts for managing the installation or retrieval of the fault.io
projects using the repositories and packages available on github. Directly cloning repositories
is not advisable as the applicable set may change.

In the presented instructions, `/opt/fault` is used as the target directory.
However, any directory may be used as a target.
The scripts presume ownership of the target directory.

# Supported Platforms

Currently Linux is not supported due to the absence of kqueue.

* FreeBSD
* macOS

Python 3.9 or higher is required.

# Fetch Root Repository

```shell
	# Modify as needed for suitable permissions.
	# root user execution is *not* required by installation.
	mkdir -p /opt/fault
	cd /opt/fault

	# Fetch this repository.
	git clone -b master --depth 1 https://github.com/io-fault/root
	cd root
```

# install.sh

An aggregate script combining retrieval and setup.

```shell
	./github/install.sh /opt/fault
```

# retrieve.sh

Script used to fetch shallow clones of the repository set into a directory structured for use:

```shell
	./github/retrieve.sh /opt/fault
```

# setup.sh

Script presuming that the target directory is a fault root directory.
Executes system/root/setup.sh in order to bootstrap and build the core tools.

```shell
	./github/setup.sh /opt/fault
```
