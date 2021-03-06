import 'package:class1/constants/color_constants.dart';
import 'package:flutter/material.dart';

Widget loginSignUpTextField(
    {required double width,
    required String labelText,
    bool obscuretext = false,
    validator,
    TextInputType? keyboardtype,
    TextInputAction? textInputAction = TextInputAction.next,
    Color cursorColor = cursorColor,
    Color borderColor = borderColor,
    double borderradius = 0.0,
    IconData? prefixIcon,
    Color prefixIconColor = prefixIconColor,
    Widget? suffixIcon,
    Color? suffixIconColor = suffixIconColor,
    onPressedSuffixIcon}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: width,
      child: TextFormField(
        obscureText: obscuretext,
        validator: validator,
        keyboardType: keyboardtype,
        textInputAction: textInputAction,
        cursorColor: cursorColor,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(borderradius)),
            label: Text(labelText),
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(16),
                    child: Icon(
                      prefixIcon,
                      color: prefixIconColor,
                    ),
                  )
                : null,
            suffixIconColor: suffixIconColor,
            suffixIcon: suffixIcon != null
                ? IconButton(
                    icon: suffixIcon,
                    onPressed: onPressedSuffixIcon,
                  )
                : null),
      ),
    ),
  );
}
