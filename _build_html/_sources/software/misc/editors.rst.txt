Different Text Editors
======================
I tried a few different text editors, but this one I really like and it is very similar to coding in MATLAB. It is a tool called `JUNO <http://junolab.org/>`_ that basically links a nice text editor called Atom to julia, so that you can run julia interactively.


Atom
----

`Atom Flight Manual <http://flight-manual.atom.io/>`_

Useful things:

`spell check <https://github.com/atom/spell-check>`:
::

  ctrl+shift+;

Markdown Preview Package:
::

  ctr+shift+m

https://github.com/atom/markdown-preview

Subscripts:
::

  variable\_1+tab

Using :math:`/LaTeX` with Atom. It was suggested to use `Tex Live <https://www.tug.org/texlive/acquire-netinstall.html>` Where the `quick install instructions are here<https://www.tug.org/texlive/quickinstall.html>`
https://atom.io/packages/latex

TeX Live
---------
I use this with Atom.

https://www.tug.org/texlive/
https://atom.io/packages/latex

After installing TeX Live:
* Add /usr/local/texlive/2016/texmf-dist/doc/info to INFOPATH.
* Add /usr/local/texlive/2016/texmf-dist/doc/man to MANPATH (if not dynamically found).
* Most importantly, add /usr/local/texlive/2016/bin/x86_64-linux to your PATH for current and future sessions.

To do this change the bashrc file:
::

  gksu gedit /etc/bash.bashrc

Paste this at the end:
::

 PATH=/usr/local/texlive/2016/bin/x86_64-linux:$PATH; export PATH # make sure that there are NO spaces
 MANPATH=/usr/local/texlive/2016/texmf-dist/doc/man:$MANPATH; export MANPATH
 INFOPATH=/usr/local/texlive/2016/texmf-dist/doc/info:$INFOPATH; export INFOPATH

Then in Atom, go to settings and add the path to the texlive:
::

  /usr/local/texlive/2016/bin/x86_64-linux


Potential Issues
----------------
* If the julia binary is not where it belongs ( for instance I put it in my /opt/... folder)

    * Change the julia ``.config`` file (in Atom) to the proper folder (where julia binaries are)

* Otherwise
    * leave it as : juliaPath: "julia"

I had to:
::

  Pkg.clone("https://github.com/JunoLab/Juno.jl")
  Pkg.update()

Make sure you close both atom and julia after installation. Now you should be able to run julia from Atom!
