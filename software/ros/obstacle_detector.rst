`obstacle_detector <https://github.com/tysik/obstacle_detector>`_
#####################################################################

To use this package you must install `Armadillo C++ <http://arma.sourceforge.net/download.html>`_.

Installing Armadillo C++
============================
Put these programs in the ``/opt`` folder

First you need `OpenBlas <http://www.openblas.net/>`_
---------------------------------------------------------------------

To get it type:
::

  sudo git clone https://github.com/xianyi/OpenBLAS.git

Then go into the ``OpenBlas`` folder and type:
::

  sudo make

Get devel files from Debian repos `as per <https://github.com/xianyi/OpenBLAS/wiki/Precompiled-installation-packages>`_:
::

   sudo apt update
   apt search openblas
   sudo apt install libopenblas-dev
   sudo update-alternatives --config libblas.so.3
   sudo apt install cmake liblapack-dev
   apt search arpack
   sudo apt install libarpack2-dev



Then you need `LAPACK <https://github.com/Reference-LAPACK/lapack-release/tree/lapack-3.1.0>`_
----------------------------------------------------------------------------------------------------------------

To get it type:
::

  sudo git clone https://github.com/Reference-LAPACK/lapack-release.git

Then go into the ``lapack-release`` folder and type:
::

  sudo mv make.inc.example make.inc
  sudo make

.. warning:: Then you may run into this issue:
  ::

    ./liblapack.a ../../librefblas.a
    make[2]: Leaving directory '/opt/lapack-release/TESTING/LIN'
    Testing COMPLEX16 LAPACK linear equation routines
    ./LIN/xlintstz < ztest.in > ztest.out 2>&1
    SEP: Testing Symmetric Eigenvalue Problem routines
    ./EIG/xeigtstz < sep.in > zsep.out 2>&1
    Makefile:467: recipe for target 'zsep.out' failed
    make[1]: *** [zsep.out] Error 139
    make[1]: Leaving directory '/opt/lapack-release/TESTING'
    Makefile:42: recipe for target 'lapack_testing' failed
    make: *** [lapack_testing] Error 2

  As per `this site <http://blog.csdn.net/chishuideyu/article/details/78351063>`_ the stack size can be increased with:
  ::

    ulimit -s 100000

  Then run:
  ::

    sudo make

  And it should compile fine!


.. note:: can also install SuperLU and ARPACK etc. `as per<https://github.com/conradsnicta/armadillo-code/tree/8.300.x>`_


Now we can get Armadillo C++
-----------------------------
To get it type:
::

  sudo git clone https://github.com/conradsnicta/armadillo-code.git

Then go into the ``armadillo-code`` folder and type:
::
  sudo cmake .
  sudo make
