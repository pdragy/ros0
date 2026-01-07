# ros0

ros zero

## Install a ROS package

On Debian based linux, it's easy to configure apt to use ros0-repo packages. For example, to install the `ros-distro-example` package:
```
echo "deb http://ros0-repo.s3.us-west-2.amazonaws.com/$(lsb_release -is | tr A-Z a-z) $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros0.list
curl -so /etc/apt/trusted.gpg.d/ros0.gpg https://raw.githubusercontent.com/pdragy/ros0/refs/heads/main/ros0.gpg
apt-get update
apt-get install ros-distro-example
```

Browse the public build farm at [ros0.cloudv0.com](https://ros0.cloudv0.com) to download package artifacts, view package contents and fingerprints.

## Organization

- [**ros0**]() (this repo):
Contains jenkins configuration, main readme, public gpg key for the ros0 package repository, ros0 build container definition
- [**ros0-library**](https://github.com/pdragy/ros0-library) 
A jenkins shared library which can be used to build a .deb package. Contains the .deb build script, and the core build routine.
- [**ros0-pipelines**](https://github.com/pdragy/ros0-pipelines) 
The top level build definitions for each project, one file per project.

## Docker

- ros0-build: Defines the base build container for building packages. To build locally, pass the `BASE_ROS_IMAGE` argument to docker build.
- deb-s3: Container definition for package deployment
- jenkins: configuration for the build farm (see [docker/jenkins/README.md](./docker/jenkins/README.md)

The ros0-build containers are also publicly available at Dockerhub, under the `roszero/ros` repository.
```
To install ros0 packages in a debian based Dockerfile, reference the build Dockerfile definition (docker/ros-build/Dockerfile):
```
RUN echo "deb http://ros0-repo.s3.us-west-2.amazonaws.com/$(lsb_release -is | tr A-Z a-z) $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros0.list
RUN curl -so /etc/apt/trusted.gpg.d/ros0.gpg https://raw.githubusercontent.com/pdragy/ros0/refs/heads/main/ros0.gpg
RUN apt update
```

## Contributing

If there are any problems (missing dependencies, something not working correctly), or if there is any package or distro you want to see added, feel free to open an issue or PR.

## WARNING

These packages are experimental, and are not meant to be used in any kind of production setting. Although checks are made to prevent any shadowing or conflict with official osrf packages, testing is limited. Dependency resolution is also not guaranteed, and additional runtime system dependencies may need to be installed.
