import 'package:flutter/material.dart';

class Navigate {
  pushNewScreen(
    context, {
    @required Widget screen,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  pushNewReplacementScreen(
    context, {
    @required Widget screen,
  }) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  pushAndRemoveUntilScreen(
    context, {
    @required Widget screen,
  }) {
    return Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => screen), (route) => false);
  }
}
