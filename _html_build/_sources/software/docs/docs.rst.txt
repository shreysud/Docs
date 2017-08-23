Creating Documentation
======================


.. _getting_started_with_docs:

Sphinx
------
1. `Installation <http://www.sphinx-doc.org/en/stable/>`_

Or in the terminal run:
::

  pip install sphinx

1.b. `Uninstall <https://pip.pypa.io/en/stable/reference/pip_uninstall/>`_

2. Getting Started

    * `an awesome video introduction <https://www.youtube.com/watch?v=QNHM7q2hLh8>`_
    * `toctree <http://www.sphinx-doc.org/en/stable/markup/toctree.html>`_
    * `basic commands and syntax <http://www.sphinx-doc.org/en/stable/rest.html#rst-primer>`_
    * `useful resource <http://openalea.gforge.inria.fr/doc/openalea/doc/_build/html/source/sphinx/rest_syntax.html>`_
    * `making sections <https://docs.python.org/devguide/documenting.html#sections>`_

    * Common commands:

      * To start documenting:
        ::

          sphinx-quickstart

      * To manually build documentation:
        ::

          make html

      * To clean out an old build folder when things have changed significantly:
        ::

          make clean

      * `changing the themes <http://www.sphinx-doc.org/en/stable/theming.html>`_
          In ``conf.py`` change:
          ::

            html_theme = 'haiku'

          Or a my main one:
          ::

            import sphinx_rtd_theme
            html_theme = "sphinx_rtd_theme"
            html_theme_path = [sphinx_rtd_theme.get_html_theme_path()]

        *  here is an `awesome theme <https://github.com/snide/sphinx_rtd_theme>`_

3. Some issues that I ran into:

  * Make sure that the "toctree" is indented by 3 space characters.  I listed the .rst files by 4 space characters and this created an issue. To resolve the issue, you need to have the same indentation level.
  * When cross referencing things in the document make sure you skip a space when you define the ref.

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

4. Setting up a server to build the documentation when a change is detected.

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

Read The Docs
-------------

To get it:
::
  pip install sphinx_rtd_theme

`Read the Docs <http://docs.readthedocs.io/en/latest/index.html>`_ is useful resource to host the webpage.

Some Issues:

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

MkDocs
------
Another nice looking tool is `MkDocs <http://www.mkdocs.org/>`_.

Documentor.jl
-------------
Another nice looking tool `is here <https://juliadocs.github.io/Documenter.jl/stable/>`_.



Pandoc
-------
To convert docs
http://pandoc.org/try/


Markdown
---------
https://atom.io/packages/markdown-writer

Directorty structure

https://toolchain.gitbook.com/structure.html


GitBook Toolchain Documentation
--------------------------------
https://www.gitbook.com/book/gitbookio/docs-toolchain/details

Download https://www.gitbook.com/editor

plugin for Atom: https://github.com/cthos/atom-gitbook
