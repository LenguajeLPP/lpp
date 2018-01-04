package org.lpp.constructs.sentencias;

import io.norberg.automatter.AutoMatter;
import org.lpp.constructs.expresiones.Expresion;

@AutoMatter
public interface Cerrar extends Sentencia {
  Expresion variable();
}
