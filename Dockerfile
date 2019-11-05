FROM ros:kinetic-robot
RUN apt-get update
RUN apt-get install -y ros-kinetic-joy ros-kinetic-teleop-twist-joy ros-kinetic-teleop-twist-keyboard ros-kinetic-laser-proc ros-kinetic-rgbd-launch ros-kinetic-depthimage-to-laserscan ros-kinetic-rosserial-arduino ros-kinetic-rosserial-python ros-kinetic-rosserial-server ros-kinetic-rosserial-client ros-kinetic-rosserial-msgs ros-kinetic-amcl ros-kinetic-map-server ros-kinetic-move-base ros-kinetic-urdf ros-kinetic-xacro ros-kinetic-compressed-image-transport ros-kinetic-rqt-image-view ros-kinetic-gmapping ros-kinetic-navigation ros-kinetic-interactive-markers
RUN /bin/bash -c '. /ros_entrypoint.sh'
RUN mkdir -p ~/catkin_ws/src
WORKDIR /root/catkin_ws/src
RUN git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
RUN git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
RUN /bin/bash -c '. /opt/ros/kinetic/setup.bash; cd ~/catkin_ws; catkin_make;'
WORKDIR /root
RUN echo "source /root/catkin_ws/devel/setup.bash" >> ~/.bashrc
