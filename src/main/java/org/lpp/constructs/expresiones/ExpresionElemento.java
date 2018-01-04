package org.lpp.constructs.expresiones;

import io.norberg.automatter.AutoMatter;
import java.util.List;

@AutoMatter
public interface ExpresionElemento extends Expresion {
  Expresion expr();
  List<Expresion> indices();

  default boolean isVariable() {
    return true;
  }
}
