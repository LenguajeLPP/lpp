package org.lpp.constructs.subprogramas;

import io.norberg.automatter.AutoMatter;
import org.lpp.constructs.TablaSimbolos;

@AutoMatter
public interface Programa extends Subrutina {
  TablaSimbolos<DeclaracionTipo> tipos();
  TablaSubprogramas subprogramas();
}
