ARG BASE_ROS_IMAGE=osrf/ros:humble-desktop-full
FROM ${BASE_ROS_IMAGE}
RUN echo "deb http://ros0-repo.s3.us-west-2.amazonaws.com/$(lsb_release -is | tr A-Z a-z) $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros0.list
RUN curl -so /etc/apt/trusted.gpg.d/ros0.gpg https://raw.githubusercontent.com/pdragy/ros0/refs/heads/main/ros0.gpg
RUN apt update && apt install -y \
    #ros-$ROS_DISTRO-industrial-core \
    ros-$ROS_DISTRO-motoman \
    ros-$ROS_DISTRO-motoman-moveit-config \
    ros-$ROS_DISTRO-motoros2-interfaces \
    ros-$ROS_DISTRO-moveit-configs-utils \
    ros-$ROS_DISTRO-moveit-planners \
    ros-$ROS_DISTRO-moveit-ros-move-group \
    ros-$ROS_DISTRO-moveit-ros-visualization \
    ros-$ROS_DISTRO-moveit-simple-controller-manager
CMD ["ros2", "launch", "motoman_gp180_moveit_config", "demo.launch.py"]
