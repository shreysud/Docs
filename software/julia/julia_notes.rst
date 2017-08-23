julia notes
===========


Using kwargs...
-----------------

function:
::

  function test(A; kwargs...)

      kw = Dict(kwargs)

      # if there was nothing passed -> set default
      if !haskey(kw,:mode); kw = Dict(:mode => :default) end
      mode = get(kw, :mode, 0);

      if mode == :default
        B = 10
      elseif mode == :LGRM
        B = A
      else
        print("pick a mode","\n")
      end
      return B
  end

  B=test(2)
  B=test(2;(:mode=>:LGRM))


Making Variables Programatically
--------------------------------
https://docs.julialang.org/en/latest/manual/metaprogramming.html

code:
::

  ex=Array(Expr,4,1);
  for i in 1:4
    ex[i]=Expr(:(=),Symbol("x",i),i)
    eval(ex[i])
  end
vector case:
::
  A=[1 2 3 4]
  ex=Array(Expr,4,1);
  for i in 1:4
    ex[i]=Expr(:(=),Symbol("x",i),A)
    eval(ex[i])
  end
  x1

Using JuMP to make a @NLexpression
-----------------------------------
making nlexps:
::
  function test(n,exp,x)
    @eval begin
      x1=$x[1,1]
      x1=eval(x1);
      eq=@NLexpression($n,$exp)
    end
    return eq
  end

to test:
::

  using JuMP, Ipopt
  n = Model(solver=IpoptSolver(print_level=0))
  @variable(n,x[1:4,1:4])
  exp=test(n,:(sin(x1)),x)
  @NLconstraint(n,exp==0)
  @NLobjective(n,Min,x[1,2])
  solve(n)

making nlexps withough @eval to work with exp_arrs:
::
  function test(n,exp_arr,x)
    code=quote
      x1=$x[1,1:4]
      x1=eval(x1);
      @NLexpression($n,$exp_arr[1])
      end
    return eval(code)
  end

to test:
::

  using JuMP, Ipopt
  n = Model(solver=IpoptSolver(print_level=0))
  @variable(n,x[1,1])
  exp_arr=[:(sin(x1)),:(sin(x1))]
  exp=test(n,exp_arr,x)
  @NLconstraint(n,exp==0)
  @NLobjective(n,Min,x[1,2])
  solve(n)


example in REPL
::
  function EX(A)
    code=quote
      temp=$A[1]
      solution=$temp
    end
    return eval(code)
  end

  A=[:(2+4);:(9-8)]
  EX(A)
