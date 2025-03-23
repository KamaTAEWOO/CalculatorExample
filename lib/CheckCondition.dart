// 조건문 함수

import 'package:math_expressions/math_expressions.dart';

bool isInvalidInput(String userInput, String value, List<String> operators) {
  // If input is empty and user tries to enter '0' or an operator
  if (userInput.isEmpty && (value == '0' || operators.contains(value))) {
    return false;
  }

  // If last character is already an operator and user tries to input another operator
  if (operators.contains(value)) {
    if (userInput.isEmpty || operators.contains(userInput[userInput.length - 1])) {
      return false;
    }
  }

  return true;
}

String equalPressed(String userInput, String answer) {
  String finaluserinput = userInput;
  finaluserinput = userInput.replaceAll('x', '*');

  Parser p = Parser();
  Expression exp = p.parse(finaluserinput);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);

  // Check if result is an integer
  if (eval == eval.toInt()) {
    return eval.toInt().toString();
  } else {
    return eval.toString();
  }
}

bool isOperator(String x) {
  if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
    return true;
  }
  return false;
}
