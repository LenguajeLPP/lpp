package org.lpp.constructs.subprogramas;

import org.lpp.constructs.TablaSimbolos;

public class TablaSubprogramas extends TablaSimbolos<Subprograma> {
  public Subprograma getFuncion(String id) {
    return simbolos
        .get(id)
        .stream()
        .findFirst()
        .filter(f -> f.tipoRetorno().isPresent())
        .orElse(null);
  }
}
