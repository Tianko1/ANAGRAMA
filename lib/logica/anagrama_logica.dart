class AnagramaLogica {
  static String limpiarTexto(String texto) {
    return texto
        .toLowerCase()
        .replaceAll(RegExp(r'[\s\p{P}]', unicode: true), '') // elimina espacios y signos
        .replaceAll("á", "a")
        .replaceAll("é", "e")
        .replaceAll("í", "i")
        .replaceAll("ó", "o")
        .replaceAll("ú", "u")
        .replaceAll("ü", "u");
  }

  static bool sonAnagramas(String frase1, String frase2) {
    final f1 = limpiarTexto(frase1).split('')..sort();
    final f2 = limpiarTexto(frase2).split('')..sort();
    return f1.join() == f2.join();
  }
}