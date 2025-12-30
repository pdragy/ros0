# ros0

ros zero

# Install a ROS package

On Debian based linux, it's easiest to configure apt to use ros0-repo ppa repository. For example, to install `ros-<distro>-<package>` in the terminal:
```
echo "deb http://ros0-repo.s3.us-west-2.amazonaws.com/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros0.list
curl -so /etc/apt/trusted.gpg.d/ros0.gpg https://raw.githubusercontent.com/pdragy/ros0/refs/heads/main/ros0.gpg
apt-get update
apt get install ros-<distro>-<package>
```
Or, browse the public build farm at [ros0.cloudv0.com](https://ros0.cloudv0.com) to download package artifacts, view package contents and fingerprints.

# Organization

- [**ros0**]() (this repo):
Contains jenkins configuration, main readme, public gpg key for the ros0-repo ppa, ros0 build container definition
- [**ros0-library**](https://github.com/pdragy/ros0-library) 
A jenkins shared library which can be used to build a .deb package. Contains the .deb build script, and the core build routine.
- [**ros0-pipelines**](https://github.com/pdragy/ros0-pipelines) 
The top level build definitions for each project, one file per project.

# Docker

The containers are used to build the ros0 projects. To build these locally, pass the `BASE_ROS_IMAGE` build argument to reference which ROS base image. For example, for `jazzy-desktop-full`:
```
$ cd docker/ros-build
$ docker build --build-arg BASE_ROS_IMAGE=osrf/ros:jazzy-desktop-full -t jazzy .
```
Images are also hosted in DockerHub, under the `roszero` name. For example, to pull the remote image and get a terminal in ROS humble-desktop-full:
```
$ docker run --rm -it roszero/ros:humble-desktop-full bash
```
To install ros0 packages in your own debian based Dockerfile, reference the build Dockerfile definition (docker/ros-build/Dockerfile):
```
RUN echo "deb http://ros0-repo.s3.amazonaws.com/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros0.list
RUN  curl -so /etc/apt/trusted.gpg.d/ros0.gpg https://raw.githubusercontent.com/pdragy/ros0/refs/heads/main/ros0.gpg
RUN apt update
```

# Contributing

If you run into any problems (missing dependencies, something not working correctly), or if there is any package or distro you want to see added, feel free to open an issue or PR. 

# WARNING

These packages are experimental, and are not meant to be used in any kind of production setting. Although checks are made to prevent any shadowing or conflict with official osrf packages, testing is limited. Dependency resolution is also not garanteed, and you may need to install additional system dependencies.
