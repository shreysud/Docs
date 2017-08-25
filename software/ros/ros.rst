`Installing ROS <http://www.ros.org/install/>`_
=================================================
Then eventually, for my machine, `I followed <http://wiki.ros.org/kinetic/Installation/Ubuntu>`_

where I choose:
::

  sudo apt-get install ros-kinetic-desktop-full


`Installing from source <http://wiki.ros.org/Installation/Source>`_
----------------------------------------------------------------------

I choose the second option (recommended one) for ``kinetic``

.. note::

    potential error:
    ::

      /home/febbo/ros_catkin_ws/src/opencv3/opencv_contrib/rgbd/src/odometry.cpp:41:45: fatal error: unsupported/Eigen/MatrixFunctions: No such file or directory compilation terminated.

    The fix is to changed line 41 in ``odometry.cpp`` to (or where ``eigen3`` is):
    ::

      #include <eigen3/unsupported/Eigen/MatrixFunctions>

.. note::

    potential error:
    ::

      <== Failed to process package 'qt_gui_cpp':

    After posting an `issue here <https://github.com/ros-visualization/qt_gui_core/issues/105>`_. The fix was identified to be removing ``shiboken`` with:
    ::

      sudo apt-get remove libshiboken*


Uninstalling ROS
=================================================
If you're running Ubuntu, and installed ROS with apt-get, the first step would be:
::

  sudo apt-get remove ros-*

Remove configuration files:
::

  sudo apt-get purge ros-*

Remove packages that are no longer required:
::

  sudo apt autoremove


`Navigating the File System <http://wiki.ros.org/ROS/Tutorials/NavigatingTheFilesystem>`_
=============================================================================================

`Installing Packages <http://answers.ros.org/question/9201/how-do-i-install-a-missing-ros-package/>`_
========================

`URDF <http://wiki.ros.org/urdf>`_
======
Unified Robot Description Format (URDF), an Extensible Markup Language (XML) format (a markup language (can document revisions) that is both machine and human readable)

Tutorials
=========================

  * `Node Tutorial Python <http://wiki.ros.org/ROSNodeTutorialPython>`_
  * `Writing a Publisher Subscriber <http://wiki.ros.org/rospy_tutorials/Tutorials/WritingPublisherSubscriber>`_
  * `Publishing the State Info <http://wiki.ros.org/urdf/Tutorials/Using%20urdf%20with%20robot_state_publisher>`_
  * `Navigation Tutorials <http://wiki.ros.org/navigation/Tutorials>`_
  * `Turn your package into a python module <http://wiki.ros.org/rospy_tutorials/Tutorials/Makefile>`_
  * http://duckietown.mit.edu/media/pdfs/1rpRisFoCYUm0XT78j-nAYidlh-cDtLCdEbIaBCnx9ew.pdf

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


Other packages:
::

  sudo apt-get install libfcl-dev


To check for any missing dependencies:
::

  rosdep check --from-paths . --ignore-src --rosdistro kinetic

To automatically install missing dependencies:
::

  rosdep install --from-paths . --ignore-src --rosdistro kinetic -y


Potential Issues
====================

`permission denied: .gvfs <https://answers.ros.org/question/76896/permission-denied-gvfs/>`_
------------------------------------------------------------------------------------------------
Fix unmount Gnome virtual file system and delete the mounting point:
::

  sudo umount /home/febbo/.gvfs
  sudo rm -rf .gvfs/



Useful Questions
====================

  * `good path following code <https://answers.ros.org/question/234491/good-path-following-controller-for-ros/>`_
  * https://github.com/osrf/homebrew-simulation/issues/167


Misc
=========

my .bashrc
---------------
sourced
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
