# Codetails Lambdacto:  (14/6/2016)

    $ git clone https://github.com/nando/lambdacto
    $ cd doc/codetails_lambdacto

Presentación escrita para **Terminal Keynote (Tkn)** cuyo script está dentro de la carpeta *tkn-src*. Para instalarnos sus dependencias ejecutamos `bundle` desde dicha carpeta:

    $ cd tkn-src && bundle && cd ..

Finalmente, **para ver la presentación** lanzamos el `tkn` con la presentación como parámetro:

    $ tkn-src/bin/tkn codetails_lambdacto.rb

Para movernos podemos utilizar las flechas, PageUp, PageDown, así como otras teclas que están en el README de **Tkn**:

https://github.com/fxn/tkn#keyboard-controls-and-remotes

Especialmente útil es la de **desplazarse directamente hasta una slide** concreta pulsando **la tecla "G"** seguida del número de la slide.

No debería ser necesario tener que utilizar la información que contiene, pero las versiones concretas de las dependencias utilizadas para ver este Codetails están en el fichero *tkn-src-gemfile.lock*.

Espero que os guste.

Saludos,
-- nando
