Reference Management
======================

Java (JabRef -- references)
----------------------------
BibTex files can be managed with a free software called `JabRef <http://www.jabref.org/>`_

First I tried a few things including:
::

  sudo apt-get install default-jre
  sudo apt-get update

And:
::

  sudo add-apt-repository ppa:openjdk-r/ppa
  sudo apt-get update
  sudo apt-get install openjdk-7-jre

This messed stuff up and then I deleted all of my old java versions using:
::

  sudo natilus

Ended up needing to follow `this advice <http://askubuntu.com/questions/251213/unable-to-install-default-jdk
>`:
::

  sudo add-apt-repository ppa:webupd8team/java
  sudo apt-get update
  sudo apt-get install oracle-java8-installer
  java -version
  sudo apt-get install oracle-java8-set-default

This finally worked and I was able to run JabRef with no problem using:
::

  java -jar JabRef-3.8.jar

If something is broken:
::

  sudo apt-get -f install



EndNote
--------

I still use this tool, but it costs money and I do not have it on Ubuntu.
