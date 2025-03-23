import 'package:flutter/material.dart';

import 'CalculatorButton.dart';
import 'CheckCondition.dart';
import 'MyButton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
            flex: 1,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userInput,
                        style: const TextStyle(fontSize: 45, color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ]),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  return keyPad(index);
                }),
          ),
        ],
      ),
    );
  }

  // 키패드 버튼 생성
  MyButton keyPad(int index) {
    switch (index) {
      case 0: // Clear Button
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
      case 1: // +/- button
        return MyButton(
          buttonText: buttons[index].value,
          color: Colors.blue[50],
          textColor: Colors.black,
        );
      case 2: // % Button
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
      case 3: // Delete Button
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
      case 18: // Equal_to Button
        return MyButton(
          buttontapped: () {
            setState(() {
              answer = equalPressed(userInput, answer);
            });
          },
          buttonText: buttons[index].value,
          color: Colors.orange[700],
          textColor: Colors.white,
        );
      default: // Other buttons
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
  }
}
