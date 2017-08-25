Project Chrono
****************

Background
===========

Physics simulator organized as a set of modules that has a high-fidelity HMMWV model validated using Adams.


`Install <http://api.projectchrono.org/tutorial_install_chrono.html>`_
==========
Get the `IRRlicht engine <http://irrlicht.sourceforge.net/downloads>`_
--------------------------------

Make sure that you have the required files:
::

  sudo apt-get install cmake-extras cmake-qt-gui build-essential xorg-dev freeglut3-dev


Compile the ``Irrlicht Engine 1.8.4`` as a shared lib:
::

  make sharedlib
  make install

Then finally (the following may not all be needed..):
::

  sudo rm -f -r /usr/local/lib/../include/irrlicht
  sudo mkdir -p /usr/local/lib/../include/irrlicht
  sudo cp ../../include/*.h /usr/local/lib/../include/irrlicht/
  sudo cp ../../lib/Linux/libIrrlicht.so.1.8.4 /usr/local/lib
  sudo cd /usr/local/lib && ln -s -f libIrrlicht.so.1.8.4 libIrrlicht.so.1.8
  sudo cd /usr/local/lib && ln -s -f libIrrlicht.so.1.8 libIrrlicht.so

Chrono
-------
`Install instructions <http://www.irrlicht3d.org/wiki/?n=Main.InstallingIrrlicht>`_

Clone the master branch into the ``/opt/chrono/chrono_source`` directory:
::

  sudo git clone -b master https://github.com/projectchrono/chrono.git


To configure:
::

  sudo cmake-gui


Then to build (assuming ninja was used) go into the ``build`` directory and type:
::

  chrono/chrono_build$ sudo ninja


`VEHICLE Module <http://api.projectchrono.org/module_vehicle_installation.html>`_
------------------



Connecting to Gazebo
--------------------
A `repo <https://github.com/amelmquist/Chrono_Gazebo>`_ was developed to connect Gazebo to Chrono.


Install
^^^^^^^^^^^
  1) `Install Gazebo 7 from source <https://github.com/amelmquist/Chrono_Gazebo>`_



Potential Fixes
==================
Try updating ``glib`` with:
::

  sudo apt-get update && sudo apt-get upgrade



Issues:
===========

  * https://groups.google.com/forum/#!topic/projectchrono/ETBnyS18MNM
  * https://groups.google.com/forum/#!topic/projectchrono/1GI3RiZI-2A
  * https://stackoverflow.com/questions/13978692/strcpy-sse2-unaligned-s-not-found
  * https://sourceforge.net/p/irrlicht/bugs/375/


Resources
==========

  * https://vimeo.com/uwsbel
  * http://sbel.wisc.edu/Animations/


OLD
========
NOT NEEDED::

make a build directory:
::

  src/Chrono_Gazebo/gazonoVehicle$ sudo mkdir build


set up build environment:
::

  src/Chrono_Gazebo/gazonoVehicle$ sudo cmake CMakeLists.txt

make:
::


git clone git://git.code.sf.net/p/libosmscout/code libosmscout-code
