Resources and Tutorials
***************************


Tutorials and Resources
=========================

  * `Node Tutorial Python <http://wiki.ros.org/ROSNodeTutorialPython>`_
  * `Writing a Publisher Subscriber <http://wiki.ros.org/rospy_tutorials/Tutorials/WritingPublisherSubscriber>`_
  * `Publishing the State Info <http://wiki.ros.org/urdf/Tutorials/Using%20urdf%20with%20robot_state_publisher>`_
  * `Navigation Tutorials <http://wiki.ros.org/navigation/Tutorials>`_
  * `Turn your package into a python module <http://wiki.ros.org/rospy_tutorials/Tutorials/Makefile>`_
  * `MIT stuff <http://duckietown.mit.edu/media/pdfs/1rpRisFoCYUm0XT78j-nAYidlh-cDtLCdEbIaBCnx9ew.pdf>`_
  * `basic ROS concepts <http://wiki.ros.org/ROS/Concepts>`_
  * `best practices <https://github.com/ethz-asl/ros_best_practices/wiki>`_
  * `Installing Packages <http://answers.ros.org/question/9201/how-do-i-install-a-missing-ros-package/>`_
  * `Navigating the File System <http://wiki.ros.org/ROS/Tutorials/NavigatingTheFilesystem>`_


Other packages:
::

  sudo apt-get install libfcl-dev


Great Commands
=================

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
