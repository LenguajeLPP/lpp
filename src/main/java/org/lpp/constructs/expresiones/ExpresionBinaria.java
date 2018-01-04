package org.lpp.constructs.expresiones;

import io.norberg.automatter.AutoMatter;

@AutoMatter
public interface ExpresionBinaria extends Expresion {
  OperadorBinario operador();
  Expresion expr1();
  Expresion expr2();
}
