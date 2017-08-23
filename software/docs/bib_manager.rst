Manging References
===================

Properly managing references is a critical habit and these are some of the useful software tool that I use to manage my references.

Using Sphinx BibTex extension
-------------------------------
 `Sphinx BibTex extension <https://sphinxcontrib-bibtex.readthedocs.io/en/latest/>`_

* To install

 Do this:
 ::

   pip install sphinxcontrib-bibtex

   In ``conf.py`` add:
   ::

     extensions = ['sphinxcontrib.bibtex']

  * MAKE SURE * that it is *added* to the rest of extensions!! Not just at the top, it will be removed!!!Ahh

  Like this:

  ::

    extensions = [
        'sphinx.ext.autodoc',
        'sphinx.ext.doctest',
        'sphinx.ext.intersphinx',
        'sphinx.ext.todo',
        'sphinx.ext.coverage',
        'sphinx.ext.mathjax',
        'sphinx.ext.ifconfig',
        'sphinxcontrib.bibtex',
        ]

Also, you can avoid these errors on readthedocs.com:
::

  python /home/docs/checkouts/readthedocs.org/user_builds/nloptcontroljl/envs/latest/bin/pip install --exists-action=w --cache-dir /home/docs/checkouts/readthedocs.org/user_builds/nloptcontroljl/.cache/pip -rpip install sphinxcontrib-bibtex
  Could not open requirements file: [Errno 2] No such file or directory: 'pip install sphinxcontrib-bibtex'
  You are using pip version 8.1.2, however version 9.0.1 is available.
  You should consider upgrading via the 'pip install --upgrade pip' command.
  Command time: 0s Return: 1

By typing:
::

  requirements.txt

Into the Advanced Settings Page and making a `requirements.txt <https://pip.pypa.io/en/latest/reference/pip_install/#pip-install-examples>`_ file with:
::

  pip install --upgrade pip
  pip install sphinxcontrib-bibtex

More on this is `here <https://github.com/huckl3b3rry87/NLOptControl.jl/issues/2#issuecomment-268052941>`

Example:
To cite:
::

  according to :cite:`someone` yada yada..

Then, at the end of the document include:
::

  .. bibliography:: references.bib


JabRef
-------

BibTex files can be managed with a free software called `JabRef <http://www.jabref.org/>`_


EndNote
--------

I still use this tool, but it costs money and I do not have it on Ubuntu.
