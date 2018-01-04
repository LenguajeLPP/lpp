package org.lpp.constructs.sentencias;

import io.norberg.automatter.AutoMatter;
import java.util.List;
import org.lpp.constructs.expresiones.Expresion;

@AutoMatter
public interface Caso extends Sentencia {
  Expresion expr();
  List<OpcionCaso> opciones();
}
