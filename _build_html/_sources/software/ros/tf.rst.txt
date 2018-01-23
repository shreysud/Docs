`tf2 <http://docs.ros.org/lunar/api/tf2/html/>`_
*****************************************************

This package uses `geometry_msgs <http://wiki.ros.org/geometry_msgs>`_ for some of the messages.

Useful `functions <http://docs.ros.org/lunar/api/tf2/html/functions_func.html>`_
===================================================================================

.. warning::

  use tf2 not tf

Commands
===========

Check tf tree:
::

  roswtf
  rosrun tf tf_monitor
  rosrun tf view_frames


to print a particular transformation:
::

  rosrun tf tf_echo /map /odom

Joint States
=============



Terminology
============

1) Quaternions: a way to describe rotations that does not have singularities. It has four numbers, the first three describe an axis and the third is the amount of rotation about that axis.

The first three components are imaginary:
 ::

  q=xi+yj+zk+w


The magnitude of a quaternion is:
  ::

    magnitude=sqrt(x^2+y*2+z^2+w^2)

where:
  ::

    x = x / magnitude
    y = y / magnitude
    z = z / magnitude
    w = w / magnitude


http://www.euclideanspace.com/maths/geometry/rotations/conversions/quaternionToEuler/

* Almost never have to set these manually in ROS!
* `Programming Quaternions <http://www.cprogramming.com/tutorial/3d/quaternions.html>`_
* ` a calculator <http://quat.zachbennett.com/>`_
* ` a Gazebo example <http://gazebosim.org/tutorials?tut=drcsim_atlas_siminterface&cat=>`_

Tutorials and Resources
========================

  * `tutorials <http://wiki.ros.org/tf/Tutorials>`_
  * `FAQ <http://wiki.ros.org/tf/FAQ>`_
  * `docs <https://w3.cs.jmu.edu/spragunr/CS354_S14/labs/tf_lab/html/tf-module.html>`_
  * `setting up the frames <http://wiki.ros.org/hector_slam/Tutorials/SettingUpForYourRobot>`_: for SLAM
  * `setting up your robot using tf <http://wiki.ros.org/navigation/Tutorials/RobotSetup/TF>`_
Example Resources
=====================
  * python `omniaxbot <https://github.com/mars-uoit/omnimaxbot/blob/master/omnimaxbot_description/src/tf_broadcaster.cpp>`_


Issues
=======

  * `quaternions <http://answers.ros.org/question/55923/tfquaternion-syntax-question/>`_
  * `using tf <http://answers.ros.org/question/87726/applying-rotations-to-coordinate-frames-using-tf/>`_
  * `joint states <http://answers.gazebosim.org/question/4205/joint_state-ros-topic-from-gazebo-and-ros_control/>`_


Potential Errors
=================

.. note::

  potential error:
  ::

    fatal error: tf/transform_broadcaster.h: No such file or directory
    compilation terminated.

  Use tf2! The new version of tf.
