#!/bin/sh

ROBOT=iiwa7 # [iiwa7, iiwa14, med7, med14]

# Launch the controllers in the background
nohup ros2 launch lbr_bringup mock.launch.py model:=$ROBOT &

#gazebo
#ros2 launch lbr_bringup gazebo.launch.py model:=$ROBOT

# Launch moveit and rviz
ros2 launch lbr_bringup move_group.launch.py mode:=mock rviz:=true model:=$ROBOT
