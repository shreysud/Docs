Linux
=====


Useful Linux Programs with julia
--------------------------------
In the Linux terminal:
::

  sudo dpkg --install atom-amd64.deb
  sudo apt install ffmpeg
  sudo apt-get install cmake bar time binutils make libssl-dev gfortran libunwind8-dev gcc g++ #clang curl perl wget m4 patch pkg-config
  sudo apt-get install gsfonts-x11
  #sudo apt-get install notepadqq
  sudo apt-get update
  sudo apt-get install gfortran
  sudo apt-get install libnlopt0
  sudo apt-get install openssh-server
  sudo apt install ipmiutil
  sudo apt-get install hdf5-tools
  apm install latex # Atom package manager for latex!
  sudo apt-get install pdf2svg # for PGFPlots
  pip install sphinxcontrib-bibtex
  sudo apt-get install texlive-luatex
  sudo apt install aptitude
  sudo apt-get install freecad
  sudo apt install blender
  sudo apt install rpm
  apm install latex
  sudo apt autoremove

Also using Ubuntu Software Program
-----------------------------------

* Synaptic Package Manager

Java (JabRef -- references)
----------------------------
First I tried a few things including:
::

  sudo apt-get install default-jre
  sudo apt-get update

And:
::

  sudo add-apt-repository ppa:openjdk-r/ppa
  sudo apt-get update
  sudo apt-get install openjdk-7-jre

This messed stuff up and then I deleted all of my old java versions using:
::

  sudo natilus

Ended up needing to follow `this advice <http://askubuntu.com/questions/251213/unable-to-install-default-jdk
>`:
::

  sudo add-apt-repository ppa:webupd8team/java
  sudo apt-get update
  sudo apt-get install oracle-java8-installer
  java -version
  sudo apt-get install oracle-java8-set-default

This finally worked and I was able to run JabRef with no problem using:
::

  java -jar JabRef-3.8.jar

If something is broken:
::

  sudo apt-get -f install


Basic Linux Commands
--------------------

Never run an executable in root!

Some more info can be found on ` this page <https://www.cyberciti.biz/faq/tar-extract-linux/>`.

To unpack a tar file:
::

  tar -xvf file.tar

To extract a .tar.gz:
::

  tar -xzvf file.tar.gz

Unzip:
::

  unzip stuff.zip -d /destination/folder

directory comment:
::

  $HOME = /home/febbo

Run a jar file:
java -jar lad


Issues and Fixes
-----------------

1. Trying to uninstall sphinx so that I could get a newer version without bugs:
::

  febbo@febbo-HP-ZBook-17-G2:~/Desktop/useful downloads$ pip uninstall sphinx
  Cannot remove entries from nonexistent file /home/febbo/anaconda3/lib/python3.5/site-packages/easy-install.pth

The `problem <https://github.com/ContinuumIO/anaconda-issues/issues/542>`_:
This probably won't work:
::

  conda update setuptools

The fix, was to download ``ez_setup.py`` from `this link <https://pypi.python.org/pypi/setuptools#installation-instructions>`_  and run it in the terminal:
::

  febbo@febbo-HP-ZBook-17-G2:~$ python ez_setup.py

Then I could uninstall Sphinx-1.4.1:
::

  febbo@febbo-HP-ZBook-17-G2:~$ pip uninstall sphinx
  Uninstalling Sphinx-1.4.1:
  /home/febbo/anaconda3/bin/sphinx-apidoc
  /home/febbo/anaconda3/bin/sphinx-autogen
  /home/febbo/anaconda3/bin/sphinx-build
  /home/febbo/anaconda3/bin/sphinx-quickstart
  /home/febbo/anaconda3/lib/python3.5/site-packages/Sphinx-1.4.1-py3.5.egg
  Proceed (y/n)? y
  Successfully uninstalled Sphinx-1.4.1

There was reason I needed to uninstall this version of Sphinx was because the citations where not working.

Finally I installed Sphinx-1.5.2:
::

   #Install from newest dev version in stable branch::
   pip install git+https://github.com/sphinx-doc/sphinx@stable


/etc/bash.bashrc  vs. $HOME/.bashrc
--------------------------------------

Be careful there are two files that configure the terminal!

http://unix.stackexchange.com/questions/140207/messed-up-bash-bashrc-file-commands-not-working-anymore

in my ``$HOME/.bashrc``:
::

  alias blender='/opt/blender/blender'
  alias julia='/opt/julia-6445c82d00/bin/julia'
  alias docs='sphinx-autobuild . _build_html'
  export DYLD_LIBRARY_PATH="$HOME/knitro/lib:$DYLD_LIBRARY_PATH"
  export LD_LIBRARY_PATH="$HOME/knitro/lib:$LD_LIBRARY_PATH"
  export PYTHONPATH=$PYTHONPATH:/usr/lib/python2.7/dist-packages
  export GAZEBO_PLUGIN_PATH=/home/febbo/.julia/v0.5/OCP/MAVs/workspace/src/velodyne_plugin/build/:${GAZEBO_PLUGIN_PATH}
  source /opt/ros/kinetic/setup.bash
  export ROS_PACKAGE_PATH=/home/febbo/.julia/v0.5/OCP/MAVs/workspace:$ROS_PACKAGE_PATH
