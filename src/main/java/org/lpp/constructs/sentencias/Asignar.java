package org.lpp.constructs.sentencias;

import io.norberg.automatter.AutoMatter;
import org.lpp.constructs.expresiones.Expresion;

@AutoMatter
public interface Asignar extends Sentencia {
  Expresion variable();
  Expresion expr();
}
