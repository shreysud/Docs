Cheat Sheet
=============

not well formated.....look at source!


.. role:: math(raw)
   :format: html latex
..


|

.. math::

   \begin{aligned}
   (a^2-b^2)&=(a-b)(a+b)\\
   (a^3-b^3)&=(a-b)(a^2+ab+b^2)\\
   (a^4-b^4)&=(a-b)(a+b)(a^2+b^2)\\\end{aligned}

.. math::

   \begin{aligned}
   e^{a}e^{b}&=e^{a+b}\\
   (e^{x})^n&=e^{2x}\\\end{aligned}

.. math::

   \begin{aligned}
   (A+B)^T&=A^T+B^T\\
   (AB)^T&=B^TA^T\\
   AB^T&=BA^T\\
   (A^T)^{-1}&=(A^{-1})^T\\\end{aligned}

.. math::

   \begin{aligned}
   det(A^T)&=det(A)\\\end{aligned}

Also, if :math:`A` is square, then its eigenvalues are equal to the
eigenvalues of its transpose. Additionally, if the matrix is also
differentiable and nonsingular

.. math::

   \begin{aligned}
   \frac{d}{dt}(P^{-1}(t)=-P^{-1}(t)\dot{P}(t)P^{-1}(t)\end{aligned}

 which can be found with;
:math:`\frac{d}{dt}(P(t)P^{-1}(t))=\frac{d}{dt}(I)=0`

.. math::

   \begin{aligned}
   A^T&=A\end{aligned}

.. math::

   \begin{aligned}
   A^T=-A\end{aligned}

.. math::

   A = \begin{bmatrix}
          a_{11} & a_{12} \\
          a_{21} & a_{22}
       \end{bmatrix}

.. math::

   A^{-1}=
   \frac{1}{\lvert A\rvert}
          \begin{bmatrix*}[r]
              a_{22} & -a_{12} \\
             -a_{21} &  a_{11}
          \end{bmatrix*} \,.

.. math:: \left|B\right|=det(B)=\left|\begin{array}{ccc}a&b&c\\d&e&f\\g&h&i\end{array}\right|

.. math:: =a\left|\begin{array}{cc}e&f\\h&i\end{array}\right|-b\left|\begin{array}{cc}d&f\\g&i\end{array}\right|+c\left|\begin{array}{cc}d&e\\g&h\end{array}\right|

.. math::

   \begin{aligned}
   sin(2a)&=2cos(a)sin(a)\\
   cos(2a)&=1-2sin^2(a)=2cos^2(a)-1\\\end{aligned}

States that the derivative of the integral is (for constant limits of
integration):

.. math::

   \begin{aligned}
   \frac{d}{dt}(\int_{a}^{b} f(x,t) \,dt)&=\int_{a}^{b} \frac{\partial}{\partial x}f(x,t)\,dt\end{aligned}

 States that the derivative of the integral is (for limits of
integration that are not constant)

.. math::

   \begin{aligned}
   &\frac{d}{dt}(\int_{f(a)}^{f(b)} f(x,t) \,dt)=\\
   &=f(x,b(x))\frac{d}{dx}b(x)-f(x,a(x))\frac{d}{dx}a(x)+\int_{f(a)}^{f(b)} \frac{\partial}{\partial x}f(x,t)\,dt\end{aligned}

 Note: :math:`t` is a variable in the integration limit, so the above
formula must be used to derive :math:`\dot{P}(t)`.

.. math::

   \begin{aligned}
   \int x^n\,dx &= \frac{1}{n+1}x^{n+1}\\
   \int \frac{1}{x}\,dx &= \ln |x|\\
   \int u\dot{v}\,dx &= uv - \int v du\\
   \int e^x\,dx &= e^x \\
   \int a^x\,dx &= \frac{1}{\ln a} a^x\\
   \int \ln x\,dx &= x \ln x - x\\
   \int \sin x\,dx &= -\cos x\\
   \int \cos x\,dx &= \sin x\\
   \int \tan x\,dx &= \ln |\sec x|\\
   \int \sec x\,dx &= \ln |\sec x + \tan x|\\
   \int \sec^2 x\,dx &= \tan x\\
   \int \sec(x) \tan(x)\,dx &= \sec x\\\end{aligned}

.. math::

   \begin{aligned}
   dxdy=rdrd\theta\end{aligned}

don’t forget to change the limits of integration!

.. math::

   \begin{aligned}
   \frac{d}{dt}(tan^-1(x))&=\frac{1}{1+x^2}\\\end{aligned}

.. math::

   \begin{aligned}
   f(t)&={\ensuremath{\mathcal{L}{\left[f(t)\right]}}}=F(s)\\
   1&=\dfrac{1}{s}\\
   \delta(t)&=1\\
   \delta(t-t_0)&=e^{-st_0}\\
   f'(t)&=sF(s) - f(0) \\
   f^{n}(t)&=s^nF(s) - s^{(n-1)} f(0) - \cdots - f^{(n-1)}(0)\\
   t^n (n=0,1,2,\dots)&=\dfrac{n!}{s^{n+1}}\\
   \sin kt&=\dfrac{k}{s^2+k^2}\\
   \cos kt&=\dfrac{s}{s^2+k^2} \\
   e^{at}&=\dfrac{1}{s-a}\\
   t^ne^{at}&=\dfrac{n!}{(s-a)^{n+1}}\\
   e^{at}\sin kt&=\dfrac{k}{(s-a)^2+k^2}\\
   e^{at}\cos kt&=\dfrac{s-a}{(s-a)^2+k^2}\\
   t\sin kt&=\dfrac{2ks}{(s^2+k^2)^2}\\
   t\cos kt&=\dfrac{s^2-k^2}{(s^2+k^2)^2} \\\end{aligned}

First translation theorom:

.. math::

   \begin{aligned}
   {\ensuremath{\mathcal{L}{\left[e^{at}f(t)\right]}}}&=F(s-a)\\\end{aligned}

.. math::

   \begin{aligned}
   \int_{-\infty}^{\infty} f(x) \delta(x-a) \,dx&=f(a)\\
   \int_{-\infty+\epsilon}^{\infty+\epsilon} f(x) \delta(x-a) \,dx&=f(a), \epsilon>0\\
   \delta(x-a)&=0\\\end{aligned}

Given some nonlinear system of the form:

.. math::

   \begin{aligned}
   \dot{x}(t)&=f(x(t),u(t),t)\\
   y(t)&=g(x(t),t)\end{aligned}

 A linearization can be performed about nominal trajectories
:math:`x^0(t)`, :math:`u^0(t)`, and :math:`u^0(t)` (shorthand is
:math:`0`) by defining the jacobian of w.r.t. the states evaluated at
the nominal trajectories (:math:`0`) as:

.. math::

   \begin{aligned}
   A(t)= \frac{\partial f}{\partial x}\Bigr|_0=
   \begin{bmatrix}
       \frac{\partial f_1}{\partial x_1} & \frac{\partial f_1}{\partial x_2} & \dots  & \frac{\partial f_1}{\partial x_n} \\
       \frac{\partial f_2}{\partial x_1} & \frac{\partial f_2}{\partial x_2} & \dots  & \frac{\partial f_2}{\partial x_n} \\
       \vdots & \vdots & \ddots & \vdots \\
       \frac{\partial f_n}{\partial x_1} & \frac{\partial f_n}{\partial x_2} & \dots  & \frac{\partial f_n}{\partial x_n} \\
   \end{bmatrix}\Bigr|_0\end{aligned}

 As well as the jacobian of w.r.t. the controls evaluated at the nominal
trajectories (:math:`0`) as:

.. math::

   \begin{aligned}
   B(t)= \frac{\partial f}{\partial u}\Bigr|_0=
   \begin{bmatrix}
       \frac{\partial f_1}{\partial u_1} & \frac{\partial f_1}{\partial u_2} & \dots  & \frac{\partial f_1}{\partial u_m} \\
       \frac{\partial f_2}{\partial u_1} & \frac{\partial f_2}{\partial u_2} & \dots  & \frac{\partial f_2}{\partial u_m} \\
       \vdots & \vdots & \ddots & \vdots \\
       \frac{\partial f_n}{\partial u_1} & \frac{\partial f_n}{\partial u_2} & \dots  & \frac{\partial f_n}{\partial u_m} \\
   \end{bmatrix}\Bigr|_0\end{aligned}

Finally, the output equation may need to be linearized about :math:`0`
as well

.. math::

   \begin{aligned}
   C(t)= \frac{\partial g}{\partial x}\Bigr|_0=
   \begin{bmatrix}
       \frac{\partial g_1}{\partial x_1} & \frac{\partial g_1}{\partial x_2} & \dots  & \frac{\partial g_1}{\partial x_n} \\
       \frac{\partial g_2}{\partial x_1} & \frac{\partial g_2}{\partial x_2} & \dots  & \frac{\partial g_2}{\partial x_n} \\
       \vdots & \vdots & \ddots & \vdots \\
       \frac{\partial f_n}{\partial x_1} & \frac{\partial g_n}{\partial x_2} & \dots  & \frac{\partial g_n}{\partial x_n} \\
   \end{bmatrix}\Bigr|_0\end{aligned}

Then the perterbation variables are defined as:

.. math::

   \begin{aligned}
   \delta x(t)=x(t)-x^0(t)\\
   \delta u(t)=u(t)-u^0(t)\\
   \delta y(t)=y(t)-y^0(t)\end{aligned}

The final linearized system is:

.. math::

   \begin{aligned}
   \delta \dot{x}(t)&=A(t)\delta x(t)+B(t)\delta u(t)\\
   \delta y(t)&=C(t)\delta x(t)\end{aligned}

.. math::

   \begin{aligned}
   \dot{x}(t)&=A(t)x(t)\\
   x(t)&=\Phi(t,t_0)x_0\\
   \Phi(t,t_0)&=x(t)x(t_0)^-1\\\end{aligned}

The system is

.. math::

   \begin{aligned}
   \dot{x}(t)&=A(t)x(t)+B(t)u(t) \nonumber\\
   y(t)&=C(t)x(t)\nonumber\\
   x(t_0)&=x_0 \label{eq:sys1}\end{aligned}

 where the solution is,

.. math::

   \begin{aligned}
   x(t)&=\Phi(t,t_0)x_0+\int_{t_0}^t \Phi(t,\tau)B(\tau)u(\tau)\,d\tau \label{eq:sol1}\\
   y(t)&=C(t)\Phi(t,t_0)x_0+\int_{t_0}^t \underbrace{C(t)\Phi(t,\tau)B(\tau)}_{(G(t,\tau))} u(\tau)\,d\tau \nonumber\end{aligned}

The above two equations are called the **variation of constants
formulas**. They contain two terms, the first term is the **free
response** which is due to :math:`x_0` and the second term is the
**forced resonse** due to the input :math:`u(t)`. Additionally, the
**impulse response is** defined as

.. math::

   \begin{aligned}
   G(t,\tau)=C(t)\Phi(t,t_0)B(\tau), \tau \leq t  \label{eq:impulse_response}\end{aligned}

The basic equation is:

.. math::

   \begin{aligned}
   \Phi(t,\tau)&=e^{A(t-\tau)}\\\end{aligned}

 Which can be calculated using:

.. math::

   \begin{aligned}
   {\ensuremath{\mathcal{L}^{-1}{\left[(sI-A)^{-1}\right]}}}&=e^{At}\\\end{aligned}

 After this, :math:`\tau` must be added in, which can be done with by
taking the inverse of :math:`\Phi(\tau,0)` to get :math:`\Phi(0,\tau)`
and then multiplying by :math:`\Phi(t,0)` as:

.. math::

   \begin{aligned}
   \Phi(t,0)\Phi(0,\tau)&=\Phi(t,\tau)\\\end{aligned}

The STM is the unique solution to

.. math::

   \begin{aligned}
   \frac{\partial}{\partial t}(\Phi(t,t_0))=A(t)\Phi(t,t_0)\end{aligned}

 with inital conditions :math:`\Phi(t_0,t_0) =I`.

To solve:

-  multiply the above matrices out

-  take the Laplace Transform of each element in the matrix

-  solve the algebreic equation for each :math:`\Phi_{i,i}(s)`

-  take the inverse Laplace transfrom to find :math:`\Phi_{i,i}(t)`

.. math::

   \begin{aligned}
   \Phi(t_0,t_0) &=I\\
   \Phi(t,t_0)^-1 &=\Phi(t_0,t)\\
   \Phi(t,t_0)&=\Phi(t,t_1)\Phi(t_1,t_0)\\\end{aligned}

The system Eqn. [eq:sys1] is stable if, given :math:`x(t_0)=x_0`,
:math:`x(t)` (Eqn. [eq:sol1]) is bounded is bounded
:math:`\forall t \geq t_0`. In this case,

.. math:: lim_{t\to\infty} x(t)

may not go to zero. Stability can also be determined by looking at each
:math:`(i,j)` component of the STM as:

.. math::

   \begin{aligned}
   |\Phi_{ij}(t,t_0)| \leq k < \infty, \forall t_0 \leq t\end{aligned}

The system Eqn. [eq:sys1] is asymtotically stable if, given
:math:`x(t_0)=x_0` :math:`x(t)`, :math:`x(t)` (Eqn. [eq:sol1]) decays to
zero, that is:

.. math:: lim_{t\to\infty} x(t) = 0

The system, Eqn. [eq:sys1], is BIBO stable if when :math:`x_0=0`, the
forced output response :math:`y(y)` to every bounded input :math:`u(t)`
is bounded. This can be determined as:

.. math::

   \begin{aligned}
   \int_{-\infty}^{t} |G_{ij}(t,\tau)| d\tau \leq k < infty\end{aligned}

 where, :math:`G(t,\tau)` was defined in Eqn. [eq:impulse\_response] and
the above equation requires that :math:`G(t,\tau)` is “absolutely
integrable.”

Can we estimate a unique :math:`x(t_0)=x_0`, given :math:`u(t)` and
:math:`y(t)` over the time interval :math:`[t_0,t_1]`? If we have
:math:`x_0` we can solve

.. math::

   \begin{aligned}
   x(t)&=\Phi(t,t_0)x_0+\int_{t_0}^t \Phi(t,\tau)B(\tau)u(\tau)\,d\tau\\\end{aligned}

 The state is unobservable for the unforced system (:math:`u(t)=0`), if:

.. math::

   \begin{aligned}
   y(t)=C(t)\Phi(t,t_0)x_0=0\end{aligned}

The observability matrix for a LTI system is:

.. math::

   \begin{aligned}
   \mathcal{O}=
   \begin{bmatrix}
   C\\
   CA\\
   \vdots \\
   CA^{n-1}
   \end{bmatrix}\end{aligned}

 if the :math:`rank(\mathcal{O})=n` then the system is observable. The
unobservable states are in the null space of the observability matrix,
i.e. :math:`\mathcal{O}x_0=0`

Observability Gramian

.. math::

   \begin{aligned}
   M(t_0,t_1)=\int_{t_0}^{t_1} \Phi^T(t,t_0)C^T(t)C(t)\Phi^T(t_0,t)dt\end{aligned}

 a state :math:`x_0=x(t_0)` unobservable at time :math:`t_0` iff

.. math::

   \begin{aligned}
   M(t_0,t_1)x_0=0,\forall t_1>t_0\end{aligned}

 so, the unobservable states are in the null-space of the Observability
Gramian. If the only solution that lives in the null-space is the zero
vector :math:`x(t_0)=0`, then the system is completely observable. Also,
note that ther is no need to carry out the complete integral to see that
the Observability Gramian will have unobservable states in its null
space, i.e. integration does not change the form of the matrix.

A system is controllable if we can find a :math:`u(t)` that drives the
state :math:`x(t)` from :math:`x_0` in finite time :math:`t_f`.

The observability matrix for a LTI system is:

.. math::

   \begin{aligned}
   \mathcal{C}=
   \begin{bmatrix}
   B \; BA\; \dots\; BA^{n-1}
   \end{bmatrix}\end{aligned}

 if the :math:`rank(\mathcal{C})=n` then the system is controllable.
Recall that the rank of a matrix is the number of linearly independent
columns.

Controllability Gramian

.. math::

   \begin{aligned}
   W(t_0,t_1)=\int_{t_0}^{t_1} \Phi^T(t,t_0)B(t)B^T(t)\Phi^T(t_0,t)dt\end{aligned}

 this matrix is always symetric and positive definite. The system is
completly controllable if there exists :math:`t_1>t_0`:
:math:`W(t_0,t_1)>0`. If the system is controllable at :math:`t_0`, then
one control that drives the state to the origin is:

.. math::

   \begin{aligned}
   u_0(t)=-B^T(t)\Phi^T(t_0,t)W^{-1}(t_0,t_1)x_0\end{aligned}

Given a LTV system as

.. math::

   \begin{aligned}
   \dot{x}(t)&=A(t)x(t)+B(t)u(t)\\
   y(t)&=C(t)x(t)\end{aligned}

 its dual system is

.. math::

   \begin{aligned}
   \dot{x}(t)&=-A^T(t)x(t)+C^T(t)u(t)\\
   y(t)&=B^T(t)x(t)\end{aligned}

 The controllable (or uncontrollable) states of one system are the
observable (or unobservable) states of the other system.

If :math:`x` is a random vector with a PDF :math:`f(x)` and
:math:`g:{\mathbb{R}}_n \rightarrow {\mathbb{R}}_m` is a function of
:math:`x`

.. math::

   \begin{aligned}
   E[g(x)]&=\int_{{\mathbb{R}}_n} g(x)f(x)\,dx \in {\mathbb{R}}_m\\\end{aligned}

.. math::

   \begin{aligned}
   \bar{x}&=E[x]=\int_{{\mathbb{R}}_n} xf(x)\,dx \in {\mathbb{R}}_n\end{aligned}

.. math::

   \begin{aligned}
   P_{xx}&=E[(x-\bar{x})(x-\bar{x})^T]\\
   &=\int_{{\mathbb{R}}_n} (x-\bar{x})(x-\bar{x})^T f(x)\,dx \in {\mathbb{R}}_{nxn}\\\end{aligned}

Note: the covariance matrix is symmetric as well as positive
semidefinite, so

.. math::

   \begin{aligned}
   \forall v \in {\mathbb{R}}_n, v^TP_xv\geq0\end{aligned}

 Thus,

.. math::

   \begin{aligned}
   v^TP_xv&=\int_{R_n} v^T (x-\bar{x})(x-\bar{x})^Tvf(x)\,dx\\
   &=\int_{R_n} (x-\bar{x})^2f(x)\,dx \geq 0\end{aligned}

If :math:`x1` and :math:`x2` are subvectors of :math:`x`

.. math::

   \begin{aligned}
   P_{x_1x_2}&=E[(x_1-\bar{x_1})(x_2-\bar{x_2})^T]\\
   &=\int_{{\mathbb{R}}_n} (x_1-\bar{x_1})(x_2-\bar{x_2})^T f(x)\,dx \in {\mathbb{R}}_{n_1xn_2}\\\end{aligned}

.. math::

   \begin{aligned}
   P^+=((P^-)^{-1}+C^TR^{-1}C)^{-1}\end{aligned}

The relative likelyhood that a random variable :math:`x` will take on
vaules on a given interval.

.. math::

   \begin{aligned}
   Area=P(a \leq x \leq b) = \int_a^b f_x(x) dx\end{aligned}

If you integrate over the PDF over the entire range then it must equal
:math:`1` and the PDF must always be greater than :math:`0`.

.. math::

   \begin{aligned}
   \int_{{\mathbb{R}}} f_x dx=1
   \forall x, f_x(x) \geq 0\end{aligned}

For a PDF uniformly distributed over :math:`[a,b]`,
:math:`f(x)=constant=c`. :math:`c` can then be determined by
:math:`\int_a^b c dx=1` which results in :math:`f(x)=\frac{1}{b-a}`.

Given the joint PDF :math:`f_x(x)=f_x(x_1,x_2)`, the marginal PDF of
:math:`x_1` is:

.. math::

   \begin{aligned}
   f_{x_1}(x_1)=\int_{-\infty}^{\infty} f_x(x_1,x_2) dx_2\end{aligned}

:math:`\phi_x(s)` is useful to compute the PDF for :math:`x` and the
Gaussian distribution. The expected value can be used to calculate the
characteristic function as:

.. math::

   \begin{aligned}
   \phi_x(s)&=E[e^{jx^Ts}]=\int_{{\mathbb{R}}_{n}} e^{jx^Ts}f(x)\,dx\\\end{aligned}

 where :math:`j^2=-1` and :math:`s` is a complex vector of order
:math:`n`

The statistal properties of :math:`x` are equivalently specified by PDF
:math:`f(x)` or by the characteristic function :math:`\phi_x(s)`.

Similar to a Fourier Transform :math:`\phi_x(s)` can be put back into
the time domain with:

.. math::

   \begin{aligned}
   f(x)&=\frac{1}{(2 \pi)^n}\int_{{\mathbb{R}}_{n}} e^{jx^Ts} \phi_x(s),ds\\\end{aligned}

If the following equations are true, then the PDF’s are independent.

.. math::

   \begin{aligned}
   f(x,y)&=f_x(x)f_y(y)\\
   \phi_{xy}(s,r)&=\phi_x(s)\phi_y(r)\\\end{aligned}

If :math:`x` and :math:`y` are independent, the conditional density
function and conditional mean satisfy:

.. math::

   \begin{aligned}
   f(x|y)&=\frac{f(x,y)}{f_y(y)}=\frac{f_x(x)f_y(y)}{f_y(y)}=f_x(x)\\
   E[x|y]&=\int_{{\mathbb{R}}_{n}} xf_x(x)\,dx=E[x]=\bar{x}\end{aligned}

| If x and y are independent, then they are uncorrelated. But, if they
  are uncorrelated, they may not be independent!
| If :math:`x` and :math:`y` are uncorrelated, then they satisfy:

  .. math::

     \begin{aligned}
     E[xy^T]=E[x]E[y^T]\end{aligned}

If :math:`x` and :math:`y` are uncorrelated, the cross-covariances must
be zero:

.. math::

   \begin{aligned}
   P_{xy}&=E[(x-\bar{x})(y-\bar{y})^t]\\
   &=E[xy^T-x\bar{y}^T-\bar{x}y+\bar{x}\bar{y}^T]\\
   &=E[xy^T]-E[x]\bar{y}^T-\bar{x}E[y^T]+\bar{x}\bar{y}^T\\
   &=E[xy^T]-\bar{x}\bar{y}^T-\bar{x}\bar{y}^T+\bar{x}\bar{y}^T\\
   &=E[xy^T]-\bar{x}\bar{y}^T=0\\\end{aligned}

Why model the probablity densit function as a Gaussian (or normal)
distribution:

-  provides a good statistical model for many natural phenomina

-  computationally tractable because the statistical properties are
   described completely by first (mean, :math:`\bar{x}`) and second
   (variance, :math:`P`) moments

-  normality is preserved through linear transforms (both static and
   dynamic)

A random vector :math:`x \in {\mathbb{R}}_n` is Gaussian distributed or
normal if the characteristic function has the form:

.. math::

   \begin{aligned}
   \phi_x(s)=e^{j\bar{x}^Ts-\frac{1}{2}s^TPs}\end{aligned}

 where :math:`s \in \, C_n`, :math:`\bar{x}=E[x]`, and
:math:`P=[(x-\bar{x})(x-\bar{x})^T]`.

-  For such a random vector, we use the notation :math:`x=N(\bar{x},P)`.

-  Two vectors :math:`x` and :math:`y` are jointly Gaussian distributed
   if :math:`(x^T,y^T)` is Gaussian.

-  When a random vector :math:`x` is Gaussian and it’s covariance matrix
   :math:`P_x` is nonsingular, it’s PDF can be evaluated with:

   .. math::

      \begin{aligned}
      f(x)=\frac{e^{-\frac{1}{2}(x-\bar{x})^TP_x^{-1}(x-\bar{x})}}{\sqrt{(2\pi)^ndet(P_x)}}\end{aligned}

If :math:`P_x` is singular, then the above equation will not work, but
the characteristic function can define the Gaussian distribution
indirectly.

In a random process, we are looking at a family of random vectors
(:math:`x(t),t\in I`) indexed by time.

.. math::

   \begin{aligned}
   \bar{x}(t)&=E[x(t)], t \in I\end{aligned}

.. math::

   \begin{aligned}
   P(t,\tau)=E[(x(t)-\bar{x}(t))(x(t)-\bar{x}(t))^T],t \in I\end{aligned}

For two random processes :math:`x(t)` and :math:`y(t)`

.. math::

   \begin{aligned}
   P_{xy}(t,\tau)=E[(x(t)-\bar{x}(t))(y(t)-\bar{y}(t))^T],t \in I\end{aligned}

Which satisfies:

.. math::

   \begin{aligned}
   P(t)=E[x(t)x^T(t)]-\bar{x}(t)\bar{x}^T(t)\end{aligned}

Which satisfies:

.. math::

   \begin{aligned}
   P_{xy}(t)=E[x(t)y^T(t)]-\bar{x}(t)\bar{y}^T(t)\end{aligned}

todo..

todo..

This section combines the ideas of **Gaussian distribution** and
**random process**

-  a random process is :math:`x(t)` is **Gaussian** if all of the
   vectors :math:`x_1(t)`,...\ :math:`x_n(t)` are jointly Gaussian

-  a Gaussian random process is **white** if the vectors :math:`x(t_1)`,
   ...\ :math:`x(t_m)` are independent, otherwise it is **colored**

-  for a **Gaussian** and **white** process, the **covariance kernal**
   satisfies

   .. math::

      \begin{aligned}
      P(t,\tau)&=0,t \neq \tau\\
      P(t,\tau)&=Q(t)\delta(t-\tau)\end{aligned}

-  a random process is **Markov** if

   .. math::

      \begin{aligned}
      &f(x(t_m)|x(t_{m-1}),...,x(t_1))=f(x(t_m)|x(t_{m-1}))\end{aligned}

-  a random process is **Gauss-Markov** if it is both **Gauss** and
   **Markov**

The standard model is:

.. math::

   \begin{aligned}
   \dot{x}(t)&=A(t)x(t)+B(t)u(t)+w(t), t \geq t_0\\
   y(t)&=C(t)x(t)+v(t)\label{eq:sys2}\end{aligned}

#. the intial condition :math:`x(t_0)` is Gaussian

   .. math::

      \begin{aligned}
      x(t_0)&=N(\bar{x}(t_0),P(t_0))\end{aligned}

#. the disturbance :math:`w(t)` is a zero-mean, Gaussian, white process
   that is independent of :math:`x(t_0)`

   .. math::

      \begin{aligned}
      E[w(t)]&=0\\
      E[w(t)w^T(\tau)]&=\underbrace{R_w(t)\delta(t-\tau)}_{covariance\;kernal}\\
      E[w(t)(x(t_0-\bar{x}(t_0))^T]&=0\end{aligned}

    **EX:** in the case of a :math:`2X2` system, if there is some
   covariance :math:`\sigma_w` given for the second state variable then

   .. math::

      \begin{aligned}
      R_w(t)=
      \begin{bmatrix}
      0 &0\\
      0 &\sigma_w
      \end{bmatrix}\end{aligned}

#. the measurment noinse :math:`v(t)` is a zero-mean, Gaussian, white
   process that is independent of :math:`x(t_0)`

   .. math::

      \begin{aligned}
      E[v(t)]&=0\\
      E[v(t)v^T(\tau)]&=R_v(t)\delta(t-\tau)\\
      E[v(t)(x(t_0-\bar{x}(t_0))^T]&=0\end{aligned}

#. the processes :math:`v(t)` and :math:`w(t)` are uncorrelated

   .. math::

      \begin{aligned}
      E[w(t)v^T(t)]=0\end{aligned}

With the standard model and assumptions, the process :math:`x(t)` is
**Markov**.

Recall the variation of consants formula:

.. math::

   \begin{aligned}
   x(t)&=\Phi(t,t_0)x(t_0)+\int_{t_0}^{t} \Phi(t,\tau) B(\tau)u(\tau)d\tau +...\\
   &+ \int_{t_0}^{t}\Phi(t,\tau)w(\tau)d\tau \end{aligned}

 Then,

.. math::

   \begin{aligned}
   x(t_m)&=\Phi(t_m,t_{m-1})x(t_{m-1})+...\\
   &+ \int_{t_{m-1}}^{t_m} \Phi(t_m,\tau)(B(\tau)u(\tau)+ w(\tau))d\tau \end{aligned}

 Notice that the results does not depend on :math:`x(\tau)`,
:math:`\tau < t_{m-1}`.

Also refered to as the expected value.

.. math::

   \begin{aligned}
   \bar{x}(t)=\Phi(t,t_0)\bar{x}(t_0)+\int_{t_0}^{t} \Phi(t,\tau) B(\tau)u(\tau)d\tau \end{aligned}

.. math::

   \begin{aligned}
   \bar{y}(t)=E[C(t)x(t)+v(t)]=C(t)\bar{x}(t)\end{aligned}

Using :math:`x(t)-\bar{x}(t)` we can define:

.. math::

   \begin{aligned}
   P(t)=\Phi(t,t_0)P(t_0)\Phi^T(t,t_0)+\int_{t_0}^{t} \Phi(t,\tau) R_w(\tau)\Phi^T(t,\tau)d\tau \end{aligned}

 The above equation also satisfies the Lyapunov Equation.

For the output :math:`y(t)`:

.. math::

   \begin{aligned}
   P_y(t)=C(t)P(t)C^T(t)+R_v(t)\end{aligned}

with the standard model and assumptions, the covariance matrix
satisfies:

.. math::

   \begin{aligned}
   \dot{P}(t)&=A(t)P(t)+P(t)A^T(t)+R_w(t)\end{aligned}

 Which can be derived using the **Leibniz Integral Rule**.

To find the steady state covariance matrix:

-  set :math:`\dot{P}(t)=0`

-  then solve for :math:`P_{ss}`

   -  this will require a computer!

For the state :math:`x(t)`:

.. math::

   \begin{aligned}
   P_x(t,\tau)=\Phi(t,t_0)P(t_0)\Phi^T(t,t_0)+\int_{t_0}^{t} \Phi(t,\sigma) R_w(\sigma)\Phi^T(t,\sigma)d\sigma \end{aligned}

For the output :math:`y(t)`:

.. math::

   \begin{aligned}
   P_y(t,\tau)=C(t)\Phi(t,t_0)P(t_0)\Phi^T(t,t_0)C^T(\tau)+ \\
   \int_{t_0}^{t} C(t)\Phi(t,\sigma) R_w(\sigma)\Phi^T(t,\sigma)C^T(\tau)d\sigma +R_v(t)\delta(t-\tau) \end{aligned}

After evaluating :math:`\frac{f(x,y)}{f_y(y)}`, the result is PDF of a
Guassian vector defined as:

.. math::

   \begin{aligned}
   f(x|y)=\frac{e^{-\frac{1}{2}(x-E^T[x|y])^TP^{-1}_{x|y}(x-E[x|y])}}{\sqrt{(2\pi)^ndet(P_{x|y}})}\end{aligned}

 with a mean and covariance defined as follows:

.. math::

   \begin{aligned}
   E[x|y]&=\bar{x}+P_{xy}P^{-1}_y(y-\bar{y})\\\end{aligned}

.. math::

   \begin{aligned}
   P_{x|y}&=P_x+P_{xy}P^{-1}_yP_{yx}\end{aligned}

Basic estimation procedure is:

#. determine :math:`\hat{x}^-=\bar{x}` which is an estimate of the state

   -  based off of state equations

   -  affected by state uncertainty, :math:`w(t)`

#. collect measurments from output equation :math:`y(t)`

#. update estimate of state (:math:`\hat{x}^-`) based off of new info
   from :math:`y(t)`

   -  based off of output equation

   -  affected by sensor uncertainty, :math:`v(t)`

Measurments are incorporated simultaneously.

.. math::

   \begin{aligned}
   \hat{x}^+&=\hat{x}^-+k(z-C\hat{x}^-)\\
   P^+&=P^-C^T(CP^-C^T+R)^{-1}\end{aligned}

 where, :math:`k=P^-C^T(CP^-C^T+R)^{-1}` or in an algebraically
equivalent form,

.. math::

   \begin{aligned}
   \hat{x}^+&=(P^+(P^-)^{-1})\hat{x}^-+(P^+C^TR^{-1})z\\
   P^+&=((P^-)^{-1}+C^TR^{-1}C)^{-1}\end{aligned}

 where :math:`R` is the covariance of the sensor measurment from
:math:`y(t)`

also note: :math:`z=y`

Measurments are incorporated recursively.
