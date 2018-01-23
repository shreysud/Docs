Macros
======

Detailed information on macros in julia is found `here <http://docs.julialang.org/en/release-0.5/manual/metaprogramming/>`_.

@def
----
Given some parameters:
::

  using Parameters

  @with_kw immutable Vpara @deftype Float64
      m  = 2.6887e+03
  end
  pa = Vpara(); # initialize parameter set


Instead of unpackaging the same parameters each time in a nested function like this:
::

  function outer_f(pa::Vpara)
    num = zeros(Float64, (10,1))
    for i in 1:10
     num[i] = inner_f(pa::Vpara,i)
    end
    return num
  end

with:
::

  function inner_f(pa::Vpara,i)
    @unpack_Vpara pa
     m + i + 0.1
  end

We define a macro as:
::

  macro def(name, definition)
    return quote
      macro $name()
        esc($(Expr(:quote, definition)))
      end
    end
  end

then redefine ``inner_f1()`` as:
::

  @def inner_f2 begin
    m + i + 0.1
  end

We also need to modify the ``outer_f()`` as:
::

  function outer_f(pa::Vpara)
    @unpack_Vpara pa
    num = zeros(Float64, (10,1))
    for i in 1:10
      num[i] = @inner_f2
    end
    return num
  end

The ``@def`` macro is functionally equivalent to copying and pasting the contents of inner_f() into outer_f().



Parallel Computing
####################
http://docs.julialang.org/en/stable/stdlib/parallel/#Base.addprocs
https://www.youtube.com/watch?v=JoRn4ryMclc
container:
::

  rr=RemoteChannel()
  # stores a value -> like a container that you can put something in and take something out


adding something to the container:
::

  put(rr,0)

to add some processors:
::

  addprocs()

calling a processor:
::

  remotecall(function, proc,data)
  # don't use this all of the time -> sort of low level

Example:
::

  addprocs(1)
  rc=remotecall(rand,2,100,100)
  # then later...
  f=fetch(rc)

An easier way to do this example is using ``@span``:
::

  r=@spawn rand(100,100)
  # it picks a processor and sets this up for us

When you are typing you are typing to processor #1.

Number of processors:
::

  nprocs()

Be able to run something everywhere:
::

  @everywhere println(myid())

Also try:
::

  fetch(@spawn myid())

Another useful macro:
::

  @parallel
  # works with ``for`` loops
  #a=zeros(20) # wrong --> returns all 0's
  a = SharedArray(Float64,20)
  @parallel for i=1:20
    a[i]=i;
  end
