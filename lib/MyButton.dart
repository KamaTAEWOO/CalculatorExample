import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final String buttonText;
  final VoidCallback? buttontapped;

  MyButton({
    this.color,
    this.textColor,
    required this.buttonText,
    this.buttontapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5), // 필요하면 둥글게
        child: Material(
          color: color,
          child: InkWell(
            onTap: buttontapped,
            splashColor: Colors.white24, // 터치 물결 효과 색
            child: Container(
              height: 60, // 높이 지정 (원하는 만큼)
              alignment: Alignment.center,
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}