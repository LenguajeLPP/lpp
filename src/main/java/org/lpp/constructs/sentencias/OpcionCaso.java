package org.lpp.constructs.sentencias;

import io.norberg.automatter.AutoMatter;
import java.util.List;

@AutoMatter
public interface OpcionCaso {
  List<ExpresionOpcion> expresiones();
  List<Sentencia> sentencias();
}
