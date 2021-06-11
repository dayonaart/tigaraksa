import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  ValueChanged<String> onChanged;
  bool validatorController;
  double heigth;
  double fontSize;
  String validatorMessage;
  TextEditingController controller;
  List<TextInputFormatter> inputFormatters;
  TextInputType textInputType;
  Widget prefix;
  Widget suffix;
  FocusNode focusNode;
  double radiusCircular;
  bool enable;
  Widget topPlaceHolder;
  TextStyle textStyle;
  Color backgroundColor;
  String placeHolder;
  bool obsecure;
  CustomTextField({
    this.onChanged,
    this.validatorController,
    this.validatorMessage,
    this.textInputType,
    this.focusNode,
    this.controller,
    this.backgroundColor,
    this.suffix,
    this.topPlaceHolder,
    this.placeHolder,
    this.radiusCircular,
    this.prefix,
    this.textStyle,
    this.heigth,
    this.obsecure,
    this.fontSize,
    this.enable,
    this.inputFormatters,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ignore: missing_return
        Builder(builder: (context) {
          switch (topPlaceHolder == null) {
            case true:
              return Container();
              break;
            case false:
              return topPlaceHolder;
              break;
            default:
          }
        }),
        Container(
          height: heigth ?? 45,
          child: CupertinoTextField(
            obscureText: obsecure ?? false,
            padding: EdgeInsets.symmetric(horizontal: 20),
            textAlignVertical: TextAlignVertical.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radiusCircular ?? 5),
                color: backgroundColor ?? Colors.grey[200]),
            focusNode: focusNode,
            placeholder: placeHolder,
            style: textStyle ??
                TextStyle(
                  color: Colors.black,
                  fontSize: fontSize ?? 18,
                ),
            placeholderStyle: textStyle ??
                TextStyle(
                  color: Colors.grey,
                  fontSize: fontSize ?? 18,
                ),
            prefix: prefix ?? Container(),
            // ignore: missing_return
            suffix: Builder(builder: (context) {
              switch (suffix == null) {
                case true:
                  return Padding(
                    padding: const EdgeInsetsDirectional.only(end: 10),
                    // ignore: missing_return
                    child: Builder(builder: (context) {
                      switch (validatorController && validatorMessage != null) {
                        case true:
                          return Tooltip(
                            message: validatorMessage,
                            child: Icon(Icons.error_outline_rounded, color: Colors.red),
                          );
                          break;
                        case false:
                          return Container();
                          break;
                        default:
                      }
                    }),
                  );
                  break;
                case false:
                  return suffix;
                  break;
                default:
              }
            }),
            enabled: enable ?? true,
            keyboardType: textInputType ?? TextInputType.text,
            inputFormatters: inputFormatters ?? null,
            onChanged: onChanged,
            controller: controller,
          ),
        ),
      ],
    );
  }
}
