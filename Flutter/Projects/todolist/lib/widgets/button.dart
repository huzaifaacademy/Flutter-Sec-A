import 'package:flutter/material.dart';

Widget buttonWidget(
    {required Size size,
    required String text,
    required onpressed,
    double topPadding = 15,
    Color textColor = Colors.white,
    double textSize = 18,
    double widthPercent = 0.8,
    double heightPercent = 0.06,
    double radius = 15,
    Color buttonColor = Colors.black}) {
  return Padding(
    padding: EdgeInsets.only(top: topPadding),
    child: ElevatedButton(
        onPressed: onpressed,
        child: Text(
          text,
          style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: textSize),
        ),
        style: ElevatedButton.styleFrom(
            minimumSize:
                Size(size.width * widthPercent, size.height * heightPercent),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius)),
            elevation: 10,
            primary: buttonColor)),
  );
}
