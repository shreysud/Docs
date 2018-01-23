Useful Packages and Programs
============================
This page includes details of the packages and programs that I am using in OCP.


Adding and Removing Packages in julia
--------------------------------------
A useful description of the syntax for adding and remove packages in julia can be found `here <http://docs.julialang.org/en/release-0.4/manual/packages/>`_.

All packages that I have on julia
----------------------------------
I have many packages and to configure them all can be tricky, so I include a list of commands that you can copy and past into julia to get started.
Make sure that you are restarting the both julia and the terminal after things are installed.

Basics
-------
::

  Pkg.add("DataFrames")
  Pkg.add("IJulia")
  Pkg.add("Parameters")
  Pkg.add("PkgDev")
  Pkg.add("AmplNLWriter")
  #Pkg.clone("https://github.com/JunoLab/Juno.jl")
  Pkg.add("HDF5")
  Pkg.build("HDF5")
  Pkg.add("SymPy")
  Pkg.add("Jacobi")

Math
-----
I use:
::

  Pkg.add("DiffBase")
  Pkg.clone("https://github.com/Keno/Polynomials.jl")
  Pkg.add("DifferentialEquations")
  Pkg.add("Dierckx")
  Pkg.add("ImplicitEquations")
  Pkg.add("Interpolations")

Optimization
-------------
I use:
::

  Pkg.add("JuMP") # adds MathProgBase automatically
  Pkg.add("Ipopt")
  Pkg.add("CoinOptServices")
  Pkg.add("NLopt")
  Pkg.build("NLopt")

Plotting
---------
Basically I use Plots.jl to interface with some of these:
::

  Pkg.add("Conda")
  ENV["PYTHON"]=""
  Pkg.add("PyPlot")
  Pkg.add("Plots")
  Pkg.build("PyPlot")
  Pkg.add("ImageMagick")
  Pkg.add("GR")
  Pkg.add("Plotly")
  Pkg.add("StatPlots")
  Pkg.add("PlotRecipes")
  Pkg.add("UnicodePlots")
  Pkg.add("Gadfly")
  Pkg.add("RDatasets")
  Pkg.add("Winston")
  Pkg.add("PGFPlots")
  Pkg.build("PGFPlots")
  Blink.AtomShell.install()
  import Conda # to fix pyplot!!!
  Conda.add("qt=4.8.5")

My Packages
------------
I started these:
::

  Pkg.clone("https://github.com/huckl3b3rry87/VehicleModels.jl")
  Pkg.clone("https://github.com/huckl3b3rry87/NLOptControl.jl")

Miscellaneous
--------------
probably do not need:
::

  Pkg.clone("https://github.com/pwl/MovcolN.jl")
  Pkg.add("Devectorize")
  Pkg.add("FactCheck")

Useful Command After Installing Packages
----------------------------------------
Type:
::

  Pkg.update()


Customizing Keybindings and Tab Completion
--------------------------------------------

`Info here <http://docs.julialang.org/en/release-0.5/manual/interacting-with-julia/>`_

type:
::

  import Base: LineEdit, REPL

  const mykeys = Dict{Any,Any}(
    # Up Arrow
    "\e[A" => (s,o...)->(LineEdit.edit_move_up(s) || LineEdit.history_prev(s, LineEdit.mode(s).hist)),
    # Down Arrow
    "\e[B" => (s,o...)->(LineEdit.edit_move_up(s) || LineEdit.history_next(s, LineEdit.mode(s).hist))
  )

  function customize_keys(repl)
    repl.interface = REPL.setup_interface(repl; extra_repl_keymap = mykeys)
  end

atreplinit(customize_keys)

Basic Pkg. Usage Notes
========================

Optimization
------------
Currently the only optimization tool that is being tested it IPOPT.

1. IPOPT

It is very easy to get going using IPOPT in julia using `IPOPT.jl <https://github.com/JuliaOpt/Ipopt.jl>`_.

Derivatives
-----------
`JuMP.jl <https://github.com/JuliaOpt/JuMP.jl>`_ is one of the most useful packages for solving the OCP because it takes **very** fast automatic derivatives and it allows the user to easily set up optimization problems. So, with this tool there is no need to write out the complicated Jacobian and Hessian functions.

