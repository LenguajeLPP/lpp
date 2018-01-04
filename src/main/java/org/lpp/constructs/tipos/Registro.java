package org.lpp.constructs.tipos;

import io.norberg.automatter.AutoMatter;
import org.lpp.constructs.TablaSimbolos;
import org.lpp.constructs.Variable;

@AutoMatter
public interface Registro extends Tipo {
  TablaSimbolos<Variable> variables();
}
