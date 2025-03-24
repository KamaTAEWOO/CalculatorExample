import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'CalculatorController.dart';
import 'CheckCondition.dart';
import 'CalculatorButton.dart';
import 'MyButton.dart';

class HomePage extends StatelessWidget {
  final CalculatorController controller = Get.put(CalculatorController());
  final List<CalculatorButton> buttons = CalculatorButton.values;
  final List<String> operators = ['/', 'x', '-', '+'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TAEWOO ~ Calculator"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.white38,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Obx(() => Text(
                      controller.userInput.value,
                      style: const TextStyle(fontSize: 45, color: Colors.white),
                    )),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Obx(() => Text(
                      controller.answer.value,
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (BuildContext context, int index) {
                return keyPad(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  MyButton keyPad(int index) {
    String value = buttons[index].value;
    Color buttonColor = isOperator(value) ? Colors.blueAccent : Colors.white;
    Color textColor = isOperator(value) ? Colors.white : Colors.black;

    return MyButton(
      buttontapped: () {
        switch (value) {
          case 'C':
            controller.clearInput();
            break;
          case 'DEL':
            controller.deleteLast();
            break;
          case '=':
            controller.calculateResult();
            break;
          case '+/-':
          case '%':
            return;
          default:
            if (isInvalidInput(controller.userInput.value, value, operators)) {
              controller.appendInput(value);
            }
        }
      },
      buttonText: value,
      color: buttonColor,
      textColor: textColor,
    );
  }

  bool isOperator(String value) {
    return operators.contains(value);
  }
}