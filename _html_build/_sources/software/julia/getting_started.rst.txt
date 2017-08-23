Getting Started with julia
==========================
Extensive julia documentation is available `here <http://julialang.org/>`_.

Building julia release 0.5 - current
-------------------------------------
Recently a new version of julia was released and it will be tested. The following directions also assume that julia was previously installed on the machine. If it was not, skip to step 3.

**Remove current version of julia**

1. get a graphical file manager with **ROOT ACCESS**:
::

  gksu nautilus

Also, may need to:
::

  sudo apt install gksu

* NOTE: be **very** careful in here!!

2. Type ``ctrl+l`` to type into location bar

* now navigate to where julia is and delete the binaries (or bin), ie. it might be in /usr/local/begin

**Add new version current version of julia**

3. unzip the .gz into the ``\opt`` folder (the place where by convention you'd put "optional" packages )

for instance:
::

  sudo tar -xvf /home/febbo/Downloads/julia-0.5.0-linux-x86_64.tar.gz -C /opt

4. Check it:
::

  febbo@febbo-HP-ZBook-17-G2:/opt/julia-3c9d75391c/bin$ ./julia
  OR
  febbo@febbo-HP-ZBook-17-G2:/opt/julia-3c9d75391c/bin$ /opt/julia-3c9d75391c/bin/julia
                 _
     _       _ _(_)_     |  A fresh approach to technical computing
    (_)     | (_) (_)    |  Documentation: http://docs.julialang.org
     _ _   _| |_  __ _   |  Type "?help" for help.
    | | | | | | |/ _` |  |
    | | |_| | | | (_| |  |  Version 0.5.0 (2016-09-19 18:14 UTC)
   _/ |\__'_|_|_|\__'_|  |  Official http://julialang.org/ release
  |__/                   |  x86_64-pc-linux-gnu

  julia>

5. Now we need to create a symbolic link so that we can just type ``julia`` in the command line. There are three ways to do this (**just do the third option; it is permanent**):

  1. create an "alias"

    * create an alias using the following command..

      type:
      ::

        alias julia='/opt/julia-3c9d75391c/bin/julia'

  2. add ``/opt/julia-3c9d75391c/bin`` to your PATH

    * all directories contained in the PATH are accessible from **ANYWHERE**
    * you can see the current PATH variable by typing in your terminal..

    type:
    ::

      echo $PATH

    * you can redefine a variable in bash e.g. by doing..

    type:
    ::

      PATH=new definition here

        * (no spaces----> this is important)

    * add your julia path to the existing path, you can do that by saying...

    type:
    ::

      PATH=/opt/julia-3c9d75391c/bin:$PATH

        * the $PATH contains the old value, so you're basically adding your folder and a colon and then all the rest, into a new PATH variable

    **The Problem with The Above Two Options is that:**

    With both adding to the path or creating an alias, is that these changes are **TEMPORARY**
    the minute you close your terminal and open it again, you'll see that these changes have disappeared
    try it and see!

      * so to make it permanent, you actually have to do option 3

  3. change a file called bashrc which is run every time a terminal starts

    * the file you need to edit should be /etc/bash.bashrc

      so type:
      ::

        gksu gedit /etc/bash.bashrc


    If it exists and it's the right file, you should see its contents inside gedit

    * go to the very end of that file

      * add the alias line...

      type:
        ::

          alias julia='/opt/julia-3c9d75391c/bin/julia'

        and press enter!!

      * The enter is important; all commands should always end with a newline

6. Now close the terminal and type:
::

  febbo@febbo-HP-ZBook-17-G2:~$ julia
                 _
     _       _ _(_)_     |  A fresh approach to technical computing
    (_)     | (_) (_)    |  Documentation: http://docs.julialang.org
     _ _   _| |_  __ _   |  Type "?help" for help.
    | | | | | | |/ _` |  |
    | | |_| | | | (_| |  |  Version 0.5.0 (2016-09-19 18:14 UTC)
   _/ |\__'_|_|_|\__'_|  |  Official http://julialang.org/ release
  |__/                   |  x86_64-pc-linux-gnu

  julia>

So, it should be running!

7. If you are using Atom, make sure that you change the path in the config folder in settings:
::

  juliaPath: "/opt/julia-3c9d75391c/bin/julia"

8. next time you download a new version of julia:

* simply extract it under /opt in the same way and either replace the old one

**OR**

* if you want to keep both, you can just update your alias in /etc/bash.bashrc to point to the new one

Building julia release 0.5 - old
---------------------------------

1. Type:
::

  sudo apt -rm julia

2. Also, julia can be completely removed by deleting the ``~/.julia`` folder.

Note: Can also remove PPA (according to `this <http://askubuntu.com/questions/307/how-can-ppas-be-removed>`_):
::

  sudo apt install ppa-purge

- although this does not seem to be useful.

**Fresh install instructions for UBUNTU:**

A. Follow these `instructions  <http://julialang.org/downloads/platform.html>`_.

*Or*

B. Type this terminal:
::

  sudo add-apt-repository ppa:staticfloat/juliareleases
  sudo add-apt-repository ppa:staticfloat/julia-deps
  sudo apt-get update
  sudo apt-get install julia


Bleeding Edge Version - previously used
---------------------------------------
I found that julia is constantly being developed and that most of the developers do not make sure that every version is maintained, this can create issues when using particular packages. So, if you want to use the latest and greatest features, you might consider the bleeding edge version of julia.

**Fresh install instructions for UBUNTU:**

A. Follow these `instructions  <http://julialang.org/downloads/platform.html>`_.

*Or*

B. Type this terminal:
::

  sudo apt-add-repository ppa:staticfloat/julianightlies
  sudo apt-add-repository ppa:staticfloat/julia-deps
  sudo apt-get update
  sudo apt-get install julia


Warnings
--------
If you are getting warnings like this:
::

  WARNING: Deserialization checks failed while attempting to load cache from /home/febbo/.julia/lib/v0.6/JuMP.ji.
  WARNING: Module Lazy uuid did not match cache file.
  INFO: Recompiling stale cache file /home/febbo/.julia/lib/v0.6/JuMP.ji for module JuMP.
  WARNING: Deserialization checks failed while attempting to load cache from /home/febbo/.julia/lib/v0.6/ReverseDiffSparse.ji.
  WARNING: Module Lazy uuid did not match cache file.
  INFO: Recompiling stale cache file /home/febbo/.julia/lib/v0.6/PyPlot.ji for module PyPlot.
  WARNING: Deserialization checks failed while attempting to load cache from /home/febbo/.julia/lib/v0.6/PyCall.ji.
  WARNING: Module Conda uuid did not match cache file.

It is a precompilation failure; restart Julia
