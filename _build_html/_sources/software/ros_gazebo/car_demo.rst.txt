`car_demo <http://www.ros.org/news/2017/06/simulated-car-demo.html>`_
************************************************************************

A `recent package <https://github.com/osrf/car_demo>`_ by Tully Foote with a Gazebo model of Mcity using ROS Kinetic and Gazebo 8.


Additional Install Notes
============================

Required Packaged (on top of **Desktop Install**)
-----------------------------------------------------
(for a source build) clone into the ``src`` directory:
::

  git clone https://github.com/ros-planning/navigation.git
  git clone https://github.com/ros-drivers/joystick_drivers.git


`Joystick <https://ubuntuforums.org/showthread.php?t=338457>`_
----------------------------------------------------------------
Usually when you plug in the Joysick it automatically sends that can be viewed with either:
::

  cat /dev/input/js0

Or:
::

  cat /dev/input/js1


.. note::

    potential error: ``libusb`` is not installed on the machine. I ran into `this issue <https://github.com/ros-drivers/joystick_drivers/issues/113>`_, where the ``ps3joy`` package failed with this error:
    ::

      CMake Error at /usr/share/cmake-3.5/Modules/FindPkgConfig.cmake:578 (message):
        None of the required 'libusb' found
      Call Stack (most recent call first):
        CMakeLists.txt:6 (pkg_search_module)

    The fix is to install ``libusb``:
    ::

      sudo apt-get install libusb-dev


Additional Info (not needed)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
install a program to test and calibrate:
::

  sudo apt-get install joystick

to test:
::

  jscal /dev/input/js0
  jstest /dev/input/js0


`NVIDIA-DOCKER <https://github.com/NVIDIA/nvidia-docker>`_
-------------------------------------------------------------
To show the current architecture, type:
::

    dpkg --print-architecture


type:
::

  wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.1/nvidia-docker_1.0.1-1_amd64.deb
  sudo dpkg -i /tmp/nvidia-docker*.deb && rm /tmp/nvidia-docker*.deb


install `nvidia-modprobe <https://askubuntu.com/questions/841824/how-to-install-nvidia-modprobe>`_:
::

  sudo apt install nvidia-modprobe


.. note::

    potential `error <https://github.com/NVIDIA/nvidia-docker/issues/358>`_:
    ::

      Error response from daemon: create nvidia_driver_375.66: error looking up volume plugin nvidia-docker: plugin "nvidia-docker" not found.
      See 'docker run --help'.

    the fix is:
    ::

      journalctl -n -u nvidia-docker


.. warning::

    Restart computer after installing GPU software