The documentation for this package can be found `JuMP docs <https://jump.readthedocs.io/en/latest/>`_.

Some useful Methods are found `by clicking <http://jump.readthedocs.io/en/latest/refmodel.html?highlight=JuMP.build>`_.

**Some useful commands**
Query upper and lower bounds of all constraints in the model:
::

  JuMP.constraintbound(m::Model)


MathProgBase.jl
---------------
`MathProgBase.jl <http://mathprogbasejl.readthedocs.io/en/latest/nlp.html>`_.


.. _ploy_div:

Polynomial Division
-------------------
There was an issue when JuMP was sent a term with polynomial division. This section deals with the attempt to use the `Polynomials.jl <https://github.com/Keno/Polynomials.jl>`_ to take care of the polynomial division on the front end, before the expressions are sent to JuMP.

Basic Functionality:
::

  using Ploynomials
  Poly([1,0,3,4])
  Poly(1 + 3x^2 + 4x^3)

Division Functionality:
::

  P1 = Poly([1,2,3,5,7])
  P2 = Poly([1,0,3])
  P3 = div(P1,P2)
  Poly(0.22222222222222218 + 1.6666666666666667x + 2.3333333333333335x^2)


Plots.jl
--------
A very powerful plotting tool is `Plots.jl <https://juliaplots.github.io/>`_. It took some time to get everything working because I was not using the same versions of the packages as the developers, but in the end it was work the time. It you run the code that I have listed below you should not have to deal with the setup issues that I had.

With PGFPlots:
::

  sudo apt-get install pdf2svg

http://nbviewer.jupyter.org/github/sisl/PGFPlots.jl/blob/master/doc/PGFPlots.ipynb

**Problem 1**

I wasted a bunch if my time, could not recreate in a simpler example, but basically, when ``plot()`` should have worked it failed and when I changed the order of the terms in ``plot()`` it works.


**Solution 1**

EX:
::

  for i in 1:k
  #		plot!(dfs[i][:t],dfs[i][:SA]*180/pi,w=w2,label=label_string[i])
  		plot!(dfs[i][:t],dfs[i][:SA]*180/pi,label=label_string[i],w=w2)
  end


**Problem 2**

Segfault when attempting to plot after Conda update to Segfault with qt >=4.8.6 on ubuntu

I was running into an issue with Plots.jl after doing a ``Pkg.update()``:
::


     _       _ _(_)_     |  A fresh approach to technical computing
    (_)     | (_) (_)    |  Documentation: http://docs.julialang.org
     _ _   _| |_  __ _   |  Type "?help" for help.
    | | | | | | |/ _` |  |
    | | |_| | | | (_| |  |  Version 0.6.0-dev.508 (2016-09-06 20:36 UTC)
   _/ |\__'_|_|_|\__'_|  |  Commit b1f1525 (26 days old master)
  |__/                   |  x86_64-linux-gnu

  julia> using Plots
  julia> plot(rand(4,100))
  signal (11): Segmentation fault
  while loading no file, in expression starting on line 0
  unknown function (ip: 0x32735)
  Allocations: 14606607 (Pool: 14605017; Big: 1590); GC: 25
  Segmentation fault (core dumped)

**Solution 2**

Change back to old Conda:
::

  import Conda
  Conda.add("qt=4.8.5")
  using PyPlot
  plot(rand(10))

Check out this `link <https://github.com/JuliaPy/PyPlot.jl/issues/234>`_.


DifferentialEquations.jl
------------------------

**Useful Commands**

all of the timepoints:
::

  sol[:]

Many times you might want to use a good interpolation. For example, the plots use something like:
::

  [sol(t) for t in linspace(t0,tend,100)]

To get 100 points from time t0 to tend for the first component:
::

  [sol(t)[1] for t in linspace(t0,tend,100)]

The array of timepoints for component j:
::

  [sol[i][j] for i in 1:length(sol)]


Parameters.jl
-------------
Great package for working with parameters. More info can be found at `this link <http://parametersjl.readthedocs.io/en/latest/manual/>`_.
