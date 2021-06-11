import 'package:and/api/api.dart';
import 'package:and/api/url.dart';
import 'package:and/model/login-payload-model.dart';
import 'package:and/static/static-key.dart';
import 'package:flutter/material.dart';
import '../utilities/regex.dart';

class LoginController extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obsecure = true;
  String validatorEmailMessage;
  bool emailValidator = false;
  bool passwordValidator = false;

  bool get fieldValidation => (emailController.text.length > 0 &&
      passwordController.text.length > 0 &&
      !emailValidator &&
      !passwordValidator);
  LoginPayloadModel get _payload => LoginPayloadModel(
      keyBlank: KEYBLANK, email: emailController.text, password: passwordController.text);
  bool get fieldValidator =>
      (emailController.text.length > 0 && passwordController.text.length > 0 && !emailValidator);
  void onChangedEmail(String val) {
    if (val.isEmailValidation()) {
      emailValidator = true;
      validatorEmailMessage = "Invalid Character";
      notifyListeners();
    } else {
      emailValidator = false;
      validatorEmailMessage = null;
      notifyListeners();
    }
  }

  void onChangedPassword(String val) {
    if (val.length <= 0) {
      passwordValidator = true;
      notifyListeners();
    } else {
      passwordValidator = false;
      notifyListeners();
    }
  }

  // ignore: missing_return
  Function() isobsecure() {
    obsecure = !obsecure;
    notifyListeners();
  }

  Future<dynamic> submit() async {
    var _res = await Api().postData(endpoint: LOGIN_URL, payload: _payload.toJson());
    print(_res);
  }
}
