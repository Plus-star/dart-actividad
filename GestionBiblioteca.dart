import 'dart:io';

List<Map<String, dynamic>> libros = [];

void main() {
  bool salir = false;

  while (!salir) {
    print("\n--- MENÚ DE BIBLIOTECA ---");
    print("1. Agregar libro");
    print("2. Listar libros");
    print("3. Actualizar libro");
    print("4. Eliminar libro");
    print("5. Salir");
    print("--------------------------");
    stdout.write("Selecciona una opción: ");

    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case '1':
        agregarLibro();
        break;
      case '2':
        listarLibros();
        break;
      case '3':
        actualizarLibro();
        break;
      case '4':
        eliminarLibro();
        break;
      case '5':
        salir = true;
        print("¡Hasta luego! Finalizando programa.");
        break;
      default:
        print("Opción no válida. Por favor, intenta de nuevo.");
    }
  }
}

void agregarLibro() {
  print("\n--- AGREGAR NUEVO LIBRO ---");

  String? titulo;
  do {
    stdout.write("Título: ");
    titulo = stdin.readLineSync();
    if (titulo == null || titulo.isEmpty) {
      print("Error: El campo de título no puede quedar vacío.");
    }
  } while (titulo == null || titulo.isEmpty);

  String? autor;
  RegExp autorRegExp = RegExp(r'^[a-zA-Z\s\.]+$');
  do {
    stdout.write("Autor: ");
    autor = stdin.readLineSync();
    if (autor == null || autor.isEmpty) {
      print("Error: El campo de autor не puede quedar vacío.");
      autor = null;
    } else if (!autorRegExp.hasMatch(autor)) {
      print("Error: El nombre del autor contiene caracteres no permitidos. Usa solo letras, espacios y puntos.");
      autor = null;
    }
  } while (autor == null);

  int? anio;
  int currentYear = DateTime.now().year;
  do {
    stdout.write("Año de publicación: ");
    String? anioStr = stdin.readLineSync();
    anio = null;
    if (anioStr != null && anioStr.isNotEmpty) {
      int? parsedAnio = int.tryParse(anioStr);
      if (parsedAnio != null) {
        if (parsedAnio > 0 && parsedAnio <= currentYear) {
          anio = parsedAnio;
        } else {
          print("Error: El año está fuera del rango permitido. Debe ser entre 1 y $currentYear.");
        }
      } else {
        print("Error: El formato del año es incorrecto. Ingresa solo números.");
      }
    } else {
      print("Error: El campo de año no puede quedar vacío.");
    }
  } while (anio == null);

  libros.add({
    'titulo': titulo,
    'autor': autor,
    'anio': anio,
  });

  print("¡Libro agregado exitosamente!");
}

void listarLibros() {
  print("\n--- LISTA DE LIBROS ---");

  if (libros.isEmpty) {
    print("No hay libros registrados en la biblioteca.");
  } else {
    for (int i = 0; i < libros.length; i++) {
      var libro = libros[i];
      print(
          "[$i] Título: ${libro['titulo']}, Autor: ${libro['autor']}, Año: ${libro['anio']}");
    }
  }
}

void actualizarLibro() {
  print("\n--- ACTUALIZAR LIBRO ---");
  listarLibros();

  if (libros.isEmpty) {
    return;
  }

  int? indice;
  do {
    stdout.write("Ingresa el índice del libro a actualizar: ");
    String? indiceStr = stdin.readLineSync();
    indice = null;
    if (indiceStr != null && indiceStr.isNotEmpty) {
      int? parsedIndice = int.tryParse(indiceStr);
      if (parsedIndice != null) {
        if (parsedIndice >= 0 && parsedIndice < libros.length) {
          indice = parsedIndice;
        } else {
          print("Error: El índice está fuera de rango. Debe ser entre 0 y ${libros.length - 1}.");
        }
      }
    } else {
      print("Error: El índice no puede estar vacío.");
    }
  } while (indice == null);

  print("Ingresa los nuevos datos (deja en blanco para no cambiar):");

  stdout.write("Nuevo título (${libros[indice]['titulo']}): ");
  String? nuevoTitulo = stdin.readLineSync();
  if (nuevoTitulo != null && nuevoTitulo.isNotEmpty) {
    libros[indice]['titulo'] = nuevoTitulo;
  }

  RegExp autorRegExp = RegExp(r'^[a-zA-Z\s\.]+$');
  while (true) {
    stdout.write("Nuevo autor (${libros[indice]['autor']}): ");
    String? nuevoAutor = stdin.readLineSync();
    if (nuevoAutor == null || nuevoAutor.isEmpty) {
      break;
    }
    if (autorRegExp.hasMatch(nuevoAutor)) {
      libros[indice]['autor'] = nuevoAutor;
      break;
    } else {
      print("Error: El nombre del autor contiene caracteres no permitidos. Usa solo letras, espacios y puntos, o déjalo vacío.");
    }
  }

  int currentYear = DateTime.now().year;
  while (true) {
    stdout.write("Nuevo año de publicación (${libros[indice]['anio']}): ");
    String? nuevoAnioStr = stdin.readLineSync();
    if (nuevoAnioStr == null || nuevoAnioStr.isEmpty) {
      break;
    }
    int? nuevoAnio = int.tryParse(nuevoAnioStr);
    if (nuevoAnio != null) {
      if (nuevoAnio > 0 && nuevoAnio <= currentYear) {
        libros[indice]['anio'] = nuevoAnio;
        break;
      } else {
        print("Error: El año está fuera del rango permitido (1-$currentYear). Déjalo vacío para no cambiarlo.");
      }
    } else {
      print("Error: El formato del año es incorrecto. Ingresa solo números o déjalo vacío.");
    }
  }

  print("¡Libro actualizado exitosamente!");
}

void eliminarLibro() {
  print("\n--- ELIMINAR LIBRO ---");
  listarLibros();

  if (libros.isEmpty) {
    return;
  }

  int? indice;
  do {
    stdout.write("Ingresa el índice del libro a eliminar: ");
    String? indiceStr = stdin.readLineSync();
    indice = null;
    if (indiceStr != null && indiceStr.isNotEmpty) {
      int? parsedIndice = int.tryParse(indiceStr);
      if (parsedIndice != null) {
        if (parsedIndice >= 0 && parsedIndice < libros.length) {
          indice = parsedIndice;
        } else {
          print("Error: El índice está fuera de rango. Debe ser entre 0 y ${libros.length - 1}.");
        }
      }
    } else {
      print("Error: El índice no puede estar vacío.");
    }
  } while (indice == null);

  var libroEliminado = libros.removeAt(indice);
  print(
      "El libro '${libroEliminado['titulo']}' ha sido eliminado exitosamente.");
}