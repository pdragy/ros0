# Kawasaki Demo

Runs Kawasaki demo with moveit and Rviz. Currently only available for ROS2 Humble.

## Build

```
docker build -t kawasaki .
```

## Run

```
xhost local:
docker run --rm -it --net=host -e DISPLAY kawasaki
```
