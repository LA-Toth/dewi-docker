DEWI: A set of commands and a framework
=======================================

This repository contains the sources of the docker images.

Versions (tags)
---------------

* latest: created from the master branches of the DEWI repositories
* X, X.Y, X.Y.Z: created from published versions of the DEWI repositories

Both type can be used as a framework, too.

The versions are the docker image versions, no direct relationship with the DEWI
module versions.

The actual versions are in the directories ``X.x/versions`` files, like ``1.x/versions``.

Build
-----

The repository root contains the ``build.sh`` which builds every image
and tags them with ``dewi:VERSION`` like ``X.Y.Z``, and also with the image name
defined in the root's ``name`` file, default: ``latoth/dewi``. Also the latest versions:

Initially these are the actual versions;

* dewi:1.0.0
* latoth/dewi:1
* latoth/dewi:1.0
* latoth/dewi:1.0.0
* dewi:latest
* latoth/dewi:latest
