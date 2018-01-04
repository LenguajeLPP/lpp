package org.lpp.constructs.expresiones;

import io.norberg.automatter.AutoMatter;

@AutoMatter
public interface ExpresionUnaria extends Expresion {
  OperadorUnario operador();
  Expresion expr();
}
