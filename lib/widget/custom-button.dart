import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final Widget title;
  final Function() onPress;
  final double roundedRadius;
  final double height;
  final double width;
  CustomOutlineButton({
    this.title,
    @required this.onPress,
    this.height,
    this.roundedRadius,
    this.width,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 48,
      child: FlatButton(
        child: title ?? Container(),
        onPressed: onPress,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(roundedRadius ?? 30)),
      ),
    );
  }
}
