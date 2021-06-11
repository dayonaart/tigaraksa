import 'package:flutter/material.dart';
import '../colors/colors.dart';

class CustomRoundedButton extends StatelessWidget {
  final Function() onPress;
  final Color color;
  final Widget title;
  final double height;
  final double width;
  final double roundedRadius;
  CustomRoundedButton({
    @required this.onPress,
    this.color,
    this.height,
    this.width,
    this.title,
    this.roundedRadius,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 48,
      child: RaisedButton(
        child: title ?? Container(),
        color: color ?? GREEN,
        onPressed: onPress,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(roundedRadius ?? 30)),
      ),
    );
  }
}
