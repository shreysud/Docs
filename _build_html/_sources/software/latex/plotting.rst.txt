Plotting
##############


PGFPlots
==========
Documented `here <http://pgfplots.sourceforge.net/pgfplots.pdf>`_


TikZ and PGF
=============
Documentation `is here <https://www.bu.edu/math/files/2013/08/tikzpgfmanual.pdf>`_


With julia
==============

  * a recent package is `PGFPlotsX <https://github.com/KristofferC/PGFPlotsX.jl>`_
  * the original package is `PGFPlots <https://github.com/sisl/PGFPlots.jl>`_



Miscellaneous
=================

`How to include a ``.svg`` into LaTex <http://anorien.csc.warwick.ac.uk/mirrors/CTAN/info/svg-inkscape/InkscapePDFLaTeX.pdf>`_
--------------------------------------------------------------------------------------------------------------------------------
MWE:
::

  \documentclass[]{memoir}
  \usepackage{svg}
  \setsvg{inkscape=inkscape -z -D,svgpath=figs/}

  \begin{document}

  \begin{figure}[!ht]
   \centering
   \includesvg[width=0.5\columnwidth, svgpath = ./relativePATHtoSVG/]{filename}
  \end{figure}

  \end{document}
