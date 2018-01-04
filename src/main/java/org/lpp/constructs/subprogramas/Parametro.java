package org.lpp.constructs.subprogramas;

import io.norberg.automatter.AutoMatter;
import org.lpp.constructs.Construct;
import org.lpp.constructs.Variable;

@AutoMatter
public interface Parametro extends Construct {
  boolean referencia();
  Variable variable();
}
