import 'package:and/api/api.dart';
import 'package:and/api/url.dart';
import 'package:and/model/register-payload-model.dart';
import 'package:and/static/static-key.dart';
import 'package:and/utilities/input-formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utilities/regex.dart';

class RegisterController extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController whatsappController = TextEditingController();
  bool passwordObsecure = true;
  String validatorEmailMessage;
  String validatorPasswordMessage;
  String validatorPhoneMessage;
  String validatorWhatsappMessage;
  String validatorNameMessage;
  bool emailValidator = false;
  bool passwordValidator = false;
  bool phoneValidator = false;
  bool whatsappValidator = false;
  bool nameValidator = false;
  bool get fieldValidation => (emailController.text.length > 0 &&
      passwordController.text.length > 0 &&
      phoneController.text.length > 0 &&
      nameController.text.length > 0 &&
      !emailValidator &&
      !passwordValidator &&
      !phoneValidator &&
      !nameValidator);
  RegisterPayloadModel get _payload => RegisterPayloadModel(
        keyBlank: KEYBLANK,
        phone: phoneController.text.replaceAll("-", ""),
        name: nameController.text,
        password: passwordController.text,
        email: emailController.text,
      );
  void ispasswordObsecure() {
    passwordObsecure = !passwordObsecure;
    notifyListeners();
  }

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

  void onChangedPhone(String val) {
    if (val.isNumberValidation()) {
      phoneValidator = true;
      validatorPhoneMessage = "Only Number";
      notifyListeners();
    } else {
      phoneValidator = false;
      validatorPhoneMessage = null;
      notifyListeners();
    }
  }

  void onChangedWhatsapp(String val) {
    if (val.isNumberValidation()) {
      whatsappValidator = true;
      validatorWhatsappMessage = "Only Number";
      notifyListeners();
    } else {
      whatsappValidator = false;
      validatorWhatsappMessage = null;
      notifyListeners();
    }
  }

  void onChangedName(String val) {
    if (val.isEmailValidation()) {
      nameValidator = true;
      validatorNameMessage = "Invalid Character";
      notifyListeners();
    } else {
      nameValidator = false;
      validatorNameMessage = null;
      notifyListeners();
    }
  }

  void onChangedPassword(String val) {
    if (val.length < 6) {
      passwordValidator = true;
      validatorPasswordMessage = "minimal 6 karakter";
      notifyListeners();
    } else {
      passwordValidator = false;
      validatorPasswordMessage = null;
      notifyListeners();
    }
  }

  void onchangeSwitch(int i, String val) {
    switch (i) {
      case 0:
        return onChangedName(val);
        break;
      case 1:
        return onChangedPhone(val);
        break;
      case 2:
        return onChangedEmail(val);
        break;
      case 3:
        return onChangedPassword(val);
        break;
      case 4:
        return onChangedWhatsapp(val);
        break;
      default:
    }
  }

  // ignore: missing_return
  TextEditingController textEditingSwitch(int i) {
    switch (i) {
      case 0:
        return nameController;
        break;
      case 1:
        return phoneController;
        break;
      case 2:
        return emailController;
        break;
      case 3:
        return passwordController;
        break;
      case 4:
        return whatsappController;
        break;
      default:
    }
  }

  // ignore: missing_return
  String placeholderSwitch(int i) {
    switch (i) {
      case 0:
        return "Nama Lengkap";
        break;
      case 1:
        return "No. Handphone";
        break;
      case 2:
        return "Email";
        break;
      case 3:
        return "Password";
        break;
      case 4:
        return "No. Whatsapp";
        break;
      default:
    }
  }

  // ignore: missing_return
  String messageValitorSwitch(int i, RegisterController _) {
    switch (i) {
      case 0:
        return _.validatorNameMessage;
        break;
      case 1:
        return _.validatorPhoneMessage;
        break;
      case 2:
        return _.validatorEmailMessage;
        break;
      case 3:
        return _.validatorPasswordMessage;
        break;
      case 4:
        return _.validatorWhatsappMessage;
        break;
      default:
    }
  }

  // ignore: missing_return
  bool validatorListener(int i, RegisterController _) {
    switch (i) {
      case 0:
        return _.nameValidator;
        break;
      case 1:
        return _.phoneValidator;
        break;
      case 2:
        return _.emailValidator;
        break;
      case 3:
        return _.passwordValidator;
        break;
      case 4:
        return _.whatsappValidator;
        break;
      default:
    }
  }

  List<TextInputFormatter> inputFormater(int i) {
    switch (i) {
      case 1:
        return [CustomInputFormatter(mask: "xxxx-xxxx-xxxx", separator: "-")];
        break;
      case 4:
        return [CustomInputFormatter(mask: "xxxx-xxxx-xxxx", separator: "-")];
        break;
      default:
        return null;
    }
  }

  Widget obsecureWidget(
    int i,
    bool obsecured, {
    Function() onPress,
  }) {
    switch (i) {
      case 3:
        return IconButton(
            icon: Icon(obsecured ? Icons.visibility_off : Icons.visibility), onPressed: onPress);
        break;
      default:
        return null;
    }
  }

  Future<dynamic> submit() async {
    var _res = await Api().postData(endpoint: LOGIN_URL, payload: _payload.toJson());
    print(_res);
  }
}
