package org.lpp.constructs.expresiones;

import io.norberg.automatter.AutoMatter;

@AutoMatter
public interface LiteralBooleano extends Expresion {
  boolean valor();
}
