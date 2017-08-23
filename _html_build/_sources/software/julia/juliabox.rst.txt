JuliaBox and Jupyter Notebooks
==============================
A way to run julia online without installing anything is to use `JuliaBox <https://juliabox.com/>`_ with Jupyter notebooks.

The examples will be demonstrated using this tool.


Jupyter Notebooks
-------------------
If you have IJulia installed you can run the examples using the following commands in julia:
::

  using IJulia

  # a few examples of changing the path
  notebook(dir = Pkg.dir("VehicleModels")*"/examples")
  notebook(dir="/home/febbo/Documents/workspace/OCP/examples")

More information can be found ` here <https://github.com/JuliaLang/IJulia.jl>`_.
