Problems and Solutions
**************************


`python ENV with PyCall <https://github.com/JuliaPy/PyCall.jl/issues/285>`_
====================================================================================

Fix:
::

  _       _ _(_)_     |  A fresh approach to technical computing
  (_)     | (_) (_)    |  Documentation: https://docs.julialang.org
  _ _   _| |_  __ _   |  Type "?help" for help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 0.6.0 (2017-06-19 13:05 UTC)
  _/ |\__'_|_|_|\__'_|  |  Official http://julialang.org/ release
  |__/                   |  x86_64-pc-linux-gnu

  julia> ENV["PYTHON"]="/usr/bin/python"
  "/usr/bin/python"

  julia> Pkg.build("PyCall")
  INFO: Building Conda
  INFO: Building PyCall
  INFO: PyCall is using /usr/bin/python (Python 2.7.12) at /usr/bin/python, libpython = libpython2.7
  INFO: /home/febbo/.julia/v0.6/PyCall/deps/deps.jl has been updated
  INFO: /home/febbo/.julia/v0.6/PyCall/deps/PYTHON has been updated

  julia> using PyCall
  INFO: Recompiling stale cache file /home/febbo/.julia/lib/v0.6/PyCall.ji for module PyCall.

  julia> @PyCall.pyimport yaml

  julia>
