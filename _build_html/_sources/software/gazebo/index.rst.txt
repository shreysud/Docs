Gazebo
*******


Installation
=============
Automatically installed after following the ROS installation instructions.

Make sure after you install it you source the setup.sh file in the ``.bashrc`` script:
::

  source /usr/share/gazebo-7/setup.sh

Also source any setup.bash scripts that are in your projects:
::

  source /home/febbo/.julia/v0.6/MAVs/workspace/devel/setup.bash

Also in the ``setup.sh`` file in the ``usr/share/gazebo-7/`` directory, add to the resource path if you need to as:
::

  export GAZEBO_RESOURCE_PATH=/usr/share/gazebo-7:/usr/share/gazebo_models:/usr/share/gazebo-7/worlds${GAZEBO_RESOURCE_PATH}

In the above example we also added the ``/worlds`` folder.

.. note::

  Using the gui to create models is limited because the default full version of ros kinetic does not let you edit the models after you save them. So, then I started to learn how to make the models directly using XML. The only way to get around this is to build from source but then you won;t be able to use any ROS Ubuntu package related to Gazebo from the ROS deb repo.

From source (option A)
--------------------------

Follow `these instructions <http://gazebosim.org/tutorials?tut=install_from_source>`_

Additional notes:
^^^^^^^^^^^^^^^^^^

* Step 1:

  To get the ``Gazebo-8`` stable branch:
  ::

    /opt$ sudo hg clone https://bitbucket.org/osrf/gazebo /opt/gazebo -b gazebo8

  To get the ``Gazebo-7`` stable branch:
  ::

    /opt$ sudo hg clone https://bitbucket.org/osrf/gazebo /opt/gazebo -b gazebo7

sudo hg clone https://bitbucket.org/osrf/gazebo /tmp/gazebo -b gazebo7

* Step 3:

  Configure Gazebo:
  ::

    sudo mkdir build
    cd build
    sudo cmake ../

  Build Gazebo:
  ::

    /opt/gazebo/build$ sudo make -j4

  Install Gazebo:
  ::

    sudo make install

* Step 4:

  Set up environmental variables and

From source (option B) -preferred for ``Gazebo-7``
---------------------------------------------------
http://gazebosim.org/tutorials?tut=install_dependencies_from_source


Potential Issue
^^^^^^^^^^^^^^^^^^^^^
.. note::

    If not sourced properly:
    ::

      febbo@febbo-HP-ZBook-17-G2:~$ gazebo
      gazebo: error while loading shared libraries: libgazebo_common.so.7: cannot open shared object file: No such file or directory

    Then try:
    ::

      febbo@febbo-HP-ZBook-17-G2:~$ find / -name 'libgazebo_common.so.7' 2>/dev/null
      /usr/local/lib/libgazebo_common.so.7
      /tmp/gazebo/build/gazebo/common/libgazebo_common.so.7

    And updated the ``/etc/bash.bashrc`` file appropriately:
    ::

      gksu gedit /etc/bash.bashrc

    By adding (in this case):
    ::

      export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

.. note::

  when trying to start Gazebo from the command line:
  ::

  gazebo: error while loading shared libraries: libsdformat.so.5: cannot open shared object file: No such file or directory

Terminology
============

1) Xacro:

  (Xaxro) (XML macros) an XML macro language useful for shorter robot descriptions.

  * xacro:include: import content from another file
  * property: define constants `${property_name}`
  * xacro:macro: include the file where the macro is and call it using the macro's name and filling in the required values


2) `SDFormat <http://sdformat.org/>`_

  An XML format that describes environments for robot simulators visualizations and controls. Originally part of Gazebo but now is stable enough that it stands alone.


Basics
=======

`Model Structure <http://gazebosim.org/tutorials?tut=model_structure&cat=build_robot>`_
----------------------
Make sure that the model is structured correctly. An issue that was ran into is described `here <http://answers.gazebosim.org/question/14249/cant-export-gazebo_model_path/>`_ where I tried to put a model in a lower level directory. Models need to go just below ``catkin/src/``, then ``setup.sh`` must be modifed as:
::

  export GAZEBO_MODEL_PATH=/usr/share/gazebo-7/models:/home/febbo/catkin_ws/src/:${GAZEBO_MODEL_PATH}


`Model State Info <http://answers.ros.org/question/9783/programmatically-get-modelstate-from-gazebo/>`_
---------------------
Using ``rospy`` to get the model states.


World Files
--------------

.. note::

  When saving a world file, put it into the folder with the other world files!


Tutorials:
===========

  * `Add Sensor to A Robot <http://gazebosim.org/tutorials/?tut=add_laser>`_
  * `Gazebo Plugins <http://gazebosim.org/tutorials/?tut=plugins_hello_world>`_
  * `Getting SDF information for a model <http://gazebosim.org/tutorials?tut=gazebojs_models&cat=>`_
  * `Control Plugin <http://gazebosim.org/tutorials?cat=guided_i&tut=guided_i5>`_
  * `3D models <https://www.youtube.com/watch?v=lRJmjSu0X-M>`_

Resources:
============

  * `3D Warehouse <https://3dwarehouse.sketchup.com/>`_: a place to grab CAD models
  * `Possible Model for HMMWV <http://www.meshfactory.com/shop/catalog/product_info.php/m1025a2-hmmwv-us-army-desert-military-vehicles-p-991?osCsid=6o4vv4m8thed20aaehn6tnmnq1>`_
  * `simplify a .dae file <https://myshumi.net/2014/03/02/mesh-simplification-and-collada-exporter/>`_
  * `3Delicious <http://www.3delicious.net/>`_
  * `Free 3D <https://free3d.com/3d-models/all/1/dae>`_

Useful Software
=================

  * `Blender <https://wiki.blender.org/index.php/Doc:2.4/Manual/Modeling/Objects/Selecting>`_


Issues
===========

  * `importing Collada files <http://answers.gazebosim.org/question/3091/importing-collada-meshes-in-gazebo/>`_
