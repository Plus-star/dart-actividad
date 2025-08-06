import 'dart:io';
import 'dart:math';

void main() { 
  String? opcion;

  do {
    limpiarConsola();
    mostrarMenu();
    opcion = stdin.readLineSync();
    limpiarConsola();

    switch (opcion) {
      case '1':
        calcularDistancia();
        break;
      case '2':
        calcularPromedio();
        break;
      case '3':
        calcularPuntajeFutbol();
        break;
      case '4':
        calcularPlanillaEmpleado();
        break;
      case '5':
        calcularHipotenusa();
        break;
      case '6':
        convertirCelsiusAFahrenheit();
        break;
      case '7':
        print("Saliendo del programa. ¡Hasta pronto!");
        break;
      default:
        print("Opción no válida. Por favor, intenta de nuevo.");
    }

    if (opcion != '7') {
      presionaEnterParaContinuar();
    }
  } while (opcion != '7');
}

void mostrarMenu() {
  print("\n" + "=" * 40);
  print("      MENÚ DE EJERCICIOS EN DART");
  print("=" * 40);
  print("Selecciona el ejercicio que deseas ejecutar:");
  print("1. Calcular Distancia (MRU)");
  print("2. Calcular Promedio de Estudiante");
  print("3. Calcular Puntaje de Equipo de Fútbol");
  print("4. Calcular Planilla de Empleado");
  print("5. Calcular Hipotenusa de Triángulo Rectángulo");
  print("6. Convertir 70°C a Fahrenheit");
  print("7. Salir");
  print("-" * 40);
  stdout.write("Ingresa tu opción: ");
}

void limpiarConsola() {
  if (Platform.isWindows) {
    print(Process.runSync("cls", [], runInShell: true).stdout);
  } else {
    print(Process.runSync("clear", [], runInShell: true).stdout);
  }
}

double leerDouble(String mensaje) {
  while (true) {
    try {
      stdout.write(mensaje);
      return double.parse(stdin.readLineSync()!);
    } catch (e) {
      print("Error: Por favor, ingresa un valor numérico válido.");
    }
  }
}

int leerInt(String mensaje) {
  while (true) {
    try {
      stdout.write(mensaje);
      return int.parse(stdin.readLineSync()!);
    } catch (e) {
      print("Error: Por favor, ingresa un número entero válido.");
    }
  }
}

/// 1. Calcula la distancia recorrida en un Movimiento Rectilíneo Uniforme.
void calcularDistancia() {
  print("\n--- 1. Calculadora de Distancia (MRU) ---");
  final double velocidad = leerDouble("Ingresa la velocidad constante (m/s): ");
  final double tiempo = leerDouble("Ingresa el tiempo (segundos): ");
  final double distancia = velocidad * tiempo;
  print("\n>> RESULTADO: La distancia recorrida es: ${distancia.toStringAsFixed(2)} metros.");
}

/// 2. Calcula el promedio de un estudiante a partir de tres notas.
void calcularPromedio() {
  print("\n--- 2. Calculadora de Promedio Semestral ---");
  final double nota1 = leerDouble("Ingresa la primera nota parcial: ");
  final double nota2 = leerDouble("Ingresa la segunda nota parcial: ");
  final double nota3 = leerDouble("Ingresa la tercera nota parcial: ");
  final double promedio = (nota1 + nota2 + nota3) / 3;
  print("\n>> RESULTADO: El promedio del semestre es: ${promedio.toStringAsFixed(2)}");
}

/// 3. Calcula el puntaje total de un equipo de fútbol.
void calcularPuntajeFutbol() {
  print("\n--- 3. Calculadora de Puntaje de Equipo de Fútbol ---");
  final int ganados = leerInt("Número de partidos ganados: ");
  final int empatados = leerInt("Número de partidos empatados: ");
  final int perdidos = leerInt("Número de partidos perdidos: ");
  final int puntajeTotal = (ganados * 3) + (empatados * 1);
  print("\n--- Resultados del Torneo ---");
  print("Partidos ganados: $ganados");
  print("Partidos empatados: $empatados");
  print("Partidos perdidos: $perdidos");
  print("----------------------------------------");
  print(">> RESULTADO: El puntaje total del equipo es: $puntajeTotal puntos.");
}

/// 4. Calcula el salario total de un empleado en un mes.
void calcularPlanillaEmpleado() {
  print("\n--- 4. Calculadora de Planilla Mensual ---");
  stdout.write("Nombre del empleado: ");
  final String nombre = stdin.readLineSync()!;
  final double horas = leerDouble("Cantidad de horas laboradas en el mes: ");
  final double tarifa = leerDouble("Tarifa por hora: ");
  final double totalDevengado = horas * tarifa;
  print("\n--- Planilla del Empleado ---");
  print("Nombre del empleado: $nombre");
  print("Cantidad de horas laboradas: $horas");
  print(">> RESULTADO: Total devengado en el mes: \$${totalDevengado.toStringAsFixed(2)}");
}

/// 5. Calcula la hipotenusa de un triángulo rectángulo.
void calcularHipotenusa() {
  print("\n--- 5. Calculadora de Hipotenusa ---");
  final double a = leerDouble("Ingresa la longitud del cateto 'a': ");
  final double b = leerDouble("Ingresa la longitud del cateto 'b': ");
  final double hipotenusa = sqrt(pow(a, 2) + pow(b, 2));
  print("\n>> RESULTADO: La hipotenusa del triángulo es: ${hipotenusa.toStringAsFixed(2)}");
}

/// 6. Convierte grados Celsius a Fahrenheit a partir de la entrada del usuario.
void convertirCelsiusAFahrenheit() {
  print("\n--- 6. Conversor de Temperatura ---");
  final double celsius = leerDouble("Ingresa los grados Celsius a convertir: ");
  final double fahrenheit = (celsius * 1.8) + 32;
  print("\n>> RESULTADO: $celsius grados Celsius equivalen a $fahrenheit grados Fahrenheit.");
}

void presionaEnterParaContinuar() {
  print("\n" + "-" * 40);
  stdout.write("Presiona Enter para volver al menú...");
  stdin.readLineSync();
}
