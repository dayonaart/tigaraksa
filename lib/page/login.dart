import 'package:and/controller/login-controller.dart';
import 'package:and/page/register.dart';
import 'package:and/utilities/navigator.dart';
import 'package:and/utilities/textstyle.dart';
import 'package:and/widget/custom-button.dart';
import 'package:and/widget/custom-rounded-button.dart';
import 'package:and/widget/custom-textfield.dart';
import 'package:and/widget/pop-up-dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import '../colors/colors.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginController(),
      child: SafeArea(
        top: true,
        bottom: true,
        child: Scaffold(
          body: Container(
            decoration: _boxdecoration(),
            child: Builder(builder: (context) {
              final _controller = context.read<LoginController>();
              final _listener = context.watch<LoginController>();
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 24),
                    Text(
                      "Login",
                      style: defaultTextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 24),
                    _textField(
                        placeholder: "Email",
                        controller: _controller.emailController,
                        validatorMessage: _listener.validatorEmailMessage,
                        validatorController: _listener.emailValidator,
                        onChanged: (val) => _controller.onChangedEmail(val)),
                    _textField(
                        suffix: IconButton(
                            icon:
                                Icon(_listener.obsecure ? Icons.visibility_off : Icons.visibility),
                            onPressed: () => _controller.isobsecure()),
                        obsecure: _listener.obsecure,
                        placeholder: "Password",
                        controller: _controller.passwordController,
                        onChanged: (val) => _controller.onChangedPassword(val)),
                    SizedBox(height: 24),
                    _forgotLogin(context, _controller, listener: _listener),
                    SizedBox(height: 46),
                    _loginWithFacebook(),
                    SizedBox(height: 49),
                    _register(),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxdecoration() {
    return BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, stops: [
      0.6,
      1,
      0.4,
    ], colors: [
      Colors.white,
      Colors.green[200],
      Colors.yellow[100],
    ]));
  }

  Builder _register() {
    return Builder(builder: (context) {
      return Column(
        children: [
          Text("Belum punya Akun?", style: defaultTextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          CustomRoundedButton(
            onPress: () {
              Navigate().pushNewScreen(context, screen: RegisterPage());
            },
            title: Text(
              "Daftar Sekarang",
              style: defaultTextStyle(color: Colors.white),
            ),
          )
        ],
      );
    });
  }

  CustomOutlineButton _loginWithFacebook() {
    return CustomOutlineButton(
      onPress: () {},
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/social/facebook.png'),
            SizedBox(width: 10),
            Text(
              "Login With Facebook",
              style: defaultTextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Row _forgotLogin(
    context,
    LoginController _, {
    LoginController listener,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {},
          child: Text("Lupa Password"),
        ),
        Container(
          // width: 114,
          height: 48,
          child: RaisedButton(
              color: GREEN,
              onPressed: listener.fieldValidation
                  ? () async {
                      var _res = await _.submit().catchError((e) {
                        return e;
                      });
                      CustomDialog().defaultDialog(context, title: "Hello", content: "$_res");
                    }
                  : null,
              child: Row(
                children: [
                  Text(
                    "Masuk",
                    style: defaultTextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  Transform.rotate(
                      angle: math.pi / 1,
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                      ))
                ],
              )),
        )
      ],
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
  }) {
    return CustomTextField(
      textStyle: textStyle,
      obsecure: obsecure,
      suffix: suffix,
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
