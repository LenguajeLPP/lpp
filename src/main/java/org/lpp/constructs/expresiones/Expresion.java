package org.lpp.constructs.expresiones;

import org.lpp.constructs.Construct;

public interface Expresion extends Construct {
  default boolean isVariable() {
    return false;
  }
}
