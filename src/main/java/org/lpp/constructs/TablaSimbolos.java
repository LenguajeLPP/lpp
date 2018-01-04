package org.lpp.constructs;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.ListMultimap;
import java.util.Collection;
import java.util.Set;

public class TablaSimbolos<S> {
  protected ListMultimap<String, S> simbolos = ArrayListMultimap.create();

  public S get(String id) {
    return simbolos.get(id).stream().findFirst().orElse(null);
  }

  public void add(String id, S simbolo) {
    simbolos.put(id, simbolo);
  }

  public Set<String> keySet() {
    return simbolos.keySet();
  }

  public Collection<S> values() {
    return simbolos.values();
  }
}
