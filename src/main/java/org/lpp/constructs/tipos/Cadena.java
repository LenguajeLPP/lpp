package org.lpp.constructs.tipos;

import io.norberg.automatter.AutoMatter;
import java.util.Optional;

@AutoMatter
public interface Cadena extends Tipo {
  Optional<Integer> longitud();
}
