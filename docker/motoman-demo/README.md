# Yaskawa Motoman Demo

Runs ROS2 Yaskawa Motoman demo with moveit and Rviz.

## Build

```
docker build -t motoman .
```

## Run

Run with the default robot:
```
xhost local:
docker run --rm -it --net=host -e DISPLAY motoman
```

Run with gp8 robot:
```
docker run --rm -it --net=host -e DISPLAY motoman ros2 launch motoman_gp8_moveit_config demo.launch.py
```

