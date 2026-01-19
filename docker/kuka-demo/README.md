# ABB Demo

Runs ROS2 ABB demo with moveit and Rviz.

## Build

```
docker build -t abb .
```

## Run

```
xhost local:
docker run --rm -it --net=host -e DISPLAY abb
```

## Extra

ROS Jazzy will require `--privileged` at run time:

```
docker build --build-arg BASE_ROS_IMAGE=osrf/ros:jazzy-desktop-full -t abb-jazzy .
docker run --rm -it --privileged --net=host -e DISPLAY abb-jazzy
```

