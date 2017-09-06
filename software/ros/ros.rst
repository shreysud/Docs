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


gazebo_ros_pkgs
^^^^^^^^^^^^^^^^^^^
http://gazebosim.org/tutorials?tut=ros_installing&ver=1.9%2B&cat=connect_ros
After installing ``ROS`` from `source <http://wiki.ros.org/Installation/Source>`_ with the Desktop Install you will also need to put the following into the ``/ros_catkin_ws/src`` folder:
::

  git clone https://github.com/ros-perception/image_common -b hydro-devel
  git clone https://github.com/ros-controls/control_toolbox -b kinetic-devel
  git clone https://github.com/ros-controls/ros_control -b kinetic-devel
  git clone https://github.com/ros-controls/realtime_tools -b kinetic-devel

Then rebuild the workspace:
::

  ./src/catkin/bin/catkin_make_isolated --install


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
