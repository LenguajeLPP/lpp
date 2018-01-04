package org.lpp.constructs.expresiones;

import io.norberg.automatter.AutoMatter;

@AutoMatter
public interface ExpresionPropiedad extends Expresion {
  Expresion expr();
  String idPropiedad();

  default boolean isVariable() {
    return true;
  }
}
