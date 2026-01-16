#!/bin/sh

ROBOT=rs007l-b001

# Launch the controllers in the background
nohup ros2 launch khi_hardware khi_bringup.launch.py robot:=$ROBOT simulation:=true &

# Launch moveit and rviz
ros2 launch khi_moveit khi_moveit.launch.py robot:=$ROBOT

