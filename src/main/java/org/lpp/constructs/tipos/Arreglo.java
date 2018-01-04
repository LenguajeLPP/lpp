package org.lpp.constructs.tipos;

import io.norberg.automatter.AutoMatter;
import java.util.List;

@AutoMatter
public interface Arreglo extends Tipo {
  List<Integer> dimensiones();
  Tipo subTipo();
}
