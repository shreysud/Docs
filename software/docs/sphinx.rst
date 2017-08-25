Sphinx
*********

`Installation <http://www.sphinx-doc.org/en/stable/>`_
=========================================================

In the terminal run:
::

  pip install sphinx


  * `Uninstall <https://pip.pypa.io/en/stable/reference/pip_uninstall/>`_


Useful Resources
===================

  * `an awesome video introduction <https://www.youtube.com/watch?v=QNHM7q2hLh8>`_
  * `toctree <http://www.sphinx-doc.org/en/stable/markup/toctree.html>`_
  * `basic commands and syntax <http://www.sphinx-doc.org/en/stable/rest.html#rst-primer>`_
  * `useful resource <http://openalea.gforge.inria.fr/doc/openalea/doc/_build/html/source/sphinx/rest_syntax.html>`_
  * `making sections <https://docs.python.org/devguide/documenting.html#sections>`_

Common Commands
===================
To start documenting:
::

  sphinx-quickstart

To manually build documentation:
::

  make html

To clean out an old build folder when things have changed significantly:
::

  make clean

Images:
::

  .. image:: gnu.png

To make a comment:
::

  .. Comment here


Something

    .. Comment


To make a warning
------------------
Type:
::

  .. warning:: this is a warning

Which looks like this:

.. warning:: this is a warning



To make a note
----------------
Type:
::

  .. note:: please be careful with spacing!


Which looks like this:

.. note:: please be careful with spacing!


To make a todo box
--------------------
Type:
::

  .. todo:: testing


Which looks like this:

.. todo:: testing



`changing the themes <http://www.sphinx-doc.org/en/stable/theming.html>`_
-----------------------------------------------------------------------------

* In ``conf.py`` change:
  ::

    html_theme = 'haiku'

* Or a main one:
  ::

    import sphinx_rtd_theme
    html_theme = "sphinx_rtd_theme"
    html_theme_path = [sphinx_rtd_theme.get_html_theme_path()]

* An `awesome theme <https://github.com/snide/sphinx_rtd_theme>`_

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

.. warning:: that it is *added* to the rest of extensions!! Not just at the top, or it will be removed!!! 

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

More on this is `here <https://github.com/huckl3b3rry87/NLOptControl.jl/issues/2#issuecomment-268052941>`_

Example:
To cite:
::

  according to :cite:`someone` yada yada..

Then, at the end of the document include:
::

  .. bibliography:: references.bib

Useful Work-flow Technique
============================
Setting up a server to build the documentation when a change is detected.

Installation:
::

  pip install sphinx-autobuild

Then go into your main directory and type:
::

  sphinx-autobuild docs docs/_build/html

Or the directory that contains ``conf.py`` and type:
::

  sphinx-autobuild . _build_html

Then visit the website: http://127.0.0.1:8000/

 * This will show you the live changes (after each save!!)

More information can be found using `this resource <https://pypi.python.org/pypi/sphinx-autobuild>`_.

Useful Software
==================

Read The Docs
----------------

To get it:
::

  pip install sphinx_rtd_theme

`Read the Docs <http://docs.readthedocs.io/en/latest/index.html>`_ is useful resource to host the webpage.

Some Issues:
^^^^^^^^^^^^^

  * The git repository for OCP is private and this website `only hosts public repositories <https://bash-shell.net/private-read-docs-private-github-repo/>`_.
  * Had to remove the last line here in ``conf.py`` for the code to work with ReadtheDocs.

  like this:
    ::

        extensions = [
            'sphinx.ext.autodoc',
            'sphinx.ext.doctest',
            'sphinx.ext.intersphinx',
            'sphinx.ext.todo',
            'sphinx.ext.coverage',
            'sphinx.ext.mathjax',
            'sphinx.ext.ifconfig',
            'sphinx.ext.viewcode',
            'sphinxcontrib.bibtex',
        ]
        #    'sphinx.ext.githubpages',

  * Had to make sure that the name of the project was correct
  * Had to make sure that the webhook was activated on github

`MkDocs  <http://www.mkdocs.org/>`_
--------------------------------------



Potential Issues
======================
1. Make sure that the "toctree" is indented by 3 space characters.  I listed the .rst files by 4 space characters and this created an issue. To resolve the issue, you need to have the same indentation level.
2. When cross referencing things in the document make sure you skip a space when you define the ref.

  * like this

    works:
    ::

      .. _ploy_div:

      Polynomial Division
      -------------------

  * not like this

    fails:
    ::

      .. _ploy_div:
      Polynomial Division
      -------------------

3. Trying to uninstall sphinx so that I could get a newer version without bugs:
::

  febbo@febbo-HP-ZBook-17-G2:~/Desktop/useful downloads$ pip uninstall sphinx
  Cannot remove entries from nonexistent file /home/febbo/anaconda3/lib/python3.5/site-packages/easy-install.pth

The `problem <https://github.com/ContinuumIO/anaconda-issues/issues/542>`_:
This probably won't work:
::

  conda update setuptools

The fix, was to download ``ez_setup.py`` from `this link <https://pypi.python.org/pypi/setuptools#installation-instructions>`_  and run it in the terminal:
::

  febbo@febbo-HP-ZBook-17-G2:~$ python ez_setup.py

Then I could uninstall Sphinx-1.4.1:
::

  febbo@febbo-HP-ZBook-17-G2:~$ pip uninstall sphinx
  Uninstalling Sphinx-1.4.1:
  /home/febbo/anaconda3/bin/sphinx-apidoc
  /home/febbo/anaconda3/bin/sphinx-autogen
  /home/febbo/anaconda3/bin/sphinx-build
  /home/febbo/anaconda3/bin/sphinx-quickstart
  /home/febbo/anaconda3/lib/python3.5/site-packages/Sphinx-1.4.1-py3.5.egg
  Proceed (y/n)? y
  Successfully uninstalled Sphinx-1.4.1

There was reason I needed to uninstall this version of Sphinx was because the citations where not working.

Finally I installed Sphinx-1.5.2:
::

   #Install from newest dev version in stable branch::
   pip install git+https://github.com/sphinx-doc/sphinx@stable
