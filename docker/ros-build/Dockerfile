ARG BASE_ROS_IMAGE=osrf/ros:humble-ros-base
FROM ${BASE_ROS_IMAGE}
RUN apt-get update && apt-get install -y checkinstall curl
RUN echo "deb http://ros0-repo.s3.us-west-2.amazonaws.com/$(lsb_release -is | tr A-Z a-z) $(lsb_release -cs) main" \
    > /etc/apt/sources.list.d/ros0.list
RUN curl -so /etc/apt/trusted.gpg.d/ros0.gpg https://raw.githubusercontent.com/pdragy/ros0/refs/heads/main/ros0.gpg
