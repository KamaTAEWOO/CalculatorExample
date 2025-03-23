import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'CalculatorButton.dart';
import 'CheckCondition.dart';
import 'MyButton.dart';
import 'ToastMessage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userInput = ''; // user input
  var answer = '0'; // result value

  // Array of button
  List<CalculatorButton> buttons = CalculatorButton.values;
  List<String> operators = ['/', 'x', '-', '+'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TAEWOO ~ Calculator"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ), //AppBar
      backgroundColor: Colors.white38,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userInput,
                      style: const TextStyle(fontSize: 45, color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.centerRight,
                    child: Text(
                      answer,
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  // Clear Button
                  if (index == 0) {
                    return MyButton(
                      buttontapped: () {
                        setState(() {
                          userInput = '';
                          answer = '0';
                        });
                      },
                      buttonText: buttons[index].value,
                      color: Colors.blue[50],
                      textColor: Colors.black,
                    );
                  }

                  // +/- button
                  else if (index == 1) {
                    return MyButton(
                      buttonText: buttons[index].value,
                      color: Colors.blue[50],
                      textColor: Colors.black,
                    );
                  }
                  // % Button
                  else if (index == 2) {
                    return MyButton(
                      buttontapped: () {
                        setState(() {
                          userInput += buttons[index].value;
                        });
                      },
                      buttonText: buttons[index].value,
                      color: Colors.blue[50],
                      textColor: Colors.black,
                    );
                  }
                  // Delete Buttonr
                  else if (index == 3) {
                    return MyButton(
                      buttontapped: () {
                        setState(() {
                          userInput =
                              userInput.substring(0, userInput.length - 1);
                        });
                      },
                      buttonText: buttons[index].value,
                      color: Colors.blue[50],
                      textColor: Colors.black,
                    );
                  }
                  // Equal_to Button
                  else if (index == 18) {
                    return MyButton(
                      buttontapped: () {
                        setState(() {
                          equalPressed();
                        });
                      },
                      buttonText: buttons[index].value,
                      color: Colors.orange[700],
                      textColor: Colors.white,
                    );
                  }

                  //  other buttons
                  else {
                    return MyButton(
                      buttontapped: () {
                        setState(() {
                          // user가 0부터 입력할 경우 제외
                          // 연산자부터 입력할 경우 제외
                          String value = buttons[index].value;
                          bool checkCondition = isInvalidInput(userInput, buttons[index].value, operators);
                          if (checkCondition) userInput += value;
                        });
                      },
                      buttonText: buttons[index].value,
                      color: isOperator(buttons[index].value)
                          ? Colors.blueAccent
                          : Colors.white,
                      textColor: isOperator(buttons[index].value)
                          ? Colors.white
                          : Colors.black,
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

// function to calculate the input operation
  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}
