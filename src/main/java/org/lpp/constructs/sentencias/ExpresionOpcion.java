package org.lpp.constructs.sentencias;

import io.norberg.automatter.AutoMatter;
import java.util.Optional;
import org.lpp.constructs.expresiones.Expresion;

@AutoMatter
public interface ExpresionOpcion {
  Expresion expr();
  Optional<Expresion> exprRango();
}
