Potential Errors
*****************


.. warning::

  Potential Error:
  ::

    fatal error: tf2/LinearMath/Quaternion.h: No such file or directory compilation terminated.

  It is trying to find some file and it cannot. The problem may be that the header files where not specified! To fix:
  ::

    include_directories(
      ${catkin_INCLUDE_DIRS}
    )
