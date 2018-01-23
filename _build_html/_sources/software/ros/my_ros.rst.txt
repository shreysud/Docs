My Personal Build
******************

Packages required for ``MAVS``
==============================
as of 8/22/2017 on top of ros-kinetic-full:
::

  sudo apt-get install ros-kinetic-controller-manager
  sudo apt-get install ros-kinetic-joint-state-controller
  sudo apt-get install ros-kinetic-effort-controllers
  sudo apt-get install ros-kinetic-teleop-twist-keyboard
  sudo apt-get install ros-kinetic-pointcloud-to-laserscan
  sudo apt-get install ros-kinetic-velodyne-description


Packages used in my catkin_ws
================================
as of 8/22/2017 on top of ros-kinetic-full:
::

  sudo apt-get install ros-kinetic-move-base
  sudo apt-get install ros-kinetic-gmapping
  sudo apt-get install ros-kinetic-amcl
  sudo apt-get install ros-kinetic-ackermann-msgs
  sudo apt-get install ros-kinetic-transmission-interface
  sudo apt-get install ros-kinetic-moveit-ros-move-group
  sudo apt-get install ros-kinetic-robotnik-sensors
  sudo apt-get install ros-kinetic-robot-pose-ekf
  sudo apt-get install ros-kinetic-moveit-kinematics
  sudo apt-get install ros-kinetic-moveit-ros-visualization
  sudo apt-get install ros-kinetic-moveit-planners-ompl
  sudo apt-get install ros-kinetic-teb-local-planner
  sudo apt-get install ros-kinetic-joint-limits-interface
  sudo apt-get install ros-kinetic-map-server
  sudo apt-get install ros-kinetic-robot-state-publisher
  sudo apt install ros-kinetic-rqt

To use `Autoware <https://github.com/CPFL/Autoware>`_
-------------------------------------------------------
added:
::
  sudo apt-get install ros-kinetic-nmea-msgs ros-kinetic-nmea-navsat-driver ros-kinetic-sound-play ros-kinetic-jsk-visualization ros-kinetic-grid-map ros-kinetic-gps-common
  sudo apt-get install ros-kinetic-controller-manager ros-kinetic-ros-control ros-kinetic-ros-controllers ros-kinetic-gazebo-ros-control ros-kinetic-joystick-drivers
  sudo apt-get install libnlopt-dev freeglut3-dev qtbase5-dev libqt5opengl5-dev libssh2-1-dev libarmadillo-dev libpcap-dev gksu libgl1-mesa-dev libglew-dev python-wxgtk3.0


  sudo apt install ros-kinetic-roslint
  sudo apt-get install ros-kinetic-joint-state-publisher
  sudo apt-get install ros-kinetic-controller-manager


my ``.bashrc``
===================
sourced:
::

  source /opt/ros/kinetic/setup.bash
  source /home/febbo/Documents/workspace/tutorials/catographer_ws/install_isolated/setup.bash
  source /home/febbo/Documents/workspace/tutorials/velodyne_simulator/devel/setup.bash
  source /home/febbo/Documents/workspace/tutorials/kobuki_desktop/devel/setup.bash
  source /home/febbo/.julia/v0.6/MAVs/catkin_ws/devel/setup.bash
  source /home/febbo/Documents/workspace/tutorials/mastering_ros/chapter_3_codes/devel/setup.bash
  source /home/febbo/catkin_ws/devel/setup.bash
  alias tf='cd /var/tmp && rosrun tf view_frames && evince frames.pdf &'
  . ~/.bash_profile
  source /home/febbo/ros_catkin_ws/install_isolated/setup.bash
