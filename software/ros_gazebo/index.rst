ROS and Gazebo
****************

`API <https://osrf-distributions.s3.amazonaws.com/gazebo/api/dev/classgazebo_1_1physics_1_1Joint.html>`_


Examples:
=============

`Get the position of a model <http://answers.gazebosim.org/question/12212/get-pose-of-a-model-from-a-plugin/>`_:
::

  gazebo::math::Pose pose = this->model->gazebo::physics::ModelState::GetPose();


Pose to `initialize the model to <http://gazebosim.org/tutorials?tut=plugins_world&ver=1.9%2B&cat=>`_:
::

   msgs::Set(msg.mutable_pose(),
   math::Pose(math::Vector3(1, -2, 0), math::Quaternion(0, 0, 0)));


`Writing  Publisher Subscriber <http://wiki.ros.org/ROS/Tutorials/WritingPublisherSubscriber%28python%29>`_
--------------------------------

`Messages <http://docs.ros.org/jade/api/gazebo_msgs/html/index-msg.html>`_
----------------

Example Resources:
====================

  * `gazebo_and_ros_control <https://github.com/JoshMarino/gazebo_and_ros_control>`_: with a tutorial
  * `srs <https://github.com/ipa320/srs_public/blob/master/srs_user_tests/ros/scripts/move_robot_sim.py>`_: a very useful example of using python for control

Tutorials:
==============

  * `ROS and Gazebo <http://gazebosim.org/tutorials?tut=ros_roslaunch>`_: using ``roslaunch``
  * `a blog post <http://www.generationrobots.com/blog/en/2015/02/robotic-simulation-scenarios-with-gazebo-and-ros/>`_ to help get started
  * A `helpful resource <http://answers.ros.org/users/91/hsu/>`_ lots of questions answered
  * `Gazebo ROS API for C-Turtle <http://wiki.ros.org/simulator_gazebo/Tutorials/Gazebo_ROS_API>`_
  * `ROS Plugins <http://gazebosim.org/tutorials?tut=ros_plugins>`_
  * `a blog post <http://www.theconstructsim.com/create-a-ros-sensor-plugin-for-gazebo/>`_
  * `another blog post <http://jackmorrison.me/2016/05/27/hello-world-with-ros-and-gazebo.html>`_
  * `JointTrajectory <http://gazebosim.org/tutorials?tut=drcsim_animate_joints&cat=>`_: good for controlling a robot when you don't care about the physics


Tools:
=============

  * `gazebo_ros_pkgs <http://wiki.ros.org/gazebo_plugins>`_ or `the look at the source code <https://github.com/ros-simulation/gazebo_ros_pkgs>`_
  * `pygazebo <https://github.com/jpieper/pygazebo>`_: a python interface to Gazebo
  * `gazebo_ros_p3d <http://docs.ros.org/diamondback/api/gazebo_plugins/html/classgazebo_1_1GazeboRosP3D.html>`_ : Ground Truth Pose and Rates Interface


Issues:
===========

  * `Using python <http://answers.ros.org/question/236171/adding-modelstate-to-gazebo-simulator-using-python-node/>`_ to set ModelState in Gazebo
  * `publisher and subscriber <http://answers.ros.org/question/12116/calling-gazebo-service-set_model_state-in-c-code/>`_ in C code
  * `set position in gazebo <http://answers.ros.org/question/29633/position-in-gazebo/>`_
  * `Using python <http://answers.ros.org/question/236171/adding-modelstate-to-gazebo-simulator-using-python-node/>`_ as a node
