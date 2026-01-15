# ABB Demo

Runs ABB demo with moveit and Rviz.

## Build

```
docker build -t abb .
```

## Run

```
xhost local:
docker run --rm -it --net=host -e DISPLAY abb
```

