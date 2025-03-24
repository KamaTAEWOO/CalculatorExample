import 'package:get/get.dart';

import 'CheckCondition.dart';

class CalculatorController extends GetxController {
  var userInput = ''.obs;
  var answer = '0'.obs;

  void clearInput() {
    userInput.value = '';
    answer.value = '0';
  }

  void deleteLast() {
    if (userInput.isNotEmpty) {
      userInput.value = userInput.substring(0, userInput.value.length - 1);
    }
  }

  void appendInput(String value) {
    userInput.value += value;
  }

  void calculateResult() {
    answer.value = equalPressed(userInput.value, answer.value);
    userInput.value = '';
  }
}