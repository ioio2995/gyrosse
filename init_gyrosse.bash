#!/bin/bash
# Bash script for setup gyrosse env
# Author: Lionel ORCIL - github.com/ioio2995
#
# Specify the path of the directory to check
src_dir="./src"

# Check if the directory exists
if [ ! -d "$src_dir" ]; then
    # If the directory does not exist, create it
    mkdir -p "$src_dir"
    echo "The directory $src_dir has been created."
else
    echo "The directory $src_dir already exists."
fi
vcs import ./$src_dir < ./gyrosse.repos
wget https://raw.githubusercontent.com/ros-controls/control.ros.org/master/ros_controls.$ROS_DISTRO.repos -O ./ros_controls.repos
vcs import ./$src_dir < ./ros_controls.repos
rosdep update --rosdistro=$ROS_DISTRO
sudo apt update
rosdep install  --from-paths ./$src_dir --ignore-src -r -y