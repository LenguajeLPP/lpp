package org.lpp.constructs.expresiones;

import io.norberg.automatter.AutoMatter;
import java.util.List;

@AutoMatter
public interface ExpresionFuncion extends Expresion {
  String id();
  List<Expresion> argumentos();
}
