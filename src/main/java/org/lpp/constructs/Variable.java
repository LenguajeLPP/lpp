package org.lpp.constructs;

import io.norberg.automatter.AutoMatter;
import org.lpp.constructs.tipos.Tipo;

@AutoMatter
public interface Variable extends Construct {
  String id();
  Tipo tipo();
}
