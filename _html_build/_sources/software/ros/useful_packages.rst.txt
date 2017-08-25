Useful ROS Packages
*********************

`Simulated Car Demo <http://www.ros.org/news/2017/06/simulated-car-demo.html>`_
====================================================================================

A recent package by Tully Foote with a Gazebo model of Mcity using ROS Kinetic and Gazebo 8.


`Eigen <http://eigen.tuxfamily.org/index.php?title=Main_Page>`_
=======================================================================

a C++ library that I use for quaternion transformations, to `get started <http://eigen.tuxfamily.org/dox/GettingStarted.html>`_

.. note::

  when going to use it `with ROS <http://wiki.ros.org/eigen>`_ there is no FindEigen.cmake on Ubuntu, so you need to include it in your package by default.

http://wiki.ros.org/jade/Migration#Eigen_CMake_Module_in_cmake_modules

`roscpp <http://wiki.ros.org/roscpp_tutorials>`_
===================================================
A C++ implementation of ROS that allows users to quickly interact with ROS.

`rospy <http://wiki.ros.org/rospy/Overview>`_
====================================================



`Common Messages <http://wiki.ros.org/common_msgs>`_
============================================================

a meta package for common messages

`message_filters <http://wiki.ros.org/message_filters>`_
===========================================================


Make the decision to use data based off of the time stamp. Basically sequence the data

`PCL <http://wiki.ros.org/pcl/Tutorials>`_
====================================================

Point cloud library


`Ackermann Group <http://wiki.ros.org/Ackermann%20Group>`_
==============================================================

Group that supports Ackermann steering geometry.


`navigation <http://wiki.ros.org/navigation>`_
======================================================

install with:
::

  sudo apt-get install ros-kinetic-navigation

`hector_localization <http://wiki.ros.org/hector_localization?distro=kinetic>`_
====================================================================================

install with:
::

  sudo apt-get install ros-kinetic-hector-localization

`ros_control <http://wiki.ros.org/ros_control>`_
========================================================
install with:
::

  sudo apt-get install ros-kinetic-ros-control ros-kinetic-ros-controllers


`pointcloud_to_laserscan <http://wiki.ros.org/pointcloud_to_laserscan>`_
====================================================================

install with:
::

  sudo apt-get install ros-kinetic-pointcloud-to-laserscan


`teleop_twist_keyboard <http://wiki.ros.org/teleop_twist_keyboard>`_
========================================================================

`Cartographer <https://opensource.googleblog.com/2016/10/introducing-cartographer.html>`_
===============================================================================================
A Google map builder

`laser_pipeline <http://wiki.ros.org/laser_pipeline>`_
========================================================
Meta-package for laser data processing

`robot_localization <http://wiki.ros.org/robot_localization>`_
================================================================
Provide state estimates given sensor data

robot_state_publisher
==========================

  * `turorial <http://wiki.ros.org/robot_state_publisher/Tutorials/Using%20the%20robot%20state%20publisher%20on%20your%20own%20robot>`_
  * load `new parameters on the server <http://answers.ros.org/question/61479/adding-robot_description-to-parameter-server/>`_
  * `Troubleshooting <http://wiki.ros.org/robot_state_publisher/Troubleshooting>`_
  * `messages being blocked <http://answers.ros.org/question/12083/messages-being-blocked-from-publishing/>`_
  * `use_sim_time <http://wiki.ros.org/rviz/Troubleshooting>`_ = ``false``

Requires:

  * `joint_state_publisher <http://wiki.ros.org/joint_state_publisher>`_

`clock <http://wiki.ros.org/Clock>`_
========================================
For a ROS node to use the ``/clock`` topic set the ``/use_sim_time`` parameter before node is started

`ControllIt! <http://robotcontrolit.com/installation>`_
================================================================

`MoveIT <http://moveit.ros.org/>`_
======================================

`Install <http://moveit.ros.org/install/>`_
-----------------------------------------------

ROS Kinetic on Ubuntu:
::

  sudo apt-get install ros-kinetic-moveit


Using With Kinetic
--------------------

Go to `this link <https://github.com/ros-planning/moveit_tutorials/pull/45>`_ and download the PDF for instructions.

`ADAS <http://wiki.ros.org/Robots/ADAS_Development_Vehicle_Kit>`_
======================================================================
Great example for controlling autonomous vehicles.


`ROS tutorial for Autonomous Cars <https://www.youtube.com/watch?v=jbimBoI42AM>`_
==========================================================================================
http://www.robotigniteacademy.com/en/


IPA320
=========
Very useful resource for using ROS with Gazebo

  * https://github.com/ipa320
  * https://github.com/ipa320/srs_public/blob/master/srs_user_tests/ros/scripts/move_robot_sim.py

Potential Vehicle Models
==========================

  * robots.ros.org
  * http://wiki.ros.org/Robots/Husky
  * http://wiki.ros.org/Robots/Grizzly
  * http://wiki.ros.org/Robots/Jackal
