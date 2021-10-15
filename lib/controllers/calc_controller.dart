import 'package:get/get.dart';

class CalcController extends GetxController {
  var firstNumber = '10'.obs;
  var secondNumber = '20'.obs;
  var mathResult = '30'.obs;
  var operation = '+'.obs;

  /// Reiniciar datos de calculadora, boton: AC
  void resetAll() {
    firstNumber.value = '0';
    secondNumber.value = '0';
    mathResult.value = '0';
    operation.value = '+';
  }

  /// Cambiar numero de negativo a positivo.
  void changeNegativePositive() {
    if (mathResult.startsWith('-')) {
      mathResult.value = mathResult.value.replaceFirst('-', '');
    } else {
      mathResult.value = '-' + mathResult.value;
    }
  }

  void addNumber(String number) {
    // Si el numero ingresado es 0
    if (mathResult.value == '0') {
      mathResult.value = number;
      return;
    }

    // Si el número empieza por cero negativo.
    if (mathResult.value == '-0') {
      mathResult.value = '-' + number;
    }

    // Concatenar numero.
    mathResult.value += number;
  }

  /// Agregar punto decimal.
  void addDecimalPoint() {
    // Solo permitir un punto.
    if (mathResult.contains('.')) return;

    // Comprobar si esta empezando con cero.
    if (mathResult.startsWith('0')) {
      mathResult.value = '0.';
    } else {
      mathResult.value += '.';
    }
  }

  /// Seleccionar tipo de operacion.
  void selectOperation(String op) {
    operation.value = op;
    firstNumber.value = mathResult.value;
    mathResult.value = '0';
  }

  /// Borrar ultimo numero ingresado
  void deleteLastEntry() {
    if (mathResult.value.replaceAll('-', '').length > 1) {
      mathResult.value =
          mathResult.value.substring(0, mathResult.value.length - 1);
    } else {
      mathResult.value = '0';
    }
  }

  /// Calcular resultado
  void calculateResult() {
    double n1 = double.parse(firstNumber.value);
    double n2 = double.parse(mathResult.value);

    secondNumber.value = mathResult.value;

    switch (operation.value) {
      case '+':
        mathResult.value = '${n1 + n2}';
        break;
      case '-':
        mathResult.value = '${n1 - n2}';
        break;
      case 'x':
        mathResult.value = '${n1 * n2}';
        break;
      case '/':
        mathResult.value = '${n1 / n2}';
        break;
      default:
        break;
    }

    // Si termina en .0 quitar los decimales.
    if (mathResult.value.endsWith('.0')) {
      mathResult.value =
          mathResult.value.substring(0, mathResult.value.length - 2);
    }
  }
}
