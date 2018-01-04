package org.lpp.constructs.sentencias;

import io.norberg.automatter.AutoMatter;
import java.util.List;
import org.lpp.constructs.expresiones.Expresion;

@AutoMatter
public interface Escribir extends Sentencia {
  Expresion variable();
  List<Expresion> expresiones();
}
