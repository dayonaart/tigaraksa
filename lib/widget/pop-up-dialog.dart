import 'package:flutter/material.dart';

class CustomDialog {
  defaultDialog(
    context, {
    String title,
    String content,
  }) {
    return showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text(title ?? ""),
          content: new Text(content ?? ""),
        ));
  }
}
