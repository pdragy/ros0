# Kuka Demo

Runs ROS2 Kuka demo with moveit and Rviz.

## Build

```
docker build -t kuka .
```

## Run

```
xhost local:
docker run --rm --privileged -it --net=host -e DISPLAY kuka
```
