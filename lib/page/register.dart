import 'package:and/controller/register-controller.dart';
import 'package:and/page/login.dart';
import 'package:and/utilities/navigator.dart';
import 'package:and/utilities/textstyle.dart';
import 'package:and/widget/custom-rounded-button.dart';
import 'package:and/widget/custom-textfield.dart';
import 'package:and/widget/pop-up-dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../utilities/textstyle.dart';
import '../colors/colors.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterController(),
      child: SafeArea(
          top: true,
          bottom: true,
          child: Scaffold(
            body: Builder(builder: (context) {
              final _controller = context.read<RegisterController>();
              final _listener = context.watch<RegisterController>();
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: ListView(
                  children: [
                    SizedBox(height: 24),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Daftar",
                        style: defaultTextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 24),
                    Column(
                      children: List.generate(5, (i) {
                        return _textField(
                          prefix: _controller.obsecureWidget(i, _listener.passwordObsecure,
                              onPress: () {
                            _controller.ispasswordObsecure();
                          }),
                          onChanged: (val) => _controller.onchangeSwitch(i, val),
                          controller: _controller.textEditingSwitch(i),
                          validatorController: _listener.validatorListener(i, _listener),
                          validatorMessage: _listener.messageValitorSwitch(i, _listener),
                          placeholder: _controller.placeholderSwitch(i),
                          formater: _controller.inputFormater(i),
                          obsecure: i == 3 ? _listener.passwordObsecure : false,
                        );
                      }),
                    ),
                    SizedBox(height: 24),
                    CustomRoundedButton(
                      onPress: _listener.fieldValidation
                          ? () async {
                              var _res = await _controller.submit().catchError((e) {
                                return e;
                              });
                              CustomDialog()
                                  .defaultDialog(context, title: "Hello", content: "$_res");
                            }
                          : null,
                      title: Text(
                        "Daftar",
                        style: defaultTextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 48),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sudah punya akun?",
                          style: defaultTextStyle(color: Colors.grey),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigate().pushAndRemoveUntilScreen(context, screen: LoginPage());
                          },
                          child: Text(
                            "Masuk",
                            style: defaultTextStyle(color: GREEN),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          )),
    );
  }

  CustomTextField _textField({
    TextEditingController controller,
    bool validatorController,
    String validatorMessage,
    Widget suffix,
    Function(String) onChanged,
    String placeholder,
    TextStyle textStyle,
    bool obsecure,
    List<TextInputFormatter> formater,
    Widget prefix,
  }) {
    return CustomTextField(
      prefix: prefix,
      inputFormatters: formater,
      textStyle: textStyle,
      obsecure: obsecure,
      suffix: suffix,
      heigth: 45,
      topPlaceHolder: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Text(
          placeholder,
          style: defaultTextStyle(color: Colors.grey),
        ),
      ),
      controller: controller,
      validatorController: validatorController,
      validatorMessage: validatorMessage,
      onChanged: onChanged,
    );
  }
}
