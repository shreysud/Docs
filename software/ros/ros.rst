`Installing ROS <http://www.ros.org/install/>`_
***********************************************************

`From Pre-Built Debians <http://wiki.ros.org/kinetic/Installation/Ubuntu>`_
----------------------------------------------------------------------------------

For ROS kinetic:
::

  sudo apt-get install ros-kinetic-desktop-full


`From source <http://wiki.ros.org/Installation/Source>`_
------------------------------------------------------------
Additional steps/notes to the link above.

1. Remove any sourced files from the ``bash.bashrc`` files.
2. ``2.1``: after making the ``catkin_ws``
  Run:
  ::

    catkin init

  .. note:: make sure that there are no other external workspaces that you are building on

3. Resolve Dependencies

Before you build the ``catkin_ws`` make sure that you have the required dependencies!
::

  rosdep install --from-paths src --ignore-src --rosdistro kinetic -y

Potential Issues:
^^^^^^^^^^^^^^^^^^^^^^
Using the second option (``Desktop Install``) for ``kinetic``, the following issues may occur:


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

      c++: error: /home/febbo/ros_catkin_ws/build_isolated/qt_gui_cpp/src/qt_gui_cpp_shiboken/libqt_gui_cpp_shiboken/qt_gui_cpp_recursivepluginprovider_wrapper.cpp: No such file or directory
      c++: fatal error: no input files
      compilation terminated.

      <== Failed to process package 'qt_gui_cpp':

    Fix # 1
    --------
    After posting an `issue here <https://github.com/ros-visualization/qt_gui_core/issues/105>`_. The fix was identified to be removing ``shiboken`` with:
    ::

      sudo apt-get remove libshiboken*

    Fix # 2 (better)
    -----------------
    An issue with the above fix is that if you try updating your ros dependencies and it installs ``shiboken``. So, `installing Qt 5 <http://wiki.qt.io/Install_Qt_5_on_Ubuntu>`_ with:
    ::

      sudo apt-get install qt5-default

  .. note::

    `potential error <https://github.com/ros-planning/navigation/issues/579>`:
    ::

      -- Found Bullet: /usr/lib/x86_64-linux-gnu/libBulletDynamics.so
      CMake Error at /usr/share/cmake-3.5/Modules/FindPackageHandleStandardArgs.cmake:148 (message):
        Could NOT find SDL (missing: SDL_LIBRARY SDL_INCLUDE_DIR)
      Call Stack (most recent call first):


.. note::

  potential error
  ::

    CMake Error at /usr/local/lib/cmake/gazebo/gazebo-config.cmake:172 (find_package):
    By not providing "Findignition-math3.cmake" in CMAKE_MODULE_PATH this

`Installing missing Dependencies <http://wiki.ros.org/rosdep>`_
=====================================================================

.. note::

    This is a truly magical command that works well (even when doing a source build)!!


Go to the ``catkin_workspace`` and type:
::

  rosdep install --from-paths src --ignore-src -r -y

Uninstalling ROS
=================================================

From Pre-Built Debians:
--------------------------

If you're running Ubuntu, and installed ROS with ``apt-get``, the first step would be:
::

  sudo apt-get remove ros-*

Remove configuration files:
::

  sudo apt-get purge ros-*

Remove packages that are no longer required:
::

  sudo apt autoremove


From Source
-------------
TODO
