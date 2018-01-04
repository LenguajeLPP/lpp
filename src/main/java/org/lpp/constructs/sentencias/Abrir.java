package org.lpp.constructs.sentencias;

import io.norberg.automatter.AutoMatter;
import org.lpp.constructs.expresiones.Expresion;

@AutoMatter
public interface Abrir extends Sentencia {
  Expresion rutaArchivo();
  Expresion variable();
  boolean lectura();
  boolean escritura();
}
