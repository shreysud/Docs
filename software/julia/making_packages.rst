Making Your Own Packages
==========================

To create packages and modules `click this <http://docs.julialang.org/en/release-0.4/manual/packages/>`_ to get started.

Or type:
::

  using PkgDev
  PkgDev.generate("VehicleModles","MIT")


Possible Next Steps:

  * Make a github repository with this name (plus a ``.jl`` at the end of the name)  `github.com <https://github.com>`_

      * Don't add a ``README.MD`` automatically using github, there will be a conflict if you will make one from the using ``sphinx-quickstart``

        * Or just pick one, don't do both!

  * Make some documentation :ref:`getting_started_with_docs`

    * Or, if everything is setup, type:
      ::

        sphinx-quickstart

    * Then:
      ::

        git remote add origin git@github.com:huckl3b3rry87/new_repo.jl

To tag:
::

  using PkgDev
  PkgDev.tag("VehicleModles")

To view the package:
::

  $ cd ~/.julia/v0.6/VehicleModles && git show --stat


To recompile a package:
::

  Pkg.test()

To go into the package directory:
::

  cd(Pkg.dir("LiDAR"))


In Juno, the workflow for building a package, you can do a ``Ctrl+J`` ``Ctrl+k`` to quit the current process and then use ``using PKG`` again.


it'll be in your lib folder and all setup to be used with using:
::

  Pkg.test
  Pkg.dir
  etc

Then in order to run ``Pkg.update()`` without getting this error:
::

  ERROR: Update finished with errors.
  => Package NLOptControl cannot be updated.
  GitError(Code:ERROR, Class:Merge, There is no tracking information for the current branch.)
  etc....

Which is talked about `here <https://github.com/JuliaLang/julia/issues/16372>`_, you have to:
::

  julia> Pkg.checkout("NLOptControl")
  INFO: Checking out NLOptControl master...
  INFO: Pulling NLOptControl latest master...
  INFO: No packages to install, update or remove

Making Modules
---------------
`look here <http://docs.julialang.org/en/release-0.4/manual/modules/>`_


Directories
-----------
Try:
::

  @__FILE__

`link <http://docs.julialang.org/en/release-0.5/stdlib/file/>`_
