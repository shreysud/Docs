Installation of `gazebo_ros_pkgs <http://gazebosim.org/tutorials?tut=ros_installing&ver=1.9%2B&cat=connect_ros>`_
=======================================================================================================================


From Pre-Built Debians:
------------------------

For ROS kinetic
^^^^^^^^^^^^^^^^^
::

  sudo apt-get install ros-kinetic-gazebo-ros-pkgs ros-kinetic-gazebo-ros-control


Gazebo 8 and ROS kinetic (preferred)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
remove all Gazebo and ros binaries:
::

  sudo apt-get remove '.*gazebo.*' '.*sdformat.*' '.*ignition-math.*' '.*ignition-msgs.*' '.*ignition-transport.*'
  sudo apt-get remove ros-*
  sudo apt-get purge ros-*
  sudo apt autoremove


install dependencies:
::

  sudo apt-get update
  sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential
  sudo apt-get install -y wget
  sudo apt-get install -y lsb-release
  sudo apt-get install -y sudo
  sudo apt-get install -y mesa-utils
  sudo apt-get clean

Get gazebo and ROS binaries:
::

  sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
  wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
  sudo apt-get update
  sudo apt-get install -y gazebo8
  sudo apt-get install -y ros-kinetic-gazebo8-ros-pkgs
  sudo apt-get install -y ros-kinetic-fake-localization
  sudo apt-get install -y ros-kinetic-joy
  sudo apt-get install -y ros-kinetic-robot-state-publisher
  sudo apt-get install -y ros-kinetic-rviz
  sudo apt-get clean
  sudo apt autoremove

Other packages (I am currently using...updated):
::

  sudo apt install rosbash
  sudo apt-get install ros-kinetic-ros-core
  sudo apt-get install ros-kinetic-turtlesim
  sudo apt-get install ros-kinetic-xacro
  sudo apt install ros-kinetic-teleop-twist-keyboard
  sudo apt install ros-kinetic-velodyne-description
  sudo apt install ros-kinetic-controller-manager
  sudo apt install ros-kinetic-joint-state-controller
  sudo apt install ros-kinetic-rqt-gui
  sudo apt install ros-kinetic-effort-controllers
  sudo apt install ros-kinetic-pcl-ros
  sudo apt install ros-kinetic-pointcloud-to-laserscan


http://wiki.ros.org/velo2cam_gazebo

Initialize rosdep:
::

  sudo rosdep init
  rosdep update


From Source
------------------------
After installing ``ROS`` from `source <http://wiki.ros.org/Installation/Source>`_ with the ``Desktop Install`` you will also need to put the following packages into the ``/ros_catkin_ws/src`` folder:
::

  git clone https://github.com/ros-simulation/gazebo_ros_pkgs -b kinetic-devel
  git clone https://github.com/ros-perception/image_common -b hydro-devel
  git clone https://github.com/ros-controls/control_toolbox -b kinetic-devel
  git clone https://github.com/ros-controls/ros_control -b kinetic-devel
  git clone https://github.com/ros-controls/realtime_tools -b kinetic-devel

Then rebuild the workspace:
::

  ./src/catkin/bin/catkin_make_isolated --install

To test installation, run:
::

  roscore &
  rosrun gazebo_ros gazebo
