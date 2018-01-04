package org.lpp.constructs.sentencias;

import io.norberg.automatter.AutoMatter;
import java.util.List;
import org.lpp.constructs.expresiones.Expresion;

@AutoMatter
public interface Para extends Sentencia {
  Expresion variable();
  Expresion desde();
  Expresion hasta();
  List<Sentencia> sentencias();
}
