#!/bin/sh

# Usage: run.sh <robot_name>
#
# Start the kawasaki robot simulation and moveit.
#
# rs007l-b001,rs013n-a001,rs015x-a001,rs025n-a001,rs080n-a001,bx300l-b001,bxp135x-a001

ROBOT=${1:-none}

# Launch the controllers in the background
nohup ros2 launch khi_hardware khi_bringup.launch.py robot:=$ROBOT simulation:=true &

# Launch moveit and rviz
ros2 launch khi_moveit khi_moveit.launch.py robot:=$ROBOT

