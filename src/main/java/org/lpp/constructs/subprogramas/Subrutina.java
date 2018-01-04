package org.lpp.constructs.subprogramas;

import java.util.List;
import org.lpp.constructs.Construct;
import org.lpp.constructs.TablaSimbolos;
import org.lpp.constructs.Variable;
import org.lpp.constructs.sentencias.Sentencia;

public interface Subrutina extends Construct {
  TablaSimbolos<Variable> variables();
  List<Sentencia> sentencias();
}
