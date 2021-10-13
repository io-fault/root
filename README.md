# fault.io core projects

This repository provides scripts for managing the installation or retrieval of the fault.io
projects using the repositories and packages available on github. Directly cloning repositories
is not advisable as the applicable set may change.

In the presented instructions, `/opt/fault` is used as the target directory.
However, any directory may be used as a target.
The scripts presumes ownership of the target directory.

# Supported Platforms

Currently Linux is not supported due to lack of kqueue support.

* FreeBSD
* macOS

Python 3.9 or higher is required.

# install.sh

An aggregate script combining retrieval and setup.

```shell
	sh ./install.sh /opt/fault
```

# retrieve.sh

Script used to fetch shallow clones of the repository set into a directory structured for use:

```shell
	sh ./retrieve.sh /opt/fault
```

# setup.sh

Script presuming that the target directory is a fault root directory.
Executes system/root/setup.sh in order to bootstrap and build the core tools.

```shell
	sh ./setup.sh /opt/fault
```
