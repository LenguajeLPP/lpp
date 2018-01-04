package org.lpp.constructs.expresiones;

import io.norberg.automatter.AutoMatter;

@AutoMatter
public interface Literal extends Expresion {
  TipoLiteral tipo();
  String valor();
}
