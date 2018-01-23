linux
======================
.. toctree::
   :maxdepth: 2

   linux
   video


JabRef and LibreOffice
--------------------------

http://help.jabref.org/en/OpenOfficeIntegration
http://homepage.usys.ethz.ch/eugsterw/knowhow/jabref-libreoffice/
ls $(which soffice)
ls $(which soffice) -l
locate libreoffice
https://onetransistor.blogspot.com/2015/04/libreoffice-bibliography-jabref.html

http://homepage.usys.ethz.ch/eugsterw/knowhow/jabref-libreoffice/

cd /usr/lib/openoffice/program/soffice


febbo@febbo-HP-ZBook-17-G2:/usr/lib/libreoffice/program$ locate unoil.jar
/usr/lib/libreoffice/program/classes/unoil.jar
/usr/share/java/unoil.jar
/usr/share/libreoffice/program/classes/unoil.jar



febbo@febbo-HP-ZBook-17-G2:/usr/lib/libreoffice/program$ locate jurt.jar
/usr/lib/libreoffice/program/classes/jurt.jar
/usr/share/java/jurt.jar

Need to make symbolic links to the following java files:

febbo@febbo-HP-ZBook-17-G2:/usr/share/libreoffice/ure-link/share/java$ sudo ln -s /usr/lib/libreoffice/program/classes/jurt.jar
febbo@febbo-HP-ZBook-17-G2:/usr/share/libreoffice/ure-link/share/java$ sudo ln -s /usr/lib/libreoffice/program/classes/juh.jar
febbo@febbo-HP-ZBook-17-G2:/usr/share/libreoffice/ure-link/share/java$ sudo ln -s /usr/lib/libreoffice/program/classes/ridl.jar
