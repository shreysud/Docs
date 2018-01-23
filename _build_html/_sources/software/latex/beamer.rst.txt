Beemer
=======

Adobe Reader
--------------
http://www.ubuntugeek.com/install-adobe-reader-in-ubuntu-16-04.html

Convert to Individual Files
----------------------------
https://tex.stackexchange.com/questions/240243/getting-gif-and-or-moving-images-into-a-latex-presentation

type:
::

  convert -coalesce something.gif something.png



Syntax Highlighting: listings
------------------------------

http://users.ecs.soton.ac.uk/srg/softwaretools/document/start/listings.pdf


Syntax Highlighting: minted
------------------------------
\usepackage{minted}

which needs:
::

  sudo apt-get install python-pygments

OLD
----
http://heather.cs.ucdavis.edu/~matloff/beamer.html

FFmpeg
-------
https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu

https://stackoverflow.com/questions/10225403/how-can-i-extract-a-good-quality-jpeg-image-from-an-h264-video-file-with-ffmpeg


Change quality:
::

  ffmpeg -i input.mp4 -qscale:v 2 output_%03d.jpg



Embedding movies1:
------------------
https://tex.stackexchange.com/questions/252348/how-to-embed-a-video-in-beamer-and-reproduce-it-by-using-okular


code:
::

  \usepackage[loop,controls,buttonsize=0.24cm,buttonbg=0.8,autoplay]{animate}
  %% normal frame
  \begin{frame}{Why julia?}
    \begin{figure}
          \centering
            \animategraphics[loop,width=\textwidth,every=1]{100}{videos/v1/out_}{1}{1199}
          \caption{Our Algorithms where not Solving in Real-Time!}
    \end{figure}
  \end{frame}

Embedding movies2:
------------------
https://tex.stackexchange.com/questions/240243/getting-gif-and-or-moving-images-into-a-latex-presentation


Embedding movies3:
----------------------
https://tex.stackexchange.com/questions/429/animation-in-pdf-presentations-without-adobe-reader

animate package
----------------
http://mirror.hmc.edu/ctan/macros/latex/contrib/animate/animate.pdf

Viewing slides
----------------
Okular:
::

  sudo apt-get install okular

xPDF
----
install:
::

  sudo apt-get update
  sudo apt-get install xpdf
