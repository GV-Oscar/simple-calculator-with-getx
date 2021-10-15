import 'package:calculadora/controllers/calc_controller.dart';
import 'package:calculadora/widgets/line_separator.dart';
import 'package:calculadora/widgets/main_result.dart';
import 'package:calculadora/widgets/sub_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MathResults extends StatelessWidget {
  // Obtener instancia de controlador de calculadora.
  final calcCtrl = Get.find<CalcController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            SubResult(text: '${calcCtrl.firstNumber}'),
            SubResult(text: '${calcCtrl.operation}'),
            SubResult(text: '${calcCtrl.secondNumber}'),
            LineSeparator(),
            MainResultText(text: '${calcCtrl.mathResult}'),
          ],
        ));
  }
}
