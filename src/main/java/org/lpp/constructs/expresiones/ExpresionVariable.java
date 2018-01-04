package org.lpp.constructs.expresiones;

import io.norberg.automatter.AutoMatter;

@AutoMatter
public interface ExpresionVariable extends Expresion {
  String id();

  default boolean isVariable() {
    return true;
  }
}
