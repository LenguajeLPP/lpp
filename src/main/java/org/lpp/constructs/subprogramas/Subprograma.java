package org.lpp.constructs.subprogramas;

import io.norberg.automatter.AutoMatter;
import java.util.List;
import java.util.Optional;
import org.lpp.constructs.tipos.Tipo;

@AutoMatter
public interface Subprograma extends Subrutina {
  String id();
  List<Parametro> parametros();
  Optional<Tipo> tipoRetorno();
}
