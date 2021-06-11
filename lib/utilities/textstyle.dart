import 'package:flutter/material.dart';

TextStyle defaultTextStyle({
  double fontSize,
  Color color,
  FontWeight fontWeight,
  FontStyle fontStyle,
}) {
  return TextStyle(
    fontStyle: fontStyle ?? FontStyle.normal,
    fontWeight: fontWeight ?? FontWeight.normal,
    fontSize: fontSize ?? 18,
    color: color ?? Colors.black,
  );
}
