package org.lpp.constructs.subprogramas;

import io.norberg.automatter.AutoMatter;
import org.lpp.constructs.Construct;
import org.lpp.constructs.tipos.Tipo;

@AutoMatter
public interface DeclaracionTipo extends Construct {
  String id();
  Tipo tipo();
}
