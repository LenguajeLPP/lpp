package org.lpp.constructs.tipos;

import io.norberg.automatter.AutoMatter;

@AutoMatter
public interface Archivo extends Tipo {
  Tipo subTipo();
}
